package com.webteam1.oti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class Home {
	@RequestMapping("/content")
	public String content() {
		return "mypage/orderlist/mycoupang";
	}
}
