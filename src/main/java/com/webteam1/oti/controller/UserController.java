package com.webteam1.oti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class UserController {
	@RequestMapping("joinForm")
	public String joinForm() {
		log.info("실행");
		return "join/joinForm";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		log.info("실행");
		return "login/loginForm";
	}

	
}
