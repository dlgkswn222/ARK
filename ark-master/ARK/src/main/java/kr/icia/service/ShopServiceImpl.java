package kr.icia.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.domain.ARK_ReplyVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.GoodsVO;
import kr.icia.domain.HashVO;
import kr.icia.domain.LiketoVO;
import kr.icia.domain.OrderDetailVO;
import kr.icia.domain.OrderVO;
import kr.icia.mapper.ShopMapper;
import lombok.Setter;

@Service
public class ShopServiceImpl implements ShopService {

	//@Setter(onMethod_=@Autowired)
	@Inject
	private ShopMapper ma;
	
	@Override
	public List<GoodsVO> list(Criteria cri)throws Exception {
		int cateCodeRef = 0;
		
		if(cri.getLevel()==1) {
			cateCodeRef= cri.getCateCode();
		cri.setCateCodeRef(cateCodeRef);
			return ma.list1(cri);
			
		}
	
		return ma.list2(cri) ;
	}

	@Override
	public GoodsVO goodsView(int gdsNum) {
	
		return ma.goodsView(gdsNum);
	}

	@Override
	public void registReply(ARK_ReplyVO reply) {
		
		ma.updateReplyCnt(reply.getGdsNum(),1);
		
		 ma.registReply(reply);
		
		
	}

	@Override
	public List<ARK_ReplyVO> replyList(int gdsNum) {
		
		return ma.replyList(gdsNum);
	}

	@Override
	public void deletReply(ARK_ReplyVO reply) {
		
		ma.deletReply(reply);
		
	}

	@Override
	public void modifyReply(ARK_ReplyVO reply) {
		
		ma.modifyReply(reply);
		
	}

	@Override
	public void addCart(CartVO cart) {
		
		ma.addCart(cart);
		
	}

	@Override
	public List<CartVO> cartList(String userId) {
		
		return ma.cartList(userId);
	}

	@Override
	public void deletCart(CartVO cart) {
		ma.deletCart(cart);
		
	}

	@Override
	public void orderInfo(OrderVO order) {
		
		ma.orderInfo(order);
	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) {
		ma.orderInfo_Details(orderDetail);
		
	}

	@Override
	public void cartAllDelete(String userId) {
	
		ma.cartAllDelete(userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) {
		
		return ma.orderList(order);
	}

	@Override
	public List<OrderVO> orderView(OrderVO order) {
		
		return ma.orderView(order);
	}

	@Override
	public int idread(String userId) {
		
		return ma.idread(userId);
	}

	@Override
	public void like_check(HashVO vo) {
		ma.like_check(vo);
		
	}

	@Override
	public void like_check_cancel(HashVO vo) {
		ma.like_check_cancel(vo);
		
	}

	@Override
	public LiketoVO read(HashVO vo) {
		
		return ma.read(vo);
	}

	@Override
	public GoodsVO read1(int boardno) {
		
		return ma.read1(boardno);
	}

	@Override
	public int countbyLike(HashVO vo) {
		
		return ma.countbyLike(vo);
	}

	@Override
	public void create(HashVO vo) {
		
		ma.create(vo);
		
	}

	@Override
	public void like_cnt_up(int boardno) {
		
		ma.like_cnt_up(boardno);
		
	}

	@Override
	public void like_cnt_down(int boardno) {
	
		ma.like_cnt_down(boardno);
		
	}

	@Override
	public int total(int cateCode,int level) {
		

		if(level==2) {
			return ma.total1(cateCode);
			
		}
		
		
		return ma.total2(cateCode);
		
	}

	@Override
	public int allStock(String userId) {
		
		
		
		
		
		return ma.allStock(userId);
	}

	@Override
	public String getCateName(int cateCode) {
		
		return ma.getCateName(cateCode);
	}

	@Override
	public int getcatecoderef(int gdsNum) {
	int code =0;
		
		code =	ma.getcatecoderef(gdsNum);
		if(code == 100) {
			code=1200;
		}else if(code == 200) {
			code=1100;
		}else if(code == 300) {
			code=1000;
		}else if(code == 400) {
			code=900;
		}else if(code == 500) {
			code=800;
		}else if(code == 600) {
			code=700;
		}else if(code == 700) {
			code=600;
		}else if(code == 800) {
			code=500;
		}else if(code == 900) {
			code=400;
		}else if(code == 1000) {
			code=300;
		}else if(code == 1100) {
			code=200;
		}else{
			code=100;
		}
		
		
		return code;
	
	}

	@Override
	public List<GoodsVO> roll(int catecoderef) {
		
		return ma.roll(catecoderef);
	}

	//좋아요

	
	
	
	
}
