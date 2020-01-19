package kr.icia.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.NewMemberVO;
import kr.icia.service.NewMemberService;
import lombok.Setter;

@Controller
@RequestMapping("/signup/*")
public class SignupController {

	@Inject
	private NewMemberService service;
	
	
	//암호화를 위해 준비
	@Setter(onMethod_=@Autowired)
	private BCryptPasswordEncoder pass;
	
	//회원가입
	@RequestMapping(value = "/signup.do",method = RequestMethod.POST)
	public String signupPost(NewMemberVO vo, RedirectAttributes rttr) {
		
		String Pass = pass.encode(vo.getPass());
		vo.setPass(Pass);
		//입력받아온 패스원드를 암호화한뒤 불러온 멤퍼VO에 넣어주고있다
		service.insert(vo);
		//입력바든 내용들을 DB에 저장하기위해 VO 객체에 담아 보내주고있다
		service.insert2(vo);
		//추가로 회원가입이 완료된 유저에게 권한을 주는 쿼리이다
		service.img(vo);
		//가입이 완료된 회원에게 임시 이미지를 부여해고있다
		
		rttr.addAttribute("OK","sign");
		return "redirect:/customLogin";
	//수행이 완료되면 sing 이라는 문자를 담아 OK로 Attribute 해주고 그내용은 
	//jsp에 돌아가 다시 조회후 확인을 해주고 로그인 화면으로 흐름을 보내준다
	}
	
	
	
	
}
