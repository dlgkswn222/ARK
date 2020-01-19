package kr.icia.controller;

import java.io.InputStream;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.icia.domain.ARK_ReplyVO;
import kr.icia.domain.BoardVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.GoodsVO;
import kr.icia.domain.HashVO;
import kr.icia.domain.LiketoVO;
import kr.icia.domain.OrderDetailVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.PageDTO;
import kr.icia.service.ShopService;
import kr.icia.service.adminService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONObject;

@Controller 
@Log4j		
@RequestMapping(value = "/shop/*",method = {RequestMethod.GET,RequestMethod.POST})
@AllArgsConstructor
public class ShopController {
@Inject
private ShopService ss;
	
	
@Setter(onMethod_=@Autowired)
private adminService aService;	

	@GetMapping(value = "/list",produces=
			MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void getList(@RequestParam("c")int cateCode,@RequestParam("l")int level,Model mo
			,Criteria cri)throws Exception {
		// Json 타입으로 문자를 내보내줄 ""(더블커터) 없이 나가는 문제를  오브젝트 멥퍼로 해결한것이다 요거좋네
			
		String cateName = ss.getCateName(cateCode);
		
		
		ObjectMapper mapper = new ObjectMapper();
				String JString = mapper.writeValueAsString(aService.Category());
					mo.addAttribute("cat",JString);
		mo.addAttribute("cateCode",cateCode);
		mo.addAttribute("level",level);
		mo.addAttribute("cateName", cateName);
		List<GoodsVO>list =null;
		 
		cri.setLevel(level);
		cri.setCateCode(cateCode);
		
		list	= ss.list(cri);
		
		mo.addAttribute("list", list);
		
		int total =ss.total(cateCode,level);

		mo.addAttribute("pageMaker", new PageDTO(cri,total));
		
		
		
		
	}



	@GetMapping("/view")
	public void getView(@RequestParam("n")int gdsNum ,Model model,
			Principal principal	,SecurityContextHolder sc,
			HttpServletRequest request
			,Authentication authentication) throws Exception{
		
		
		
		HttpSession session = request.getSession(false);

		
		GoodsVO view = ss.goodsView(gdsNum);
		model.addAttribute("view",view);
		List<ARK_ReplyVO> reply =ss.replyList(gdsNum);
		model.addAttribute("reply",reply);
		
		
		
		 if(principal!=null) {
		String users	=  principal.getName();
		 model.addAttribute("mno", "1");	  
		model.addAttribute("users",users);	
		 HashVO vo  = new HashVO();
		    UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		    String userId= userDetails.getUsername();
		    
		    vo.setUserId(userId);
		    vo.setGdsNum(gdsNum);
		 if(ss.countbyLike(vo)==0){
		      ss.create(vo);
		   }

			  
		  }else {
			  String user= "";
			 
			  model.addAttribute("users", user);
			  model.addAttribute("mno","0");
		  }
		
		 
	int catecoderef = ss.getcatecoderef(gdsNum);
	
	List<GoodsVO> roll = ss.roll(catecoderef);
		 model.addAttribute("roll", roll);

	}
	
	/*
	 * @PostMapping("/view") public String registReply(ARK_ReplyVO reply,HttpSession
	 * session,Authentication authentication)throws Exception {
	 * 
	 * UserDetails userDetails = (UserDetails) authentication.getPrincipal(); String
	 * userid= userDetails.getUsername();
	 * 
	 * 
	 * reply.setUserId(userid);
	 * 
	 * ss.registReply(reply);
	 * 
	 * 
	 * return "redirect:/shop/view?n="+reply.getGdsNum();
	 * 
	 * }
	 */
	
	// 상품 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/view/registReply",method = {RequestMethod.POST})
	public void registReply(ARK_ReplyVO reply,  HttpSession session,Authentication authentication) throws Exception {
	
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); String
		  userid= userDetails.getUsername();
		  
		  reply.setUserId(userid);
		  log.info("유저 아이디는"+userid);
		  log.info("저장 내용"+reply);
		  
		  ss.registReply(reply);

	} 
	
	
	// 상품 소감(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
	public void getReplyList(ARK_ReplyVO reply,  HttpSession session,Authentication authentication) throws Exception {
	
	UserDetails userDetails = (UserDetails) authentication.getPrincipal(); String
	userid= userDetails.getUsername();
	
	  reply.setUserId(userid);
	 
	  
	  ss.deletReply(reply);
	  
	 
	 }
	 
	
	
	
	
	
	
	
	@ResponseBody
	@GetMapping("/view/replyList")
	public List<ARK_ReplyVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception {
	
		List<ARK_ReplyVO> reply = ss.replyList(gdsNum);
	 
	 return reply;
	} 
	
	
	//상품 덧글 수정
	@ResponseBody
	@RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ARK_ReplyVO reply, HttpSession session,Authentication authentication
			,Principal principal) throws Exception {
	
	 
	 int result = 0;
	 
	 if(principal!=null) {
	 
		 UserDetails userDetails = (UserDetails) authentication.getPrincipal(); String
			userid= userDetails.getUsername();
	
	log.info(reply);	 
	  reply.setUserId(userid);
	  ss.modifyReply(reply);
	 
	  result = 1;
	  log.info(result);
	 }
	 log.info(result);
	 return result;
	} 
	
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart", 
	produces=MediaType.APPLICATION_JSON_UTF8_VALUE,
	method = RequestMethod.POST)
	public int addCart(CartVO cart,Principal principal,Authentication authentication) throws Exception {
	 
	 int result = 0;
	
	 log.info(cart);
	 if(principal != null) {
	 UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
	 String	userid= userDetails.getUsername();
	cart.setUserId(userid);
	
	  ss.addCart(cart);
	log.info(cart); 
 
	
	  result =1;
	 }
	 log.info(result); 
	 return result;
	}
	
	
	// 카트 목록
	@RequestMapping(value = "/cartList",method = RequestMethod.GET)
	public void getCartList(Model model
			,Authentication authentication
			,Principal principal) throws Exception {
	
	 
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String userId= userDetails.getUsername();
	 
	 List<CartVO> cartList = ss.cartList(userId);
	 
	 int sumStock = ss.allStock(userId);
	
	 model.addAttribute("sumStock",sumStock);
	 model.addAttribute("cartList", cartList);
	 
	}
	
	
	
	  // 주문
	  
	  @RequestMapping(value = "/cartListPost",method = RequestMethod.POST) public
	  String order(OrderVO order, OrderDetailVO orderDetail ,Principal principal
	  ,Authentication authentication) throws Exception {
	  
	  
	  UserDetails userDetails = (UserDetails) authentication.getPrincipal(); String
	  userId= userDetails.getUsername();
	  
	  Calendar cal = Calendar.getInstance(); int year = cal.get(Calendar.YEAR);
	  String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) +
	  1); String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	  String subNum = "";
	  
	  for(int i = 1; i <= 6; i ++) { subNum += (int)(Math.random() * 10); }
	  
	  String orderId = ymd + "_" + subNum;
	  
	  
	  
	  order.setOrderId(orderId); 
	  order.setUserId(userId);
	  
	  ss.orderInfo(order);
	  
	  orderDetail.setOrderId(orderId); ss.orderInfo_Details(orderDetail);
	  
	  ss.cartAllDelete(userId);
	  
	  return "redirect:/shop/orderList"; }
	  
	 
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart",produces=MediaType.APPLICATION_JSON_UTF8_VALUE,
	method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart
	     ,Authentication authentication
			,Principal principal) throws Exception {
	
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String userId= userDetails.getUsername();
	 
	 
	 int result = 0;
	 int cartNum = 0;
	 
	 
	 if(principal != null) {
	  cart.setUserId(userId);
	  
	  for(String i : chArr) {   
	   cartNum = Integer.parseInt(i);
	   cart.setCartNum(cartNum);
	   ss.deletCart(cart);
	  }   
	  result = 1;
	 }  
	 return result;  
	}
	

	
	
	

  // 주문 목록
  
  @RequestMapping(value = "/orderList", method = RequestMethod.GET) public void
  getOrderList(HttpSession session, OrderVO order, Model model,Authentication
  authentication) throws Exception {
  
  
  UserDetails userDetails = (UserDetails) authentication.getPrincipal(); String
  userId= userDetails.getUsername();
  
  order.setUserId(userId);
  
  List<OrderVO> orderList = ss.orderList(order);
  
  model.addAttribute("orderList", orderList); 
  }
  
  
  // 주문 상세 목록
  
  @RequestMapping(value = "/orderView", method = RequestMethod.GET) 
  public void getOrderList(HttpSession session,
  
  @RequestParam("n") String orderId, OrderVO order, Model model, Authentication
  authentication) throws Exception {
  
  UserDetails userDetails = (UserDetails) authentication.getPrincipal(); String
  userId= userDetails.getUsername();
  
  order.setUserId(userId); 
  order.setOrderId(orderId);
  
  List<OrderVO> orderView = ss.orderView(order);
  
  model.addAttribute("orderView", orderView); 
  }
  
 
  
  @ResponseBody
  @RequestMapping(value="/liketo/like.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String like(@RequestParam("boardno") int boardno, HttpSession session
		  ,Authentication authentication
			,Principal principal){
    JSONObject obj = new JSONObject();
    ArrayList<String> msgs = new ArrayList<String>();
   
    if(principal != null) {
    HashVO vo  = new HashVO();
    UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
    String userId= userDetails.getUsername();
    
    vo.setUserId(userId);
    vo.setGdsNum(boardno);
  
    							//회원 정보+ 게시물 번호
    LiketoVO liketoVO = ss.read(vo); //좋아요 정보 vo
    
    GoodsVO goodsVO = ss.read1(boardno); //게시글 정보 vo
    
    int like_cnt = goodsVO.getLike_cnt();     //게시판의 좋아요 카운트
    
    int like_check = 0;
    
    like_check = liketoVO.getLike_check();    //좋아요 체크 값
    
    if(ss.countbyLike(vo)==0){
      ss.create(vo);
    }
      
    if(like_check == 0) {
      msgs.add("좋아요!");
      ss.like_check(vo);
      like_check++;
      like_cnt++;
      ss.like_cnt_up(boardno);   //좋아요 갯수 증가
    } else {
      msgs.add("좋아요 취소");
      ss.like_check_cancel(vo);
      like_check--;
      like_cnt--;
      ss.like_cnt_down(boardno);   //좋아요 갯수 감소
    }
    obj.put("boardno", liketoVO.getGdsNum());
    obj.put("like_check", like_check);
    obj.put("like_cnt", like_cnt);
    obj.put("msg", msgs);
    
   
  }
  return obj.toString(); 
  
  }
  
  


}


 