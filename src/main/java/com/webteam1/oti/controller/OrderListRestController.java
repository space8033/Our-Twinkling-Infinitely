package com.webteam1.oti.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.order.OrderInfo;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.interceptor.Login;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/")
public class OrderListRestController {
	@Resource
	private ProductService productService;
	
	@Login
	@ResponseBody
	@GetMapping("getOrderList")
	public List<OrderInfo> getOrderList(HttpSession session, Model model) {
		LoginDto user = (LoginDto)session.getAttribute("loginIng");
		String userId = user.getUsers_id();
		
		List<OrderInfo> list = new ArrayList<>();
	
		return list;
	}
}
