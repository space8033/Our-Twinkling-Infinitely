package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.Product;
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
}
