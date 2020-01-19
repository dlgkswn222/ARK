package kr.icia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.CategoryVO;
import kr.icia.domain.ProductVO;
import kr.icia.domain.ProductViewVO;

public interface ProductMapper {
	public List<ProductVO> getProductData(@Param("cateb") String cateb, @Param("cates") String cates);
	public List<ProductVO> getAllProduct();
	
	public void getRegister(ProductVO vo);
	
	public List<CategoryVO> getCategory();
	
	public ProductViewVO getProductView(int pronum);
	
	public void getProductModify(ProductVO product);
	
	public void getProductDelete(int pronum);
}
