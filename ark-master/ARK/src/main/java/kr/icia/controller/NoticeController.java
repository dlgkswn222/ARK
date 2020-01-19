package kr.icia.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.Criteria;
import kr.icia.domain.ImgVO;
import kr.icia.domain.NoticeVO;
import kr.icia.domain.PageDTO;
import kr.icia.service.NoticeService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;
	
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {
		log.info("list");
		int total = service.getTotal(cri);
		
		model.addAttribute("list",service.getList(cri));
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	@GetMapping("/register")
	public void register() {
		
	
	}
	
	
	@PostMapping("/register")
	public String register(NoticeVO notice,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("register : "+notice);
		
		if(notice.getUpload()!=null) {
			notice.getUpload().forEach(upload->log.info(upload));
		}
		
		service.register(notice);
		
		rttr.addAttribute("result", notice.getNtnum());
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("ntnum")Long ntnum,@ModelAttribute("cri") Criteria cri,Model model) {
		log.info("가져오다");
		model.addAttribute("notice",service.get(ntnum));
	}
	

	@GetMapping("/get")
	public void get(@RequestParam("ntnum")Long ntnum,@ModelAttribute("cri") Criteria cri,Model model) {
		log.info("/get");
		model.addAttribute("notice",service.viewCnt(ntnum));
		model.addAttribute("notice",service.get(ntnum));
	}
	
	@PostMapping("/modify")
	public String modify(NoticeVO notice,RedirectAttributes rttr) {
		log.info("modify:"+notice);
		
		if(service.modify(notice)) {
			rttr.addAttribute("result","success");
		}

		return "redirect:/notice/list";
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("ntnum") Long ntnum,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("remove"+ntnum);
		List<ImgVO> uploadList = service.getUpload(ntnum);
		
		if(service.remove(ntnum)) {
			deleteFiles(uploadList);
			rttr.addAttribute("result","success");
			
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/notice/list";
	}
	
	
	//파일 다운로드
	@GetMapping(value="/getUpload", produces =MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	
	public ResponseEntity<List<ImgVO>> getUpload(Long ntnum){
		log.info("getUpload: "+ntnum);
		return new ResponseEntity<>(service.getUpload(ntnum),HttpStatus.OK);
	}
	
	
	
	private void deleteFiles(List<ImgVO> uploadList) {
		if (uploadList == null || uploadList.size() == 0) {
			return;
		}
		log.info("delete Img file.....");
		log.info(uploadList);
		
		uploadList.forEach(upload -> {
			try {
				Path file = Paths.get(
						"c:\\ARK\\"+upload.getUploadPath()+"\\"+upload.getUuid()+"_"+upload.getFileName());
						Files.deleteIfExists(file);
			}catch(Exception e) {
				e.printStackTrace();
			}
				});
	}
	

}//끝페이지
