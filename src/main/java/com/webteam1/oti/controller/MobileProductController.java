package com.webteam1.oti.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@PostMapping("/search")
    public List<Product> searchProducts(@RequestBody Map<String, String> searchParams) {
        String keyword = searchParams.get("keyword");
        // 검색어를 이용하여 productService에서 검색을 수행하고 결과를 반환
        List<Product> searchResults = productService.searchProducts(keyword);
        return searchResults;
    }
}
