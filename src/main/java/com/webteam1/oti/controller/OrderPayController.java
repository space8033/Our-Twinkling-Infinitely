package com.webteam1.oti.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;
import com.webteam1.oti.interceptor.Login;
import com.webteam1.oti.service.ProductService;
import com.webteam1.oti.service.UserService;

import lombok.extern.slf4j.Slf4j;

//OrderPayController 전체 작성자 : 김시온
@Slf4j
@Controller
public class OrderPayController {
	@Resource
	private ProductService productService;
	@Resource
	private UserService userService;
	
	//http://localhost:8080/our-twinkling-infinitely/ 요청하면 HomeController.index() 실행
	//홈 페이지 불러오기
	
	@Login
	@GetMapping("/orderPay")
	public String orderPay(String reqMsg, Model model, HttpSession session) {
		LoginDto loginUser = (LoginDto) session.getAttribute("loginIng");
		ModifyDto loginUserData = userService.getModifyByUsersId(loginUser.getUsers_id());
		model.addAttribute("orderUser", loginUserData);
		model.addAttribute("reqMsg", reqMsg);
		
		return "orderPay/orderPay";
	}
	
	@Login
	@GetMapping("/addressSelect")
	public String addressSelect() {
		
		return "orderPay/addressSelect";
	}
	
	@Login
	@GetMapping("/addressRequest")
	public String addressRequest(Model model) {
		
		
		
		return "orderPay/addressRequest";
	}
	
	@Login
	@GetMapping("/addressModify")
	public String modifyAddress() {
		
		return "orderPay/addressModify";
	}
	
	@Login
	@GetMapping("/addressAdd")
	public String addAddress() {
		
		return "orderPay/addressAdd";
	}
	
	

}
