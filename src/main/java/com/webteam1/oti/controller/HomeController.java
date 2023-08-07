package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Resource
	private ProductService productService;
	
	//http://localhost:8080/our-twinkling-infinitely/ 요청하면 HomeController.index() 실행
	@RequestMapping("/")
	public String index(String pageNo, Model model, HttpSession session) {
		log.info("실행");
	   //브라우저에서 pageNo가 넘어오지 않았을 때
	   if(pageNo == null) {
		   //세션에 저장되어 있는지 확인
		   pageNo = (String) session.getAttribute("pageNo");
		   //저장되어있지 않다면 "1"로 초기화
		   if(pageNo == null) {
			   pageNo = "1";
		   }
	   }
	   //문자열을 정수로 변환
	   int intPageNo = Integer.parseInt(pageNo);
	   //세션에 pageNo를 저장
	   session.setAttribute("pageNo", String.valueOf(pageNo));
	   
	   int totalRows = productService.getTotalProductNum();
	   Pager pager = new Pager(10, 5, totalRows, intPageNo);
	  
	   List<Product> list = productService.getList(pager);

	   model.addAttribute("pager", pager);
	   model.addAttribute("products", list);
	  
		return "home";
	}

	@RequestMapping("/list")
	public String test3() {
		log.info("실행");
		return "list/list";
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
