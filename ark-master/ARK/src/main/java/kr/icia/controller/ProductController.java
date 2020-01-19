package kr.icia.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import kr.icia.domain.CategoryVO;
import kr.icia.domain.ProductVO;
import kr.icia.domain.ProductViewVO;
import kr.icia.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	
	//@Inject
	private ProductService service;
	
	/*
	 * @Resource(name="uploadPath") private String uploadPath;
	 */
	
	
	//상품 List Page 호출
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public void productList(Model model ) {

			List<ProductVO> product = service.getData();
			
			log.info("productList controller 값 전달 "+product);
			
			model.addAttribute("productList",product);
	}// productList_end
	
	
	
	//상품 등록 Page 호출
	@RequestMapping(value = "/productRegister", method = RequestMethod.GET)
	public void getProductRegister(Model model) {
		
		List<CategoryVO> category = service.category();
		 	
		log.info("get Product Caterory ="+category);

		
		
		model.addAttribute("category", JSONArray.fromObject(category));
	}// getProductRegister_end
	
	
	
	/*
	@Bean
	public MultipartResolver multipartResolver() {
	    return new CommonsMultipartResolver();
	}
	*/
	//상품 등록 Page -> 홈 리턴
	@RequestMapping(value = "/productRegister", method = RequestMethod.POST)
	public String postProductRegister(ProductVO vo, MultipartFile file) throws Exception {
		
		/*
		 * String imgUploadPath = uploadPath + File.separator + "imgUpload"; String
		 * ymdPath = UploadFileUtils.calcPath(imgUploadPath); String fileName = null;
		 * 
		 * log.info("이미지 파일 정보 : "+file);
		 * 
		 * 
		 * if(file != null) { fileName = UploadFileUtils.fileUpload(imgUploadPath,
		 * file.getOriginalFilename(), file.getBytes(), ymdPath); } else { fileName =
		 * uploadPath + File.separator + "images" + File.separator + "none.png"; }
		 * 
		 * vo.setProcontent(File.separator + "imgUpload" + ymdPath + File.separator +
		 * fileName); vo.setProthumbcontent(File.separator + "imgUpload" + ymdPath +
		 * File.separator + "s" + File.separator + "s_" + fileName);
		 */
	 service.getProduct(vo);
	 
		return "redirect:/prodect/productList";
	}// postProductRegister_end
	
	// 선택 상품 View Page 호출
	@RequestMapping(value="/productView", method = RequestMethod.GET)
	public void getProductView(@RequestParam("pronum") int pronum,Model model) {
		
		log.info("get Product View : "+pronum);
		
		ProductViewVO product = service.getView(pronum);
		
		log.info("product 내용 ~ :"+ product);
		
		model.addAttribute("product",product);
	}
	
	// 선택 상품 수정 Page 호출
	@RequestMapping(value = "/productModify", method= RequestMethod.GET)
	public void getProductModify(@RequestParam("pronum") int pronum,Model model) {
		log.info("get Product Modify : "+pronum);
		
		ProductViewVO product = service.getView(pronum);
		model.addAttribute("product",product);
		// 선택한 pronum을 가지고, view 페이지에 저장된 VO값 페이지에 저장
		
		List<CategoryVO> cate = service.category();
		log.info("get Modify's category : " + cate);
		
		model.addAttribute("category", JSONArray.fromObject(cate));
	}
	
	// 선택 상품 수정 page 완료
	@RequestMapping(value = "/productModify", method= RequestMethod.POST)
	public String postProductModify(@RequestParam("pronum") int pronum,ProductVO product) {
		log.info("post Product Modify");
		
		service.getModify(product);
		
		return "redirect:/board/productView?pronum="+pronum;
	}
	
	// 선택 상품 삭제
	@RequestMapping(value="/productDelete",method = RequestMethod.POST)
	public String postProductDelete(@RequestParam("pronum") int pronum) {
		log.info("post Product Delete :"+pronum);
		
		service.getDelete(pronum);
		
		return "redirect:/board/productList";
	}
	
	
	
}//ed_class
