package com.webteam1.oti.controller;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.Login;
import com.webteam1.oti.service.UserService;
import com.webteam1.oti.service.UserService.LoginResult;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/member")
public class MobileMemberController {
	@Resource
	private UserService userService;
	
	@GetMapping("/login")
	public String login(Login member) {
		log.info(member.toString());
		LoginResult loginResult = userService.loginByMember(member);
		
		JSONObject jsonObject = new JSONObject();
		if(loginResult == LoginResult.SUCCESS) {
			jsonObject.put("result", "success");
			LoginDto loginDto = userService.getUser(member.getUserId());
			jsonObject.put("userId", loginDto.getUsers_id());
			jsonObject.put("password", loginDto.getUsers_password());
		}else if(loginResult == LoginResult.FAIL_UID) {
			jsonObject.put("result", "Id Not Found");
		}else if(loginResult == LoginResult.FAIL_PASSWORD) {
			jsonObject.put("result", "Wrong Password.");			
		}
		String json = jsonObject.toString();
		
		return json;
	}
}
