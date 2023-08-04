package com.webteam1.oti.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class UserController {
	@Resource
	private UserService userService;
	
	@RequestMapping("joinForm")
	public String joinForm() {
		
		return "join/joinForm";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		log.info("실행");
		return "login/loginForm";
	}
	@RequestMapping("modify")
	public String modify() {
		log.info("실행");
		return "modify/modify";
	}
	@RequestMapping("cart")
	public String basket() {
		log.info("실행");
		return "cart/basket";
	}
	@RequestMapping("mypage")
	public String mypage() {
		log.info("실행");
		return "mypage/orderlist/myOti";
	}

}
