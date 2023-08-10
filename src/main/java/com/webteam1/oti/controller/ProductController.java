package com.webteam1.oti.controller;

import java.util.Base64;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.webteam1.oti.dto.Cart;

//github.com/space8033/Our-Twinkling-Infinitely.git

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;
import com.webteam1.oti.dto.Review;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.service.CartService;
import com.webteam1.oti.service.ImageService;
import com.webteam1.oti.service.ProductService;
import com.webteam1.oti.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class ProductController {
	@Resource
	private ProductService productService;
	@Resource
	private ImageService imageService;
	@Resource
	private ReviewService reviewService;
/*	@Resource
	private CartService cartService;*/
	
	//상품 상세 페이지 불러오기
	//상품리스트에서 그 상품에 해당하는 상품 상세정보
	@GetMapping("/detailProduct")
	public String detailView(String pageNo2, String product_no, Model model, HttpSession session) {
		   int productNum = Integer.parseInt(product_no);
		   Product product = productService.getProduct(productNum);
		   if(product.getProduct_imgFile() != null) {
			   String base64Img = Base64.getEncoder().encodeToString(product.getProduct_imgFile());
			   product.setProduct_img(base64Img);
		   }
		   model.addAttribute("product", product);
		   
		   //상품 상세페이지에 있을 이미지 배열 가져오기
		   List<Image> imageList = imageService.getImage(productNum); 
		   for(Image image: imageList) {			   
			   if(image.getImage_file() != null) {
				  String base64Img = Base64.getEncoder().encodeToString(image.getImage_file());
				  image.setImage_fileName(base64Img);
			   }else {
				   return "redirect:/detail/detailView";
			   }
		   }
		   model.addAttribute("images",  imageList);
		   
		   //상품에 해당하는 옵션 리스트 가져오기
		   List<String> optionList = productService.getOptionList(productNum);
		   model.addAttribute("options", optionList);
		   //상품에 해당하는 상품상세이미지 가져오기
		   Image detailImg = imageService.getDetailImg(productNum);
		   if(detailImg.getImage_file() != null) {
			   String base64Img = Base64.getEncoder().encodeToString(detailImg.getImage_file());
			   detailImg.setImage_fileName(base64Img);
		   }
		   model.addAttribute("detailImg", detailImg);
		   List<ProductOption> options = productService.getOptions(productNum);
		   model.addAttribute("optionsList", options);
		   
		   session.setAttribute("productNum", productNum);
		   model.addAttribute("productNum", productNum);
		   
		   log.info(pageNo2);
			if(pageNo2 == null) {
			   //세션에 저장되어 있는지 확인
			   pageNo2 = (String) session.getAttribute("pageNo2");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageNo2 == null) {
				   pageNo2 = "1";
			   }
			}
			log.info(pageNo2);
			int productNo = (int)session.getAttribute("productNum");
			log.info(productNo + "");
			//문자열을 정수로 변환
			int intPageNo = Integer.parseInt(pageNo2);
			//세션에 pageNo를 저장
			session.setAttribute("pageNo2", String.valueOf(pageNo2));
			int totalRows = reviewService.countByProductNo(productNo);
			Pager pager = new Pager(5, 5, totalRows, intPageNo);
			
			Map<String, Object> map = new HashMap<>();
			map.put("startRowNo", pager.getStartRowNo());
			map.put("endRowNo", pager.getEndRowNo());
			map.put("productNo", productNo);
			
			List<Review> list = reviewService.getReviewListByPno(map);
			
			model.addAttribute("pager", pager);
			model.addAttribute("reviews", list);
		   
		   return "detail/detailView";
	}
/*	
	*//**
	 * 상품 상세정보에서 해당 상품을  장바구니에 넣기
	 * @return -> 1: 장바구니 추가 완료, 2: 중복되는 상품, 3: 그 외의 경우 
	 *//*
	@GetMapping("/cart")
	public String menuCart() {
		return "cart/basket";
	}
	
	//비동기 장바구니 구현
	@ResponseBody
	@RequestMapping(value = {"/cart"}, method = {RequestMethod.POST})
	public int datailCart(HttpSession session, HttpServletRequest request, HttpServletResponse response, Cart cart) throws Exception {
		Cart cartDto = new Cart();
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		
		//비회원 장바구니 첫 클릭 시 쿠키 생성
		if(cookie == null && session.getAttribute("loginIng") == null) {
			String ckId = RandomStringUtils.random(6, true, true);
			Cookie cartCookie = new Cookie("cartCookie", ckId);
			cartCookie.setPath("/");//쿠키사용의 유효 디렉토리 설정 
			cartCookie.setMaxAge(60 * 60 * 24 * 1);//쿠키의 유효기간 설정
			response.addCookie(cartCookie);
			cart.setCart_ckId(ckId);
			cart.setCart_isLogin(false);//비회원
			this.cartService.addCart(cartDto);
		
	    //비회원 장바구니 쿠키 생성 후 상품 추가
		}else if(cookie == null && session.getAttribute("loginIng")==null) {
			String ckValue = cookie.getValue();
			cart.setCart_isLogin(false);//비회원
			cart.setCart_ckId(ckValue);
			//장바구니 중복 제한
			if(cartService.productExsist(cartDto) != 0) {
				return 2;
			}
			//쿠키 시간 재설정
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24 * 1);
			response.addCookie(cookie);
			cartService.addCart(cartDto);
		//회원 장바구니 추가	
		}else if(session.getAttribute("loginIng") != null){
			LoginDto loginDto = (LoginDto) session.getAttribute("loginIng");
			cartDto.setUsers_users_id(loginDto.getUsers_id());
			if(cartService.productExsist(cartDto) != 0) {
				return 2;
			}
		}
		return 1;
	}*/
}
