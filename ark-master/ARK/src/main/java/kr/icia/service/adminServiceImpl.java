package kr.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.domain.ARK_ReplyVO;
import kr.icia.domain.AuthVO;
import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.GoodsVO;
import kr.icia.domain.NewMemberVO;
import kr.icia.domain.NoticeVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.ReviewVO;
import kr.icia.mapper.adminMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class adminServiceImpl implements adminService {
	
	@Setter(onMethod_=@Autowired)
	private adminMapper mapper;
	
	@Override
	public void register(GoodsVO vo) {
		mapper.register(vo);
		
	}

	@Override
	public List<CategoryVO> Category(){
	
		
		return mapper.Category();
	}

	@Override
	public List<GoodsVO> goodsList() {
	
		return mapper.goodsList();
	}

	@Override
	public GoodsVO goodsView(int gdsNum) {
		
		return mapper.goodsView(gdsNum);
	}

	@Override
	public void goodsModify(GoodsVO vo) {
		mapper.goodsModify(vo);
		
	}

	@Override
	public void goodsDelete(int gdsNum) {
		mapper.goodsDelete(gdsNum);
		
	}

	@Override
	public List<OrderVO> orderList(Criteria cri) {
		
		return mapper.orderList(cri);
	}

	@Override
	public List<OrderVO> orderView(OrderVO order) {
		
		return mapper.orderView(order);
	}

	@Override
	public void delivery(OrderVO order) {
	
		mapper.delivery(order);
		
	}

	@Override
	public void changeStock(GoodsVO goods) {
	
		mapper.changeStock(goods);
		
	}

	
	@Override
	public void changeStock2(GoodsVO goods) {
	
		mapper.changeStock2(goods);
		
	}
	
	
	@Override
	public List<ARK_ReplyVO> allReply() {
		
		return mapper.allReply();
	}

	@Override
	public void deleteReply(int repNum) {
	
		mapper.deleteReply(repNum);
		
	}

	@Override
	public List<GoodsVO> goodsListr(Criteria cri) {
		
		return mapper.goodsListr(cri);
		
	}

	@Override
	public int total(Criteria cri) {
		
		return mapper.total(cri);
	}

	@Override
	public int MemberTotal(Criteria cri) {
	
		return mapper.MemberTotal(cri);
	}

	@Override
	public List<NewMemberVO> memberList(Criteria cri) {
		
		return mapper.memberList(cri);
	}

	@Override
	public int orderTotal(Criteria cri) {
		
		return mapper.orderTotal(cri);
	}

	@Override
	public NewMemberVO idList(String id) {
	
		return mapper.idList(id);
	}

	@Override
	public void replycat(int repNum) {
		
		mapper.replycat(repNum);
	}

	@Override
	public void levelUp(AuthVO vo) {
		
		mapper.levelUp(vo);
		
	}

	@Override
	public void oderDL(OrderVO order) {
		mapper.oderDL(order);
		
		mapper.oderDL2(order);
	}

	@Override
	public List<NoticeVO> noticeList(Criteria cri) {
		
		return mapper.noticeList(cri);
	}

	@Override
	public List<ReviewVO> reviewList(Criteria cri) {
	
		return mapper.reviewList(cri);
	}

	@Override
	public int reviewTotal(Criteria cri) {
		
		return mapper.reviewTotal(cri);
	}

}
