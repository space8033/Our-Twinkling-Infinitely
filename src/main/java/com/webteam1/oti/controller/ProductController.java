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

@Controller
@RequestMapping("/")
@Slf4j
public class ProductController {
	@Resource
	private ProductService productService;
	
	@RequestMapping("/getProductList")
	public String getBoardList(String pageNo, Model model, HttpSession session) {
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
	
}
