package com.webteam1.oti.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dto.Users;
import com.webteam1.oti.dto.Users.UserType;
import com.webteam1.oti.service.UserService;
import com.webteam1.oti.service.UserServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class UserController {
	@Resource
	private UserService userService;
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		Users user = new Users();
		user.setUsers_id("실험용");
		user.setUsers_email("test@mail.com");
		user.setUsers_password("12345");
		user.setUsers_name("팀1");
		user.setUsers_phone("010-2222-3333");
		user.setUsers_type(UserType.ENABLED);
		user.setUsers_opoint(300);
		
		userService.join(user);
		
		return "join/joinForm";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		log.info("실행");
		return "login/loginForm";
	}

}
