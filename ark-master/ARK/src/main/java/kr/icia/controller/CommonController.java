package kr.icia.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.icia.domain.BoardVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.LiketoVO;
import kr.icia.domain.PageDTO;
import kr.icia.service.MediaUtils;
import kr.icia.service.NewMemberService;
import kr.icia.service.adminService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONObject;

@Controller
@Log4j
public class CommonController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Setter(onMethod_=@Autowired)
	private BCryptPasswordEncoder pass;
	

@Setter(onMethod_=@Autowired)
private adminService aService;

@Autowired
private NewMemberService reg_service;
	
	
	//로그인
	@GetMapping("/customLogin")
	public void loginInput(String error,String logout,Model model) {
		
		if(error != null) 
			model.addAttribute("error","계정을 확인해주세요");
		
		if(logout !=null) 
				model.addAttribute("logout","로그아웃");
	}	
	/*
	 * 로그인 호출이 오면 처음에는 여기로 와서 확인한다 이후는 시큐리티 설정으로 
	 * 로그인 호출이 오면 로그인 처리를 해주는 영역을 나눠주었다
	 * 위치는 CustomUserDetailsService 이다
	 * 
	 */	
	
	
	
	
	@GetMapping("/customLogout")
	public void logoutGet() {
		log.info("custom logout");
		
	}
	
	@PostMapping("/customLogout")
	public void logoutPost() {
		log.info("post custom logout");
		
	}
	
	
	@GetMapping("/admin")
	public void admin(Model mo,Criteria cri) {
	
		mo.addAttribute("goodsList",aService.goodsListr(cri));
		
		int total =aService.total(cri);

	mo.addAttribute("pageMaker", new PageDTO(cri,total));
	
	
	}
	
	@GetMapping("/member")
	public void idCheck() {
		
	
	}
	@GetMapping("/test")
	public void test() {
	}
	
	@GetMapping("/test1")
	public void test1() {
	}
	
	@RequestMapping(value = "/member.do",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int idCheck(@Param("id")String id) {
		log.info("id="+id);
		int Check =reg_service.userIdCheck(id);
		log.info("Check="+Check);
		return Check;
	
	}

	
	
	
	
	
@RequestMapping(value = "/display",method = RequestMethod.GET)
public ResponseEntity<byte[]> displayFile(@RequestParam("name") String fileName) throws Exception{
	
	InputStream in = null;
	
	ResponseEntity<byte[]> entity = null;
	
	try {
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		HttpHeaders headers = new HttpHeaders();
		in = new FileInputStream(uploadPath+fileName);
		
		if(mType !=null) {
			headers.setContentType(mType);
		}else {
			fileName = fileName.substring(fileName.indexOf("_")+1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("content-Disposition","attachment; filename=\"" +new String(fileName.getBytes("UTF-8"),"ISO-8859-1"));
		}
		
		entity= new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		
	}catch (Exception e) {
	e.printStackTrace();
	entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	
	}finally {
		in.close();
	}
	return entity;
}
	
	

	
}
