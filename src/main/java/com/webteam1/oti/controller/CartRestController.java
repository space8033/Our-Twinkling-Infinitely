package com.webteam1.oti.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//github.com/space8033/Our-Twinkling-Infinitely.git
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.WebUtils;

import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.CartDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.service.CartService;

import lombok.extern.slf4j.Slf4j;

//장바구니 리스트를 데이터로 반환하기 위함 
@RestController
@RequestMapping("/")
@Slf4j
public class CartRestController {
	@Resource
	private CartService cartService;
	//비동기로 장바구니에 담은 상품 리스트 불러오기
	@ResponseBody
	@GetMapping("/addCart")
	public List<CartDto> cartView (HttpSession session, HttpServletRequest request, HttpServletResponse response, Cart cart, CartDto cartDto, Model model) throws Exception {
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
	    List<CartDto> list = new ArrayList<>();
	    //비회원시 쿠키value인 ckId사용
	    if(cookie != null && session.getAttribute("loginIng")==null) {
			//전에 받은 쿠키 id 값 삽입
			String cartCookie = cookie.getValue();
			cart.setCart_ckId(cartCookie);
			list = cartService.getCartList(cart);
		//회원시 users_id 이용
	    }else if(cookie == null && session.getAttribute("loginIng") != null) {
			//로그인 세션 가져오기
			LoginDto loginDto = (LoginDto) session.getAttribute("loginIng");
			//장바구니에 로그인 한 user_id 삽입
			cart.setUsers_users_id(loginDto.getUsers_id());
			list = cartService.getCartList(cart);
	    }
	    model.addAttribute("list", list);
	    return list;
	}
	@ResponseBody
	@PostMapping("/cartDelete")
	public void cartDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam int cart_no, Model model) throws Exception{
		cartService.cartDelete(cart_no);
	}

}
