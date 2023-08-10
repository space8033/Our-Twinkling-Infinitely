package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.webteam1.oti.dto.Cart;
import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;
import com.webteam1.oti.interceptor.Login;
import com.webteam1.oti.service.CartService;
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
	@Resource
	private CartService cartService;
	
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
	public String login(LoginDto users, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
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
			
			//비회원 장바구니 회원장바구니로 이동
			Cookie cookie = WebUtils.getCookie(request, "cartCookie");

			if (cookie != null) {
				String ckValue = cookie.getValue();
				
				log.info("비회원장바구니 삭제");
				
				//쿠키가 있는 카트 중 해당 회원ID 입력
				List<Cart> list = cartService.getCartByCkId(ckValue);
				for(Cart cart: list) {
					cart.setUsers_users_id(loginDto.getUsers_id());
					cartService.cartUpdate(cart);
					log.info("앙 바껴랏" + cart);
				}
			}
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
		model.addAttribute("userInfo", loginUserData);
		
		return "modify/modify";
	}
	//개인정보 수정 요청
	@Login
	@PostMapping("/modify")
	public String modify(ModifyDto user, Model model, HttpSession session) {
		log.info(user.toString());
		LoginDto loginUser = (LoginDto) session.getAttribute("loginIng");
		JoinDto dbUserE = (JoinDto) userService.getUsersByUserEmail(user.getUsers_email());
		log.info(dbUserE+"dbUserE");
		String dbUserEmail;
		
		if(dbUserE != null) {
			dbUserEmail = dbUserE.getUsers_email();
			log.info(dbUserEmail+"dbUserEmail");
		} else {
			dbUserEmail = "없음";
			log.info(dbUserEmail+"dbUserEmail");
		}
		
		JoinDto dbUserP = (JoinDto) userService.getUsersByUserPhone(user.getUsers_phone());
		String dbUserPhone;
		log.info(dbUserP+"dbUserP");
		if(dbUserP != null) {
			dbUserPhone = dbUserP.getUsers_phone();
			log.info(dbUserPhone+"dbUserPhone");
		} else {
			dbUserPhone = "없음";
			log.info(dbUserPhone+"dbUserPhone");
		}
		
		//.getUsers_phone();
		
		ModifyDto loginUserData = userService.getModifyByUsersId(loginUser.getUsers_id());
		boolean emailModifyResult = user.getUsers_email().equals(loginUserData.getUsers_email());
		boolean phoneModifyResult = user.getUsers_phone().equals(loginUserData.getUsers_phone());
		log.info(user.getUsers_email()+"user.getUsers_email()");
		log.info(user.getUsers_phone()+"user.getUsers_phone()");
		log.info(loginUserData.getUsers_email()+"loginUserData.getUsers_email()");
		log.info(loginUserData.getUsers_phone()+"loginUserData.getUsers_phone()");
		log.info(loginUserData.toString());
			
		if(!emailModifyResult) {
			//입력한 이메일과 로그인 이메일이 다른 경우 : 입력한 이메일이 db에서 null이거나 로그인 이메일이 db에서 null
			if(dbUserEmail.equals("없음")) {
				//입력한 이메일이 로그인 이메일과 다른데, null일 경우 -> 디비 저장 가능
				    if(!phoneModifyResult) { 
					//이메일 비어있고 폰의 입력 결과가 다른 경우
				    	if(dbUserPhone.equals("없음")) {
				    		//이메일 비어있고 폰도 비어있는 경우
				    		userService.modify(user);
							log.info("이메일 비어있고 폰도 비어있는 경우: 님 수정성공ㅋ 올 운좋네");
							String success = "pass";
				    		model.addAttribute("success", success);
							return "redirect:/modify";
				    	} else {
				    		//이메일은 비어 있는데 폰번호가 중복인 경우
				    		String error2 = "이미 사용중인 번호입니다. 이메일은 사용중이지않습니다.";
				    		model.addAttribute("error2", error2);
				    		log.info("전화번호 중복으로 인해 수정에 실패하셨습니다 ㅅㄱ 이메일은 가능함");
				    	}
				   } else {
					   //이메일 비어있고 폰의 입력 결과가 같은 경우 -> 성공
					    userService.modify(user);
						log.info("이메일 비어있고 폰의 입력 결과가 같은 경우: 님 수정성공ㅋ 올 운좋네");
						String success = "pass";
			    		model.addAttribute("success", success);
						return "redirect:/modify";
				   }
			} else {
			//입력한 이메일이 로그인 이메일과 다른데, 디비에 이메일이  존재하는 경우(not null) -> 디비 저장 불가능
				String error1 = "이미 사용중인 이메일입니다.";
				model.addAttribute("error1", error1);
				log.info("입력한거랑 로그인한 이메일은 다른데 이메일 중복으로 인해 수정에 실패하셨습니다 ㅅㄱ");
				
			}	    
		} else {
			//입력한 이메일과 로그인 이메일이 같은 경우 : 입력한 폰번호가 db에서에서 null이거나 로그인 폰번호가 db에서 null
			if(!phoneModifyResult) { 
				//폰의 입력 결과가 다른 경우
			    	if(dbUserPhone.equals("없음")) {
			    		//폰번호가 비어있는 경우
			    		userService.modify(user);
						log.info("이메일이 같고 폰번호가 비어있는 경우: 님 수정성공ㅋ 올 운좋네");
						String success = "pass";
			    		model.addAttribute("success", success);
						return "redirect:/modify";
			    	} else {
			    		//폰번호가 중복인 경우
			    		String error2 = "이미 사용중인 번호입니다. 이메일은 기존과 같습니다.";
			    		model.addAttribute("error2", error2);
			    		log.info("전화번호 중복으로 인해 수정에 실패하셨습니다 ㅅㄱ 이메일은 똑같음");
			    	}
			} else {
				//폰의 입력 결과가 같은 경우
				userService.modify(user);
				log.info("이메일이 같고 폰 번호도 같은 경우: 님 수정성공ㅋ 올 운좋네");
				String success = "pass";
	    		model.addAttribute("success", success);
				return "redirect:/modify";
			}
	   }
	   model.addAttribute("userInfo", loginUserData);	
	   return "modify/modify";
	}
	
	//로그인 기능 테스트용
	@Login
	@RequestMapping("mypage")
	public String mypage() {
		log.info("실행");
		return "mypage/orderlist/myOti";
	}

}
