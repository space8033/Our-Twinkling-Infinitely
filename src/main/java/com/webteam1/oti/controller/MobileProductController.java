package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/products")
@Slf4j
public class MobileProductController {
	
	@Resource
	private ProductService productService;
	
	
	@GetMapping(value="/getProductList", produces="application/json; charset=UTF-8")
	public List<Product> getProductList(){
		List<Product> list = productService.getListAll();
		return list;
	}
	
	@GetMapping(value="/fileDownload", produces="image/jpeg")
	public byte[] fileDownload(int product_no){
		log.info("실행");
		Product product = productService.getImgFile(product_no);
		return product.getProduct_imgFile();
	}
	
	@GetMapping(value="/searchmobile", produces="application/json; charset=UTF-8")
	public List<Product> searchProducts(@RequestParam("keyword") String keyword) {
	    log.info("검색 실행: " + keyword);
	    List<Product> searchResults = productService.searchProducts(keyword);
	    return searchResults;
	}
	
	
	
	@GetMapping(value="/getDetailList", produces="application/json; charset=UTF-8")
	public Product getDetailList(int product_no) {
		Product product = productService.productDetail(product_no);
		return product;
	}
	
	@GetMapping(value="/getDetailOption",produces="application/json; charset=UTF-8")
	public List<ProductOption> getDetailOption(int product_no){
			List<ProductOption> productOption = productService.getOptionList(product_no);
			return productOption;
	}
	
	@GetMapping(value="/getDetailImgThumbnail", produces="image/jpeg")
	public List<Image> getDetailImgThumbnail(int product_no){
		log.info("실행");
		List<Image> image = productService.selectDetailImgThumbnail(product_no);
		return image;
	}
	
	@GetMapping(value="/getDetailImgDetail", produces="image/jpeg")
	public byte[] getDetailImgDetail(int product_no){
		log.info("실행");
		Image image = productService.selectDetailImgDetail(product_no);
		return image.getImage_file();
	}
	
}
