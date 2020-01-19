package kr.icia.service;

import java.util.List;

import kr.icia.domain.CategoryVO;
import kr.icia.domain.ProductVO;
import kr.icia.domain.ProductViewVO;

public interface ProductService {
	
	public List<ProductVO> getData(String cateb,String cates);
	// Header -> 카테고리 목록 -> 상품 List 불러오기
	
	
	public List<ProductVO> getData();
	// Header -> 전체 상품 List 불러오기
	
	
	public void getProduct(ProductVO vo);
	// Aside -> 상품 등록하기
	
	
	public List<CategoryVO> category();
	// Register -> select 메뉴 정보
	
	public ProductViewVO getView(int pronum);
	// View -> 선택 상품 상세보기
	
	public void getModify(ProductVO product);
	// Modify -> 상품 수정하기
	
	public void getDelete(int pronum);
	// Delete -> 상품 삭제하기 
	
}
