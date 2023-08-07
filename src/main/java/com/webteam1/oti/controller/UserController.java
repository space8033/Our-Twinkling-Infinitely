package com.webteam1.oti.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.service.UserService;
import com.webteam1.oti.service.UserService.JoinResult;
import com.webteam1.oti.service.UserService.LoginResult;

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
			String error1 = "이미 가입된 아이디입니다.";
			model.addAttribute("error1", error1);
			return "join/joinForm";
		} else if(result == JoinResult.FAIL_DUPLICATED_EMAIL){
			String userId = userService.getUsersByUserEmail(users.getUsers_email()).getUsers_id();
			String error2 = userId + "로 이미 가입된 이메일입니다.";
			model.addAttribute("error2", error2);
			return "join/joinForm";
		} else if(result == JoinResult.FAIL_DUPLICATED_TEL) {
			String userId = userService.getUsersByUserPhone(users.getUsers_phone()).getUsers_id();
			String error3 = userId + "로 이미 가입된 전화번호입니다.";
			model.addAttribute("error3", error3);
			return "join/joinForm";
		} else {
		
			return "redirect:/loginForm";
		   }
		
		
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "login/loginForm";
	}
	
	@PostMapping("/loginForm")
	public String login(LoginDto users, Model model) {
		LoginResult result = userService.login(users);
		String error = "";
		log.info(result+"로그인 상태");
		if(result == LoginResult.FAIL_UID) {
			error = "가입된 ID가 없습니다.";
			
		} else if(result == LoginResult.FAIL_ENABLED) {
			error = "ID가 비활성화 되어 있습니다.";
		} else if(result == LoginResult.FAIL_PASSWORD) {
			error = "비밀번호가 틀립니다";
		} else {
			log.info("로그인에 성공하였습니다");
		return "redirect:/";
		}
		model.addAttribute("error", error);
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
