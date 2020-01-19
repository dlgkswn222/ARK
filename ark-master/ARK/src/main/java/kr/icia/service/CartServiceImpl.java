package kr.icia.service;

import java.util.List;

import kr.icia.domain.CartVO;
import kr.icia.mapper.CartDAO;

public class CartServiceImpl implements CartService {


   CartDAO cartDao;
   
  
   // 장바구니 추가
   @Override
   public void insert(CartVO vo) {
      cartDao.insert(vo);
      
   }
// 장바구니 목록
   @Override
   public List<CartVO> listCart(String userid) {
      
      return cartDao.listCart(userid);
   }
//장바구니 삭제
   @Override
   public void delete(int cartid) {
      cartDao.delete(cartid);
      
   }
// 장바구니 수정
   @Override
   public void modifyCart(CartVO vo) {
   
      cartDao.modifyCart(vo);
      
   }
//장바구니 금액 합계
   @Override
   public int sumMoney(String userid) {
      return cartDao.sumMoney(userid);
   }
// 장바구니 상품 확인
   @Override
   public int countCart(int productid, String userid) {
      return cartDao.countCart(productid,userid);
   }
// 장바구니 상품 수량 변경
   @Override
   public void updateCart(CartVO vo) {
	   cartDao.updateCart(vo);
      
   }

}