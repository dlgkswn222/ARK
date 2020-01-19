package kr.icia.controller;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.icia.domain.ARK_ReplyVO;
import kr.icia.domain.AuthVO;
import kr.icia.domain.BoardAttachVO;
import kr.icia.domain.BoardVO;
import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.GoodsVO;
import kr.icia.domain.NewMemberVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.PageDTO;
import kr.icia.domain.ProductVO;
import kr.icia.service.BoardService;
import kr.icia.service.ProductService;
import kr.icia.service.UploadFileUtils1;
import kr.icia.service.adminService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

//@Controller : 스프링 프레임워크에 이 클레스는 컨트롤러다. (알려주는)
// 컨트롤러 어노테이션은 컴포넌트 중에 하나.
// 위 어노테이션이 있으면 자동으로 메모리에 등록.
// 생성 ,초기화, 할당을 ,모두 자동처리
@Controller 
@Log4j		

// @RequestMapping : url 요청에 대한 처리를 명시.
// @webServlet 역할과 비슷. 

@RequestMapping("/admin/*")
@AllArgsConstructor

public class AdminController {
	
private BoardService service;

private ProductService pService;

@Setter(onMethod_=@Autowired)
private adminService aService;





@Resource(name="uploadPath")
private String uploadPath;


// @getMapping : 페이지 요청 방식이 get 일때

// @postMapping : 페이지 요청 방식이 post일때

@GetMapping("/list")
public void list(Criteria cri, Model model ) {
	log.info("list"+ cri);
	
	model.addAttribute("list",service.getList(cri));
		/* model.addAttribute("pageMaker",new PageDTO(cri,123)); */
	// 과거 jsp 에서는 request.setAttribute 로 ArrayList를 전달했다면
	// 여기서는 같은역할을 model 이 대신.
	
	int total = service.getTotal(cri);
	
	log.info("total:"+total);
	model.addAttribute("pageMaker", new PageDTO(cri,total));
}	



	

//디비에 저장하는 것이 아니라. 입력 화면을 보여주는 역할
@GetMapping("/register")
@PreAuthorize("isAuthenticated()")// 글 등록은 인증 사용자만 
public void register() {
	
	
}

@PostMapping("/register")
@PreAuthorize("isAuthenticated()")
public String register(BoardVO board,RedirectAttributes rttr) {
	//@Contriller 어노테이션이 붙고
	// 컴포넌트 스캔에 패키지가 지정되어 있다면
	// 매개변수 인자들은 스프링이 알아서 생성 할당함.
	
	
	if(board.getAttachList()!=null) {
		board.getAttachList().forEach(attach->log.info(attach));
	
	}

	log.info("register : "+board);
	
	  service.register(board); 
	  rttr.addFlashAttribute("result", board.getBno());

		// 리다이렉트 시키면서 1회용 값을 전달
	return "redirect:/admin/list";
	
}

// 제목링크를 클릭하여 글상세 보기. get 방식.
@GetMapping({"/get","/modify"})
public void get(@RequestParam("bno") Long bno ,
			  @ModelAttribute("cri")Criteria cri ,Model model) {
	// @ModelAttribute 는 자동으로 객체 할당 저장.
	// 자동으로 생성된 Criteria cri 를 모델값으로 저장하는데 ,
	// 저장명이 cri
	// @RequestParm : 요청 전달값으로 글번호 이용.
	
log.info("/get");
model.addAttribute("board",service.get(bno));
// jsp에서 request.setAttribute 하던 것과 비슷
// 전달값으로 명시만 하면 스프링이 자동 처리.
// 사용하는 부분만 추가 구현.

}
@PostMapping("/modify")
@PreAuthorize("principal.username== #board.writer")
public String modify(BoardVO board , RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
	
	log.info("modify : "+board);
	if(service.modify(board)) {
	
		rttr.addFlashAttribute("result","success");
	}
	// 수정이 성공하면 success 메세지가 포함되어 이동
	// 실패해도 메세지 빼고 이동
	
	rttr.addAttribute("amount",cri.getAmount());
	rttr.addAttribute("pageNum",cri.getPageNum());
	//addAttribute		: 지속,url 표시됨
	//addFlashAttribute : 1회성, url 표시창에 전달되지않음
	// list 표시할때, @getMapping 겟으로 목록을 처리
	// 결과적으로 addFlashAttribute 하는경우
	// url에 값이 전달되지 않으므로 목록 표시가 1페이지로 들어감
	// 즉, 전달한 pageNum과 amount 가 적용되지 않음.
	rttr.addAttribute("type",cri.getType());
	rttr.addAttribute("keyword",cri.getKeyword());
	return "redirect:/admin/list";
}






@PostMapping("/remove")
@PreAuthorize("principal.username==#writer")
public String remove(@RequestParam("bno") Long bno, 
		@ModelAttribute("cri") Criteria cri, 
		RedirectAttributes rttr,
        String writer) {  
	
	log.info("remove....." +bno);
	 log.info("writer: " + writer);
	 
	List<BoardAttachVO> attachList = service.getAttachList(bno);
	
	
	if(service.remove(bno)) {
		deleteFiles(attachList);
		rttr.addFlashAttribute("result","success");
	}
	
	//rttr.addAttribute("amount",cri.getAmount());
	//rttr.addAttribute("pageNum",cri.getPageNum());
	//rttr.addAttribute("type",cri.getType());
	//rttr.addAttribute("keyword",cri.getKeyword());
	
	return "redirect:/admin/list"+cri.getListLink();
}

@GetMapping(value="/getAttachList",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
public ResponseEntity<List<BoardAttachVO>>
getAttachList(Long bno){
	log.info("getAttachList: " +bno);
	return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
}

private void deleteFiles(List<BoardAttachVO> attachList) {
	//게시물당 첨부된 파일을 찾아서 디스크에서 삭제.
	if(attachList==null || attachList.size()==0) {
		return;
	}
	
	log.info("delete attach file........");
	log.info(attachList);
	
	attachList.forEach(attach->{
		try {
			Path file= Paths.get("c:\\upload\\"+
		attach.getUploadPath()+"\\"+
		attach.getUuid()+"_"+
		attach.getFileName());
			Files.deleteIfExists(file);
				
					
					}catch (Exception e) {
						e.printStackTrace();
					}
	});
}
////////////// 회원관리 수정 정지 삭제 추가 

	
@GetMapping("/memberList")
public void memberList(Criteria cri, Model mo) {

	List<NewMemberVO> mem=aService.memberList(cri);
	
	log.info(mem);
	mo.addAttribute("mem",mem);
	
	int total = aService.MemberTotal(cri);

	log.info("total:" + total);
	mo.addAttribute("pageMaker", new PageDTO(cri, total));

}

@PostMapping("/memberList")
public String memberList() {
	return null;
}


@GetMapping("/productList")
public void productList(Model mo) {
	log.info("productList");
	
	List<ProductVO> vo = pService.getData();
	
	log.info("productList"+vo);
	mo.addAttribute("list",vo);
	
}

@PostMapping("/productList")
public void productList() {
	
}



//상품 등록 부문
@GetMapping(value = "/Reg",produces=
MediaType.APPLICATION_JSON_UTF8_VALUE)
public void reg(Model mo) throws Exception{
	log.info(aService.Category());
// Json 타입으로 문자를 내보내줄 ""(더블커터) 없이 나가는 문제를  오브젝트 멥퍼로 해결한것이다 요거좋네
	ObjectMapper mapper = new ObjectMapper();
String JString = mapper.writeValueAsString(aService.Category());
	mo.addAttribute("cat",JString);
//상품 등록페이지에 카테고리를 넣어주기위해 뿌려주고 있는 페이지이다	
}
@SuppressWarnings("unlikely-arg-type")
@PostMapping("/Reg")
public String reg(GoodsVO vo,MultipartFile file) throws Exception{
	 String imgUploadPath = uploadPath + File.separator + "imgUpload";  
	 // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
	 String ymdPath = UploadFileUtils1.calcPath(imgUploadPath);  
	 // 위의 폴더를 기준으로 연월일 폴더를 생성
	 String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
	  log.info("파일 존재여부:" +file);
	 if(file.getOriginalFilename()!= null && !file.getOriginalFilename().equals("")&&!file.equals("")) {
	  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
	  fileName =  UploadFileUtils1.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	  // gdsImg에 원본 파일 경로 + 파일명 저장
	  vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	  // gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
	  vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	 } else {  // 첨부된 파일이 없으면
		 fileName = File.separator + "123.PNG";
	  // 미리 준비된 none.png파일을 대신 출력함
	  vo.setGdsImg(fileName);
	  vo.setGdsThumbImg(fileName); }
	vo.setGdsImg(vo.getGdsImg().replace("\\", "/"));
	vo.setGdsThumbImg(vo.getGdsThumbImg().replace("\\", "/"));
	aService.register(vo); // 상품내용 등록해주는 서비스이다
	return "redirect:/admin/Reg";
	
}

//상품 조회부문
@GetMapping("/RegList")
public void regList(Criteria cri,Model mo) {	
	mo.addAttribute("goodsList",aService.goodsListr(cri));
	int total =aService.total(cri);
mo.addAttribute("pageMaker", new PageDTO(cri,total));
//상품의 리스트를 뿌려주는 곳이다 추가로 상품의 총토탈과 Criteria 에 정해준 페이징 양식으로
//페이징 처리까지 해주는곳이다
}

@GetMapping("/goods/view")
public void getGoodsview(int gdsNum,Model mo) {
	log.info("번호는 "+gdsNum);
	GoodsVO goods = aService.goodsView(gdsNum);
mo.addAttribute("goods", goods)	;
//선택된 상품의 디테일을 확인하게 해주는 쿼리이다
//상품 클릭시 오는 상품번호를 조회하여 그상품의 정보를 객체에 담아 뿌려주고 있는곳이다
	
}


//상품 수정
@GetMapping(value = "goods/modify",produces=
MediaType.APPLICATION_JSON_UTF8_VALUE)
public void getGoodsModify(int gdsNum,Model mo) {
	GoodsVO goods = aService.goodsView(gdsNum);
	mo.addAttribute("goods",goods);
	List<CategoryVO> category=null;
	category = aService.Category();
	mo.addAttribute("category",JSONArray.fromObject(category));
// 디테일에서 수정을 눌렀을시 상품의 디테일을 다시 정할수있게 해주는 쿼리이다
// 등록때와 비슷하게 카테고리를 불러와서 뿌려주고 있는 모습이다	
	
}
//수정할 상품내용들을 받아와 처리해주는곳
@PostMapping(value = "goods/modify",produces=
MediaType.APPLICATION_JSON_UTF8_VALUE)
public String getGoodsModify(GoodsVO vo ,MultipartFile file,HttpServletRequest req) throws Exception{
	// 새로운 파일이 등록되었는지 확인
	 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	  // 기존 파일을 삭제
	  new File(uploadPath + req.getParameter("gdsImg")).delete();
	  new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
	  // 새로 첨부한 파일을 등록
	  String imgUploadPath = uploadPath + File.separator + "imgUpload";
	  String ymdPath = UploadFileUtils1.calcPath(imgUploadPath);
	  String fileName = UploadFileUtils1.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	  
	  vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	  vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	  
	 } else {  // 새로운 파일이 등록되지 않았다면
	  // 기존 이미지를 그대로 사용
	  vo.setGdsImg(req.getParameter("gdsImg"));
	  vo.setGdsThumbImg(req.getParameter("gdsThumbImg")); 
	 }	
	aService.goodsModify(vo);
	//수정된 정보를 업데이트 하는 쿼리이다
	return "redirect:/admin";
	
}

@PostMapping(value = "goods/delete",produces=
MediaType.APPLICATION_JSON_UTF8_VALUE)
public String postGoodsDelete(int gdsNum) {
	
	aService.goodsDelete(gdsNum);
	
	return "redirect:/admin";
}



//ck 에디터에서 파일 업로드
@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
public void postCKEditorImgUpload(HttpServletRequest req,
      HttpServletResponse res,
      @RequestParam MultipartFile upload) throws Exception {
// 랜덤 문자 생성
UUID uid = UUID.randomUUID();
OutputStream out = null;
PrintWriter printWriter = null;

// 인코딩
res.setCharacterEncoding("utf-8");
res.setContentType("text/html;charset=utf-8");

try {

 String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
byte[] bytes = upload.getBytes();

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



//주문 목록
@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
public void getOrderList(Criteria cri ,Model model) throws Exception {


List<OrderVO> orderList = aService.orderList(cri);


int total = aService.orderTotal(cri);

model.addAttribute("orderList", orderList);
model.addAttribute("pageMaker", new PageDTO(cri,total));

}

//주문 상세 목록
@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
public void getOrderList(@RequestParam("n") String orderId,
   OrderVO order, Model model) throws Exception {


order.setOrderId(orderId);  
List<OrderVO> orderView = aService.orderView(order);

model.addAttribute("orderView", orderView);
}


//주문 상세 목록 - 상태 변경
@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
public String delivery(OrderVO order) throws Exception {

//배송완료 배송중 버튼 눌렀을때 변경해주는 친구
aService.delivery(order);


List<OrderVO> orderView = aService.orderView(order); 

GoodsVO goods = new GoodsVO();

if(order.getCK()==1) {
for(OrderVO i : orderView) {
 goods.setGdsNum(i.getGdsNum());
 goods.setGdsStock(i.getCartStock());
 aService.changeStock(goods);
}
}


return "redirect:/admin/shop/orderView?n=" + order.getOrderId();

}



//모든 소감(댓글)
@RequestMapping(value ="/shop/allReply", method = RequestMethod.GET)
public void getAllReply(Model model) throws Exception {


List<ARK_ReplyVO> reply = aService.allReply();

model.addAttribute("reply", reply);
}


@RequestMapping(value ="/shop/allReply", method = RequestMethod.POST)
public String getAllReply(int repNum) throws Exception {

	aService.replycat(repNum);
	
	
	return "redirect:/admin/shop/allReply";

}




@GetMapping("/shop/orderTek")
public void tek(Criteria cri, Model model) {
	List<OrderVO> orderList = aService.orderList(cri);

	model.addAttribute("orderList", orderList);

int total = aService.orderTotal(cri);
model.addAttribute("pageMaker", new PageDTO(cri,total));

}



@GetMapping("/shop/orderTekView")
public void tekView(@RequestParam("n") String orderId,
		   OrderVO order, Model model) {

order.setOrderId(orderId);  
List<OrderVO> orderView = aService.orderView(order);

model.addAttribute("orderView", orderView);
	
}

@PostMapping("/shop/orderTekView")
public String tekView2(OrderVO order) {
	if(order.getCK()==2) {
		
	aService.delivery(order);
	
	List<OrderVO> orderView = aService.orderView(order); 
	GoodsVO goods = new GoodsVO();
	
	for(OrderVO i : orderView) {
	 goods.setGdsNum(i.getGdsNum());
	 goods.setGdsStock(i.getCartStock());
	 log.info("수량은?"+ i.getCartStock());
	 aService.changeStock2(goods);
	}
	
	aService.oderDL(order);
	
	return "redirect:/admin/shop/orderList";
	}

	
	aService.oderDL(order);
	

	return "redirect:/admin/shop/orderList";	
}


@GetMapping("memberAuth")
public void auth(@Param("id")String id,Model mo) {
	log.info(id);
	
NewMemberVO list	 = aService.idList(id);
	
mo.addAttribute("list", list);
	
}

@PostMapping("memberAuth")
public String authC(AuthVO vo) {
	
	aService.levelUp(vo);
	
	return "redirect:/admin";
}

@GetMapping("/notice/list")
public void notiList(Criteria cri,Model mo) {
	
	mo.addAttribute("list",aService.noticeList(cri));
	int total = aService.orderTotal(cri);
	mo.addAttribute("pageMaker", new PageDTO(cri,total));
}


@GetMapping("/review/list")
public void review(Criteria cri,Model mo) {
	
	mo.addAttribute("list",aService.reviewList(cri));
	int total = aService.reviewTotal(cri);
	mo.addAttribute("pageMaker", new PageDTO(cri,total));
}


}//end 
