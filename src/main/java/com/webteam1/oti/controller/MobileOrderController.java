package com.webteam1.oti.controller;

import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.order.OrderHistory;
import com.webteam1.oti.service.OrderService;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/order")
public class MobileOrderController {
	@Resource
	private OrderService orderService;
	@Resource
	private ProductService productService;
	
	@GetMapping(value="/history", produces="application/json; charset=UTF-8")
	public List<OrderHistory> getHistory(String userId) throws ParseException{
		return orderService.getOrderHistory(userId);
	}
	
	@GetMapping(value="/getDates", produces="application/json; charset=UTF-8")
	public List<String> getDates(String userId) throws ParseException{
		return orderService.getDates(userId);
	}
	
	@GetMapping(value="/getProductImage", produces="image/jpeg")
	public byte[] getProductImage(int product_no) {
		
		return productService.getProduct(product_no).getProduct_imgFile();
	}
}
