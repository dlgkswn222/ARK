package kr.icia.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.BoardAttachVO;
import kr.icia.domain.BoardVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.PageDTO;
import kr.icia.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//@Controller : 스프링 프레임워크에 이 클레스는 컨트롤러다. (알려주는)
// 컨트롤러 어노테이션은 컴포넌트 중에 하나.
// 위 어노테이션이 있으면 자동으로 메모리에 등록.
// 생성 ,초기화, 할당을 ,모두 자동처리
@Controller
@Log4j

// @RequestMapping : url 요청에 대한 처리를 명시.
// @webServlet 역할과 비슷. 

@RequestMapping("/board/*")
@AllArgsConstructor

public class BoardController {
	private BoardService service;

// @getMapping : 페이지 요청 방식이 get 일때

// @postMapping : 페이지 요청 방식이 post일때

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list" + cri);

		model.addAttribute("list", service.getList(cri));
		/* model.addAttribute("pageMaker",new PageDTO(cri,123)); */
		// 과거 jsp 에서는 request.setAttribute 로 ArrayList를 전달했다면
		// 여기서는 같은역할을 model 이 대신.

		int total = service.getTotal(cri);

		log.info("total:" + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

//디비에 저장하는 것이 아니라. 입력 화면을 보여주는 역할
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()") // 글 등록은 인증 사용자만
	public void register() {

	}

	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {
		// @Contriller 어노테이션이 붙고
		// 컴포넌트 스캔에 패키지가 지정되어 있다면
		// 매개변수 인자들은 스프링이 알아서 생성 할당함.

		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));

		}

		log.info("register : " + board);

		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());

		// 리다이렉트 시키면서 1회용 값을 전달
		return "redirect:/board/list";

	}

// 제목링크를 클릭하여 글상세 보기. get 방식.
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		// @ModelAttribute 는 자동으로 객체 할당 저장.
		// 자동으로 생성된 Criteria cri 를 모델값으로 저장하는데 ,
		// 저장명이 cri
		// @RequestParm : 요청 전달값으로 글번호 이용.

		log.info("/get");
		model.addAttribute("board", service.get(bno));
// jsp에서 request.setAttribute 하던 것과 비슷
// 전달값으로 명시만 하면 스프링이 자동 처리.
// 사용하는 부분만 추가 구현.

	}

	@PostMapping("/modify")
	@PreAuthorize("principal.username== #board.writer")
	public String modify(BoardVO board, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {

		log.info("modify : " + board);
		if (service.modify(board)) {

			rttr.addFlashAttribute("result", "success");
		}
		// 수정이 성공하면 success 메세지가 포함되어 이동
		// 실패해도 메세지 빼고 이동

		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("pageNum", cri.getPageNum());
		// addAttribute : 지속,url 표시됨
		// addFlashAttribute : 1회성, url 표시창에 전달되지않음
		// list 표시할때, @getMapping 겟으로 목록을 처리
		// 결과적으로 addFlashAttribute 하는경우
		// url에 값이 전달되지 않으므로 목록 표시가 1페이지로 들어감
		// 즉, 전달한 pageNum과 amount 가 적용되지 않음.
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	@PreAuthorize("principal.username==#writer")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr,
			String writer) {

		log.info("remove....." + bno);
		log.info("writer: " + writer);

		List<BoardAttachVO> attachList = service.getAttachList(bno);

		if (service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		// rttr.addAttribute("amount",cri.getAmount());
		// rttr.addAttribute("pageNum",cri.getPageNum());
		// rttr.addAttribute("type",cri.getType());
		// rttr.addAttribute("keyword",cri.getKeyword());

		return "redirect:/board/list" + cri.getListLink();
	}

	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		log.info("getAttachList: " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}

	private void deleteFiles(List<BoardAttachVO> attachList) {
		// 게시물당 첨부된 파일을 찾아서 디스크에서 삭제.
		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach file........");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"c:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);

			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
	
	// 고객센터
	
	@GetMapping("/faq")
	public void faq() {

	}

}// end
