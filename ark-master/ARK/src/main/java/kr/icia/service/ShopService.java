package kr.icia.service;

import java.util.HashMap;
import java.util.List;

import kr.icia.domain.ARK_ReplyVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.GoodsVO;
import kr.icia.domain.HashVO;
import kr.icia.domain.LiketoVO;
import kr.icia.domain.OrderDetailVO;
import kr.icia.domain.OrderVO;

public interface ShopService {

	public List<GoodsVO> list(Criteria cri) throws Exception;
	
	public GoodsVO goodsView(int gdsNum);
	
	public void registReply(ARK_ReplyVO reply);
	
	public List<ARK_ReplyVO> replyList(int gdsNum);

	public void deletReply(ARK_ReplyVO reply);
	
	public void modifyReply(ARK_ReplyVO reply);
	
	 public void addCart(CartVO cart);
	 
	 public List<CartVO> cartList(String userId);
	 
	 public void deletCart(CartVO cart); 
	 
	 public void orderInfo(OrderVO order);
	 
	 public void orderInfo_Details(OrderDetailVO orderDetail);
	
	 public void cartAllDelete(String userId);
	 
	 public List<OrderVO> orderList(OrderVO order);
	 
	 public List<OrderVO> orderView(OrderVO order);
	 
	 public int idread(String userId);
	 
	//좋아요
	 public void like_check(HashVO vo);
		
	 public void like_check_cancel(HashVO vo);

	 public LiketoVO read(HashVO vo);
	 
	 public GoodsVO read1(int boardno);
	 
	 public int countbyLike(HashVO vo);
	 
	 public void create(HashVO vo);

	public void like_cnt_up(int boardno);

	public void like_cnt_down(int boardno);
	 
	public int total(int cateCode,int level);
	
	public int allStock(String userId);
	
	public String getCateName(int cateCode);
	
	public int getcatecoderef(int gdsNum);
	
	public List<GoodsVO> roll(int catecoderef);
	 
}
