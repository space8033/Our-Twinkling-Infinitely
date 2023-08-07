package com.webteam1.oti.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.service.UserService;
import com.webteam1.oti.service.UserService.JoinResult;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class UserController {
	@Resource
	private UserService userService;
	
	@GetMapping("/joinForm")
	public String joinForm() {
		
		return "join/joinForm";
	}
	
	@PostMapping("/joinForm")
	public String join(JoinDto users, Model model) {
		log.info(users.toString());
		JoinResult result = userService.join(users);
		
		if(result == JoinResult.FAIL_DUPLICATED_UID) {
			String error = "중복된 ID가 존재합니다.";
			model.addAttribute("error", error);
			return "/joinForm";
		} else {
			
			return "redirect:/loginForm";
		   }
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
