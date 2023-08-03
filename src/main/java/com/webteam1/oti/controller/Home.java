package com.webteam1.oti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Home {
	@RequestMapping("/")
	public String content() {
		return "mypage/orderlist/mycoupang";
	}
	
}
