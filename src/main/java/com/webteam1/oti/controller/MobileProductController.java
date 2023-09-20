package com.webteam1.oti.controller;

import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductDetail;
import com.webteam1.oti.service.ImageService;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/products")
@Slf4j
public class MobileProductController {
	
	@Resource
	private ProductService productService;
	
	@Resource
	private ImageService imageService;
	
	
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
	public ProductDetail getDetailList(int product_no) {
		ProductDetail productDetail = productService.productDetail(product_no);
		Collections.sort(productDetail.getImages_no());
		return productDetail;
	}
	
	@GetMapping(value="/getImageNo", produces="application/json; charset=UTF-8")
	public List<Integer> getImageNo(int product_no){
		List<Integer> image_no = imageService.getImageNoByProductNo(product_no);
		return image_no;
	}
	
	@GetMapping(value="/getDetailImgThumbnail", produces="image/jpeg")
	public byte[] getDetailImgThumbnail(int image_no){
		Image image = imageService.getImageByImageNo(image_no);
		return image.getImage_file();
	}
	
	@GetMapping(value="/getDetailImgDetail", produces="image/jpeg")
	public byte[] getDetailImgDetail(int product_no){
		log.info("실행");
		Image image = productService.selectDetailImgDetail(product_no);
		return image.getImage_file();
	}
	
	
}
