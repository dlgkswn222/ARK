package kr.icia.controller;



import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.icia.domain.Criteria;
import kr.icia.domain.ReplyPageDTO;
import kr.icia.domain.ReplyVO;
import kr.icia.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor

public class ReplyController {
	
	private ReplyService service;
	
	// 요청이/ REPLIES/NEW 로 오면
	// 정보를 조회해서 리턴 하는데, 정보 형태는 json 이고,전달 결과물은
	// 평범한 문자열 형태.
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/new",consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	
	
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
	// @RequestBody 는 json 형태로 받는 값을 객체로 변환.	
		
	log.info("ReplyVO: "+vo);
	int insertCount=service.register(vo);
	log.info("Reply insert count:" +insertCount);
	
	return insertCount ==1 ?
		new ResponseEntity<>("success",HttpStatus.OK):
		new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
// 3항 연산자 이용	
//HttpStatus(페이지) 상태를 전달
// 리턴에 코드는 길지만 , 풀이하면,
// 정상 처리되면 정상 처리의 status 전달하고, 아니면 오류 status 전달.
			
	}
	// 댓글의 경우 , 게시물 별로 목록이 다르다.
	// 괄호안에{}  값은 변화할수있는 값이다 
	//												얻어진 값은 xml과 json으로 변환가능
	@GetMapping(value="/pages/{bno}/{page}",produces= {MediaType.APPLICATION_XML_VALUE,
												 MediaType.APPLICATION_JSON_UTF8_VALUE})

	public ResponseEntity<ReplyPageDTO>getList(@PathVariable("page")int page,
									 @PathVariable("bno")Long bno){
									//@PathVariable:url로 넘겨받은 값 이용
		log.info("getList......");
		
		
		
		Criteria cri = new Criteria(page,10);
		log.info(cri);
		
		return new ResponseEntity<>(service.getListPage(cri, bno)
												,HttpStatus.OK);
		// T<List<ReplyVO>> t = new t<>();
		// 댓글 목록을 출력하고, 정상처리 상태를 리턴.
	}	
	
	
	
	
	@GetMapping(value = "/{rno}",produces = {MediaType.APPLICATION_XML_VALUE,
										MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno")Long rno){
		log.info("get:  "+rno);
		
		
		return new ResponseEntity<>(service.read(rno),HttpStatus.OK); 
	}
	
	@PreAuthorize("principal.username==#vo.replyer")
	@DeleteMapping(value = "/{rno}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody ReplyVO vo,@PathVariable("rno")Long rno){
		log.info("remove: " +rno);
		// 댓글 삭제 요청시 전달 받은 json 값으로,
		// ReplyVO vo를 초기화 하고
		// 그값으로 현재 접속자와 댓글 작성자를 비교하여 일치하면 삭제.
		
		
		return service.remove(rno)==1?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
				}
	// rest client 에서 메소드를 delete 로 두고 동작확인.
	// http://localhost:8090/replies/댓글번호
	@PreAuthorize("principal.username==#vo.replyer")
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH}, value = "/{rno}",
			consumes="application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo,
									@PathVariable("rno")Long rno){
		// put , patch 둘다 수정처리 가르킴
		// 생성되는 정보의 형은 json 에 일반적인 문자열 이용
		// @RequestBody : json 으로 생성된 정보를 객체화.
		
		vo.setRno(rno);
		log.info("rno"+rno);
		log.info("modify "+vo);
		
		return service.modify(vo)==1? 
				  new ResponseEntity<>("modify success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
