package kr.icia.controller;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.icia.domain.NewMemberVO;
import kr.icia.mapper.IdPwMapper;
import kr.icia.service.FindUtil;
import kr.icia.service.MailUtilService;
import kr.icia.service.NewMemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Controller
public class NewPassController {
	@Inject
	IdPwMapper idpw;
	
//	MemberController mem;
	
	
	@Inject
	NewMemberService service;
	
	@Setter(onMethod_=@Autowired)
	private BCryptPasswordEncoder pass;

	@RequestMapping(value ="/id" ,method = RequestMethod.GET)
	public void id() {	
	//아이디 찾기 페이지로 가기위한 get
	}
	
	@RequestMapping(value ="/id" ,method = RequestMethod.POST)
	public String idPOST(@Param("email")String email,Model model)  {
		log.info("email= "+email);
	List<NewMemberVO> id	= idpw.id(email);
	// 입력받은 이메일을 조회해서 id 리스트를 담아오는  부분이다
		log.info("id= "+id);
		model.addAttribute("id",id);
	// 가져온 id 를 다시 페이지에 보여주기위해 Attribute 해주고있다	
			return "/id";
		
	}
	
	
	
	@RequestMapping(value="/newPass" , method = RequestMethod.GET)
	  public void pass() {
		//패스워드 발급을 위한 get
	  } 
	@RequestMapping(value ="/newPass" , method = RequestMethod.POST
			,produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> findPwd(@RequestParam("id")String id,@RequestParam("email")String email)
			throws Exception{//패스워드 발급을위한 POST
		String newPwd = FindUtil.getNewPwd();
		// 랜덤패스워드를 가져오는 객체를 호출해서 newPwd 에 담아두고있다
		String pw= pass.encode(newPwd);
		// 담아둔 패스워드를 암호화하는 작업이다
		
		log.info(newPwd);
		log.info(pw);
		log.info(id);
		
		NewMemberVO v =	new NewMemberVO();
		//가져온 데이터를 담아 조회하기위한 VO를 호출하고있다
		v.setId(id);
		// 입력받은 ID 를 담고있다
		v.setPass(pw);
		// 암호화된 패스워드를 담고있다
		v.setUseremail(email);
		// 입력받은 이메을을 담고있다
	 
		service.update(v);
		//VO의 정보들을 가지고 회원정보를 변경하기위해 DB에 보내주었다
		
		String subject="[MIN-HA!]임시 비밀번호 발급 안내";
		
		String msg=""; 
		
		msg+="<div align='center' style='border:1px solid black; font-family:verdana'>"; 
		msg+="<h3 style='color: blue;'><strong>"+id;
		msg+="님</strong>의 임시 비밀번호 입니다 로그인후 비밀번호를 변경하세요</h3>";
		msg+="<p>임시 비밀번호 :<strong>"+newPwd+"</strong></div><br/>";
		
		MailUtilService.sendMail(email,subject,msg); 
	//위 내용을 받아 메일로 보내주는 쿼리이다 
		
		return service.userIdCheck2(v)==id? 
	// 그리고 입력받은 아이디가 체크가 완료되었다면 OK를 아니면 에러를 내보낸다
				new ResponseEntity<>("success",HttpStatus.OK)
			:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
			
	}
	
	 /*
	 * @RequestMapping(value = "/newPass" ,method = RequestMethod.POST) public void
	 * pass(Model model,String mem_email) throws Exception {
	 * 
	 * String keyCode = FindUtil.createKey(); model.addAttribute("ketCode",keyCode);
	 * 
	 * String sub = "[MIN-HA!] 비밀번호 찾기 인증코드 안내";
	 * 
	 * String msgi=""; msgi+
	 * ="<div align='center' style='border:1px solid black; font-family:verdana'>";
	 * 
	 * msgi+="<h3 style='color: blue;'>비밀번호 찾기 인증코드입니다 </h3>";
	 * msgi+="<div style='font-size:130%'>"; msgi+="비밀번호 찾기 페이지로 돌아가 인증코드<strong>";
	 * msgi+=keyCode+"</strong> 를 입력해주세요</div><br/>";
	 * mem.sendMail(mem_email,sub,msgi); }
	 */
}
