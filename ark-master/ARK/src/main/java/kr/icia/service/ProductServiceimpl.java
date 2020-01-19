package kr.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.domain.CategoryVO;
import kr.icia.domain.ProductVO;
import kr.icia.domain.ProductViewVO;
import kr.icia.mapper.ProductMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceimpl implements ProductService {

	
	@Setter(onMethod_=@Autowired)
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getData(String cateb,String cates) {
		log.info("get Choice Product List");
		
		return mapper.getProductData(cateb,cates);
	}

	@Override
	public List<ProductVO> getData() {
		log.info("get All Product List");
		return mapper.getAllProduct();
	}

	@Override
	public void getProduct(ProductVO vo) {
		log.info("get add Product");
		mapper.getRegister(vo);
	}

	@Override
	public List<CategoryVO> category() {
		log.info("load Category");
		
		return mapper.getCategory();
	}

	@Override
	public ProductViewVO getView(int pronum) {
		log.info("load Product View Page : "+pronum);
		
		return mapper.getProductView(pronum);
	}

	@Override
	public void getModify(ProductVO product) {
		log.info("get Product Modify ");
		
		mapper.getProductModify(product);
	}

	@Override
	public void getDelete(int pronum) {
		log.info("get Product Delete");
		
		mapper.getProductDelete(pronum);
	}
	
	
	
}
