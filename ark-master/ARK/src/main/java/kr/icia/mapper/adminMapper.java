package kr.icia.mapper;

import java.util.List;

import kr.icia.domain.ARK_ReplyVO;
import kr.icia.domain.AuthVO;
import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.GoodsVO;
import kr.icia.domain.NewMemberVO;
import kr.icia.domain.NoticeVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.ReviewVO;

public interface adminMapper {

	public void register(GoodsVO vo);
	
	public List<CategoryVO> Category();

	public List<GoodsVO> goodsList();
	
	public GoodsVO goodsView(int gdsNum);
	
	public void goodsModify(GoodsVO vo);
	
	public void goodsDelete(int gdsNum);
	
	public List<OrderVO> orderList(Criteria cri);
	
	public List<OrderVO> orderView(OrderVO order);

	public void delivery(OrderVO order);
	
	public void changeStock(GoodsVO goods);
	
	public void changeStock2(GoodsVO goods);

    public List<ARK_ReplyVO> allReply();
	
	public void deleteReply(int repNum);
	
	public List<GoodsVO> goodsListr(Criteria cri);
	
	public int total(Criteria cri);
	
	public int MemberTotal(Criteria cri);
	
	public List<NewMemberVO> memberList(Criteria cri);
	
	public int orderTotal(Criteria cri);
	
	public NewMemberVO idList(String id);
	
	public void replycat(int repNum);
	
	public void  levelUp(AuthVO vo);
	
	public void oderDL(OrderVO order);
		
	public void oderDL2(OrderVO order);
	
	public List<NoticeVO> noticeList(Criteria cri);
	
	public List<ReviewVO> reviewList(Criteria cri);
	
	public int reviewTotal(Criteria cri);
}
