package com.webteam1.oti.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//github.com/space8033/Our-Twinkling-Infinitely.git
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.WebUtils;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.CartDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.service.CartService;
import com.webteam1.oti.service.CartService.AddCartResult;
import com.webteam1.oti.service.ImageService;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/")
@Slf4j
public class CartRestController {
	@Resource
	private CartService cartService;
	//장바구니에 담은 상품 리스트 불러오기
	@ResponseBody
	@GetMapping("/addCart")
	public List<CartDto> cartView (HttpSession session, HttpServletRequest request, HttpServletResponse response, Cart cart, Model model) throws Exception {
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
	   List<CartDto> list = new ArrayList<>();
	    log.info("실행함 나 진짜");
	    //비회원시 쿠키value인 ckId사용
	    if(cookie != null && session.getAttribute("loginIng")==null) {
	    	log.info("웅 나 비회원~~");
			//전에 받은 쿠키 id 값 삽입
			String cartCookie = cookie.getValue();
			log.info(cartCookie);
			cart.setCart_ckId(cartCookie);
			log.info("얍!!!!!!!!!!: " + cart);
			list = cartService.getCartList(cart);
			log.info("리스트 나와라 얍: " + list);
		//회원시 users_id 이용
	    }else if(cookie == null && session.getAttribute("loginIng") != null) {
	    	log.info("웅 나 회원~~");
			//로그인 세션 가져오기
			LoginDto loginDto = (LoginDto) session.getAttribute("loginIng");
			//장바구니에 로그인 한 user_id 삽입
			cart.setUsers_users_id(loginDto.getUsers_id());
			log.info("넣었쥬!");
			list = cartService.getCartList(cart);
			log.info("리스트 나와라 얍: " + list);
	    }
	    
	    return list;
	}
}
