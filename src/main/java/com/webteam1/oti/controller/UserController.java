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
import com.webteam1.oti.dto.user.ModifyDto;
import com.webteam1.oti.interceptor.Login;
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
	
	//회원가입 폼 불러오기
	@GetMapping("/joinForm")
	public String joinForm() {
		
		return "join/joinForm";
	}
	
	//회원가입 신청
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
	//로그이 폼 불러오기
	@GetMapping("/loginForm")
	public String loginForm() {
		return "login/loginForm";
	}
	//로그인 요청
	@PostMapping("/loginForm")
	public String login(LoginDto users, Model model, HttpSession session) {
		LoginResult result = userService.login(users);
		
		log.info(result+"로그인 상태");
		if(result == LoginResult.FAIL_UID) {
			String error1 = "가입된 ID가 없습니다.";
			model.addAttribute("error1", error1);
			
		} else if(result == LoginResult.FAIL_ENABLED) {
			String error2 = "ID가 비활성화 되어 있습니다";
			model.addAttribute("error2", error2);
		} else if(result == LoginResult.FAIL_PASSWORD) {
			String error3 = "비밀번호가 틀립니다";
			model.addAttribute("error3", error3);
		} else {
			log.info("로그인에 성공하였습니다");
			LoginDto dbUser = userService.getUser(users.getUsers_id());
			session.setAttribute("loginIng", dbUser);
			
			LoginDto loginDto = (LoginDto) session.getAttribute("loginIng");
			model.addAttribute("loginIng", loginDto);
			return "redirect:/";
		}
		return "login/loginForm";
		
	}
	
	//로그아웃 요청
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginIng");
	    return "redirect:/";
	}
	//개인정보 수정 불러오기
	@Login
	@GetMapping("/modify")
	public String modify(Model model, HttpSession session) {
		LoginDto loginUser = (LoginDto) session.getAttribute("loginIng");
		ModifyDto loginUserData = userService.getModifyByUsersId(loginUser.getUsers_id());
		model.addAttribute("modifyDto", loginUserData);
		
		return "modify/modify";
	}
	//개인정보 수정 요청
	@Login
	@PostMapping("/modify")
	public String modify(ModifyDto user, HttpSession session) {
		userService.modifyUser(user);
		return "redirect:/modify";
	}
	
	//로그인 기능 테스트용
	@Login
	@RequestMapping("mypage")
	public String mypage() {
		log.info("실행");
		return "mypage/orderlist/myOti";
	}

}
