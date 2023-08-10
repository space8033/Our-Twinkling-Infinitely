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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.webteam1.oti.dto.Cart;

//github.com/space8033/Our-Twinkling-Infinitely.git

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.service.CartService;
import com.webteam1.oti.service.CartService.AddCartResult;
import com.webteam1.oti.service.ImageService;
import com.webteam1.oti.service.ProductService;

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
	private CartService cartService;
	
	//상품 상세 페이지 불러오기
	//상품리스트에서 그 상품에 해당하는 상품 상세정보
	@GetMapping("/detailProduct")
	public String detailView(String product_no, Model model, HttpSession session) {
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
		   
		   return "detail/detailView";
	}
	
	//메뉴에서 장바구니로 들어가기
	@GetMapping("/cart")
	public String menuCart() {
		return "cart/basket";
	}
	
	//비동기 장바구니 구현
	@ResponseBody
	@PostMapping("/addCart")
	public String datailCart( 
				HttpSession session, HttpServletRequest request, 
				HttpServletResponse response, Cart cart, Model model
			) throws Exception {
		log.info("addCart 실행!!!!!!!!!!!!!!!!!!!!!!!!");
		log.info("cart" + cart);
		String productOption = cart.getCart_optionContent();
		//쿠키 생성
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		//Map 선언
		Map<String, Object> map = new HashMap<>();
		map.put("cart_optionContent", cart.getCart_optionContent());
		map.put("product_product_no", cart.getProduct_product_no());
		//비회원 장바구니 첫 클릭 시 쿠키 생성
		if(cookie == null && session.getAttribute("loginIng") == null) {
			log.info("응 나 비회원");
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
			//선택한 상품의 옵션 번호 결정
			int productOptionNo = cartService.getOptionNo(map);
			//선택한 옵션번호 카트에 넣기
			cart.setProductOption_productOption_no(productOptionNo);
			log.info("카트: " + cart);
		//비회원이 하루 안에 한번 더 장바구니 방문 시 쿠키 생성 후 상품 추가
		}else if(cookie != null && session.getAttribute("loginIng")==null) {
			log.info("응 나 쿠키");
			//비회원
			cart.setCart_isLogin(0);
			
			//전에 받은 쿠키 id 값 삽입
			String ckValue = cookie.getValue();
			cart.setCart_ckId(ckValue);

			//선택한 상품의 옵션 번호 결정
			int productOptionNo = cartService.getOptionNo(map);
			log.info("cart" + cart);
			//선택한 옵션번호 카트에 넣기
			cart.setProductOption_productOption_no(productOptionNo);
			//겹치는 상품인지 유효성 검사
			if(cartService.productCheck(cart) == AddCartResult.SUCCESS) {
				log.info("우효성 검사ㅏㅏㅏㅏㅏ");
				
				cartService.addCart(cart);
				log.info("우효성 검사ㅏㅏㅏㅏㅏ 완료 힛");
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
		//회원 장바구니 추가	
		}else if(session.getAttribute("loginIng") != null){
			log.info("응 나 로그인");
			//로그인 완료
			cart.setCart_isLogin(1);
			//로그인 세션 가져오기
			LoginDto loginDto = (LoginDto) session.getAttribute("loginIng");
			//장바구니에 로그인 한 user_id 삽입
			cart.setUsers_users_id(loginDto.getUsers_id());
			//선택한 상품의 옵션 번호 결정
			int productOptionNo = cartService.getOptionNo(map);
			//선택한 옵션번호 카트에 넣기
			cart.setProductOption_productOption_no(productOptionNo);
			log.info("cart: " + cart);
			cartService.addCart(cart);
			
		}
		return "cart/basket";
	}
}
