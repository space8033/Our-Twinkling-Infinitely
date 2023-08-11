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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.webteam1.oti.dto.Cart;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.service.CartService;
import com.webteam1.oti.service.CartService.AddCartResult;
import com.webteam1.oti.service.ImageService;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class CartController {
	@Resource
	private ProductService productService;
	@Resource
	private ImageService imageService;
    @Resource
	private CartService cartService;

	//메뉴에서 장바구니로 들어가기
	@GetMapping("/cart")
	public String menuCart() {
		return "cart/basket";
	}
	
	//장바구니에 담은 상품 리스트 불러오기
	@ResponseBody
	@RequestMapping(value = {"/cartView"}, method = {RequestMethod.GET})
	public List<Product> cartView (HttpSession session, HttpServletRequest request, HttpServletResponse response, Cart cart, Model model) throws Exception {
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
	    List<Product> list = new ArrayList<>();
	    
	    //비회원시 쿠키value인 ckId사용
	    if(cookie != null && session.getAttribute("loginIng")==null) {
	    	//비회원
			cart.setCart_isLogin(0);
			
			//전에 받은 쿠키 id 값 삽입
			String ckValue = cookie.getValue();
			cart.setCart_ckId(ckValue);
			list = cartService.getCartList();
		
		//회원시 users_id 이용
	    }else if(cookie == null && session.getAttribute("loginIng") != null) {
	    	//로그인 완료
			cart.setCart_isLogin(1);
			//로그인 세션 가져오기
			LoginDto loginDto = (LoginDto) session.getAttribute("loginIng");
			//장바구니에 로그인 한 user_id 삽입
			cart.setUsers_users_id(loginDto.getUsers_id());
			list = cartService.getCartList();
	    }
	    
	    model.addAttribute("carts", list);
	    
	    return list;
	}

	//상품 상세정보에서 장바구니 넣기 구현
	@PostMapping("/addCart")
	public String datailCart( 
				HttpSession session, HttpServletRequest request, 
				HttpServletResponse response, Cart cart, Product product, Model model
			) throws Exception {
		
		//상품옵션 내용
		String productOption = cart.getCart_optionContent();
		//쿠키 생성
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		
		//Map 선언(상품번호와 상품에 해당하는 옵션 내용)
		Map<String, Object> map = new HashMap<>();
		map.put("cart_optionContent", cart.getCart_optionContent());
		map.put("product_product_no", cart.getProduct_product_no());
		
		//선택한 상품의 옵션 번호 결정
		int productOptionNo = cartService.getOptionNo(map);
		//선택한 옵션번호 카트에 넣기
		cart.setProductOption_productOption_no(productOptionNo);
		
		//비회원 장바구니 첫 클릭 시 쿠키 생성
		if(cookie == null && session.getAttribute("loginIng") == null) {
			//비회원
			cart.setCart_isLogin(0);
			
			//쿠키 id 설정
			String ckId = RandomStringUtils.random(6, true, true);
			Cookie cartCookie = new Cookie("cartCookie", ckId);
			//쿠키사용의 유효 디렉토리 설정 
			cartCookie.setPath("/");
			//쿠키의 유효기간 설정(하루)
			cartCookie.setMaxAge(60 * 60 * 24);
			response.addCookie(cartCookie);
			//쿠키 아이디 삽입 
			cart.setCart_ckId(ckId);
			//상품을 추가할 장바구니 결정
			cartService.addCart(cart);
			
			model.addAttribute("carts", cart);
			
		//비회원이 하루 안에 한번 더 장바구니 방문 시 쿠키 생성 후 상품 추가
		}else if(cookie != null && session.getAttribute("loginIng")==null) {
			//비회원
			cart.setCart_isLogin(0);
			
			//전에 받은 쿠키 id 값 삽입
			String ckValue = cookie.getValue();
			cart.setCart_ckId(ckValue);

			//겹치는 상품인지 유효성 검사
			if(cartService.productCheck(cart) == AddCartResult.SUCCESS) {				
				cartService.addCart(cart);

				return "redirect:/cart";
			}
			//쿠키 시간 재설정
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24 * 1);
			response.addCookie(cookie);
			cartService.addCart(cart);
			log.info("cart" + cart);
			cart.setProductOption_productOption_no(cartService.getOptionNo(map));
			log.info("카트: " + cart);
			
			model.addAttribute("carts", cart);
			
		//회원 장바구니 추가	
		}else if(session.getAttribute("loginIng") != null){
			log.info("응 나 로그인");
			//로그인 완료
			cart.setCart_isLogin(1);
			//로그인 세션 가져오기
			LoginDto loginDto = (LoginDto) session.getAttribute("loginIng");
			//장바구니에 로그인 한 user_id 삽입
			cart.setUsers_users_id(loginDto.getUsers_id());
			
			cartService.addCart(cart);
			
			model.addAttribute("carts", cart);
		}
		return "cart/basket";
	}
	
}
