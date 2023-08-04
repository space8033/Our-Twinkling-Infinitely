package com.webteam1.oti.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.Product.ProductStatus;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Resource
	private ProductDao productDao;
	
	//http://localhost:8080/our-twinkling-infinitely/ 요청하면 HomeController.index() 실행
	@RequestMapping("/")
	public String index() {
		log.info("실행");
		return "home";
	}
/*	@RequestMapping("/insert")
	public String insert() {
		for(int i=0; i<20; i++) {
			Product product = new Product();
			product.setProduct_no(i);
			product.setProduct_name("이름" + i);
			product.setProduct_price(100 * i);
			product.setProduct_status(ProductStatus.REMAIN);
			product.setProduct_qty(i);
			product.setProduct_hitcount(0);
			product.setProduct_discountRate(10);
			product.setProduct_detail("내용" + i);
			productDao.insert(product);
		}
		return "home";
	}*/
}
