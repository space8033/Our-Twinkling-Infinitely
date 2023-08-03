package com.webteam1.oti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	//http://localhost:8080/our-twinkling-infinitely/ 요청하면 HomeController.index() 실행
	@RequestMapping("/")
	public String index() {
		log.info("실행");
		return "home";
	}

	@RequestMapping("/aa")
	public String bb() {
		log.info("실행");
		return "modify/modify";
	}
}
