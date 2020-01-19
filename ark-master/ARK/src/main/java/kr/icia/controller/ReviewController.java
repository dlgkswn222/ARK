package kr.icia.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.icia.domain.Criteria;
import kr.icia.domain.PageDTO;
import kr.icia.domain.ReplyVO;
import kr.icia.domain.ReviewVO;
import kr.icia.service.ReviewService;
import kr.icia.service.UploadFileUtils1;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {
   @Setter(onMethod_=@Autowired)
   private ReviewService service;
   
   @Resource(name="uploadPath")
   private String uploadPath;
   
   
   
   @GetMapping(value ="/register",produces=
         MediaType.APPLICATION_JSON_UTF8_VALUE)
   @PreAuthorize("isAuthenticated()")
      public void register(Model model) throws Exception{
      log.info(service.Category());
      ObjectMapper mapper = new ObjectMapper();
      
      String JString = mapper.writeValueAsString(service.Category());
      model.addAttribute("category",JString);
      
   }
   
   @SuppressWarnings("unlikely-arg-type")
   @PostMapping("/register")
   @PreAuthorize("isAuthenticated()")
   public String register(ReviewVO review,RedirectAttributes rttr,MultipartFile file) throws Exception{
       String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
       String ymdPath = UploadFileUtils1.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월일 폴더를 생성
       String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
      
       log.info("파일 존재여부:" +file);
      
       if(file.getOriginalFilename()!= null && !file.getOriginalFilename().equals("")&&!file.equals("")) {
           // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
           fileName =  UploadFileUtils1.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

           // 
           // gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
           review.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
           review.setGdsthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
           
          } else {  // 첨부된 파일이 없으면
         
             fileName = File.separator + "none.png";
           // 미리 준비된 none.png파일을 대신 출력함
             review.setGdsImg(fileName);
             review.setGdsthumbimg(fileName);
          }
          review.setGdsImg(review.getGdsImg().replace("\\", "/"));
         review.setGdsthumbimg(review.getGdsthumbimg().replace("\\", "/"));
         
         service.register(review);
       
   
         return "redirect:/review/list";
      }
   
   @GetMapping("/modify")
   public void modify(@RequestParam("num")Long num,@ModelAttribute("cri") Criteria cri,Model model) {
      log.info("가져오다");
      model.addAttribute("review",service.get(num));
   }
   
   @PostMapping("/modify")
   public String modify(ReviewVO review,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr
         ,Principal principal,Authentication authentication)  {
      String result = "확인";
      
      log.info("포스트 수정"+review);
      
      if(principal!=null) {
          UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
          String writer= userDetails.getUsername();
          review.setWriter(writer);
          
      if (service.modify(review)) {
         rttr.addFlashAttribute("result","성공적");
      result ="성공하였습니다";
      log.info(result);
      }
      rttr.addAttribute("pageNum", cri.getPageNum());
      rttr.addAttribute("amount", cri.getAmount());

      
      }
      return "redirect:/review/list";
   }
   
   
   @GetMapping(value="/get")
   public void get(@RequestParam("num")Long num,@ModelAttribute("cri") Criteria cri,Model model,Principal principal) {
      log.info("가져오다");
      model.addAttribute("review",service.count(num));
      model.addAttribute("review",service.get(num));
        
         
      List<ReplyVO> reply =service.replyList(num);
        model.addAttribute("reply",reply);
   
        if(principal!=null) {
      String users   =  principal.getName();
           
      model.addAttribute("users",users);   
      
           
        }else {
           String user= "";
          
           model.addAttribute("users", user);
         
        }
   
   }
   
   
   
   @GetMapping("/list")
   public void list(Criteria cri,Model model) throws Exception {
      log.info("목록");
      int total = service.getTotal(cri);
      
      model.addAttribute("list",service.getList(cri));
      model.addAttribute("pageMaker",new PageDTO(cri,total));
   }


   

   @PostMapping("/remove")
   public String remove(@RequestParam("num") Long num,@ModelAttribute("cri") Criteria cri,ReplyVO reply,
                     RedirectAttributes rttr) {
      log.info("삭제"+num);
      service.deleteReplyAll(reply);
      if(service.remove(num)) {
         
         rttr.addFlashAttribute("result","success");
         
      }
      rttr.addAttribute("pageNum", cri.getPageNum());
      rttr.addAttribute("amount", cri.getAmount());

      return "redirect:/review/list";
   }
   
   @ResponseBody
   @ResponseStatus(value=HttpStatus.OK)
   @RequestMapping(value = "/get/registReply",method = {RequestMethod.GET,RequestMethod.POST})
   public void registReply(ReplyVO reply,  HttpSession session,Authentication authentication) throws Exception {
   
      UserDetails userDetails = (UserDetails) authentication.getPrincipal();
      String userid= userDetails.getUsername();
        
        reply.setUserId(userid);
        log.info("유저 아이디는"+userid);
        log.info("저장 내용"+reply);
        
        service.registReply(reply);

        
   } 
   
   @ResponseBody
   @RequestMapping(value = "/get/deleteReply", method = RequestMethod.POST)
   public void getReplyList(ReplyVO reply,  HttpSession session,Authentication authentication) throws Exception {
   
   UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
   String userid= userDetails.getUsername();
   
     reply.setUserId(userid);
    
     
     service.deleteReply(reply);
     
    
    }
   @ResponseBody
   @GetMapping("/get/replyList")
   public List<ReplyVO> getReplyList(@RequestParam("num") Long num) throws Exception {
   
      List<ReplyVO> reply = service.replyList(num);
    
    return reply;
   } 
   @ResponseBody
   @RequestMapping(value = "/get/modifyReply", method = RequestMethod.POST)
   public int modifyReply(ReplyVO reply, HttpSession session,Authentication authentication
         ,Principal principal) throws Exception {
   
    
    int result = 0;
    
    if(principal!=null) {
    
       UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
       String userid= userDetails.getUsername();
   
   log.info(reply);    
     reply.setUserId(userid);
     service.modifyReply(reply);
    
     result = 1;
     log.info(result);
    }
    return result;
   } 
   
   //ck 에디터에서 파일 업로드
   @RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
   public void postCKEditorImgUpload(HttpServletRequest req,
         HttpServletResponse res,
         @RequestParam List<MultipartFile> upload) throws Exception {


   // 랜덤 문자 생성
   UUID uid = UUID.randomUUID();
   OutputStream out = null;
   PrintWriter printWriter = null;

   // 인코딩
   res.setCharacterEncoding("utf-8");
   res.setContentType("text/html;charset=utf-8");

   try {

    String fileName = ((MultipartFile) upload).getOriginalFilename(); // 파일 이름 가져오기
   byte[] bytes = ((MultipartFile) upload).getBytes();

   // 업로드 경로
   String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

   out = new FileOutputStream(new File(ckUploadPath));
   out.write(bytes);
   out.flush(); // out에 저장된 데이터를 전송하고 초기화

   String callback = req.getParameter("CKEditorFuncNum");
   printWriter = res.getWriter();
   String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면

   // 업로드시 메시지 출력
   printWriter.println("<script type='text/javascript'>"
     + "window.parent.CKEDITOR.tools.callFunction("
     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
     +"</script>");

   printWriter.flush();

   } catch (IOException e) { e.printStackTrace();
   } finally {
   try {
   if(out != null) { out.close(); }
   if(printWriter != null) { printWriter.close(); }
   } catch(IOException e) { e.printStackTrace(); }
   }

   return; 
   }

   
}