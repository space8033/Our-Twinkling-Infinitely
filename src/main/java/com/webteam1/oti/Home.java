package com.webteam1.oti;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Home {
	@RequestMapping("/content")
	public String content() {
		return "list/list";
	}
}
