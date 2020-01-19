package kr.icia.controller;

import java.io.File;
import java.security.Principal;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.icia.domain.NewMemberVO;
import kr.icia.domain.UserVO;
import kr.icia.service.MemberdaoService;
import kr.icia.service.UploadFileUtils1;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private MemberdaoService service;
	
	
	
	@Setter(onMethod_=@Autowired)
	private BCryptPasswordEncoder capass;
	
	
	@RequestMapping(value = "/member/mypage",method = RequestMethod.GET)
	public void mypage(Model mo,Authentication authentication
			,Principal principal) throws Exception{
		
	 UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
	 String userId= userDetails.getUsername();
		    //유저의 디테일을 객체화 해서 유저의 ID 를 가져오는 과정이다
		    
	log.info("id는 "+userId);
	NewMemberVO list =service.list(userId);
	//가져온 ID의 리스트를 VO 객체에 담아주고있다
	log.info("image : "+list);
	mo.addAttribute("list",list);
	//마이페이지 클릭시 회원의 정보를 조회한뒤 그 내용을 페이지로 가져와 뿌려주는것
	
	}
@SuppressWarnings("unlikely-arg-type")//마이페이지에서 온 내용들을 가져와서 수정해주고 있다
@RequestMapping(value = "/member/mypage",method = RequestMethod.POST)
	public String myPage(NewMemberVO vo,UserVO uvo,MultipartFile file,HttpSession session) throws Exception{
		 String imgUploadPath = uploadPath + File.separator + "imgUpload";  
		 // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		//이미지 저장 경로지를 설정해주고있는 쿼리이다
		 String ymdPath = UploadFileUtils1.calcPath(imgUploadPath);  
		 // 위의 폴더를 기준으로 연월일 폴더를 생성
		 String fileName = null;  
		 // 기본 경로와 별개로 작성되는 경로 + 파일이름
		  log.info("파일 존재여부:" +file);
		 
        if(file.getOriginalFilename()!= null && !file.getOriginalFilename().equals("")&&!file.equals("")) {
		  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
		  fileName =  UploadFileUtils1.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

		  // gdsImg에 원본 파일 경로 + 파일명 저장
		  uvo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  // gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
		  uvo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 첨부된 파일이 없으면
		
			 fileName = File.separator + "123.PNG";
		  // 미리 준비된 none.png파일을 대신 출력함
		  uvo.setGdsImg(fileName);
		  uvo.setGdsThumbImg(fileName);
		 }

		uvo.setGdsImg(uvo.getGdsImg().replace("\\", "/"));
		uvo.setGdsThumbImg(uvo.getGdsThumbImg().replace("\\", "/"));
		//이미지 경로 주소지를 넣어주고 있다
		uvo.setId(vo.getId());
		
		service.imgupdate(uvo);
		
		vo.setUserimg(uvo.getGdsThumbImg());
		// 유저이미지를 넣어주고있다
	    String pass =	capass.encode(vo.getPass());
		// 받아온 정보에서 패스워드부문을 암호화 하고있다
	    vo.setPass(pass);
		
		service.update(vo);
		//입력받은 정보를 가지고 업데이트 해주고있다
		return "redirect:/";
	}
	
	// 회원 탈퇴 get
		@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
		public void getWithdrawal() throws Exception {
//회원탈퇴 페이지를 위한 GET		
		}
		@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
		public String die(NewMemberVO vo,Model mo ,HttpSession session) throws Exception {
			vo.getPass();
			String id = vo.getId();
			NewMemberVO rogin = service.passCK(id);
	  boolean OKpass = capass.matches(vo.getPass(), rogin.getPass());
	  // 패스워드와 아이디를 비교해서 내용이 일치한다면
	  // boolean 값으로 되있는 OKpass가 트루가 되고
	  
			if(OKpass) {
			//트루가된 쿼리는 회원탈퇴처리를 실행
				vo.setPass(rogin.getPass());
			service.withdrawal(vo);
			session.invalidate();
			//마지막으로 세션 초기화를 해줌으로서 로그아웃을 해주고있다
			
			return "redirect:/";
			}
			//아니라면 1값 리턴
			mo.addAttribute("ko",1);
		 
			return "/withdrawal";
		}
		
}
