package com.webteam1.oti.controller;

import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webteam1.oti.dto.Cart;
import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;
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
		   
		   return "detail/detailView";
	}
	/*//장바구니 
	  @ResponseBody
	  @RequestMapping(value = {"/cart"}, method = {RequestMethod.POST})
	  public int cart(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cartVO) throws Exception {
		  Cart cart = new Cart();
		  log.info("itemno=" + );
	    Cookie cookie = WebUtils.getCookie(request, "cartCookie");
	    
	    //비회원장바구니 첫 클릭시 쿠키생성
	    if (cookie == null && session.getAttribute("member") == null) {
	      String ckid = RandomStringUtils.random(6, true, true);
	      Cookie cartCookie = new Cookie("cartCookie", ckid);
	      cartCookie.setPath("/");
	      cartCookie.setMaxAge(60 * 60 * 24 * 1);
	      response.addCookie(cartCookie);
	      cartVO.setCart_ckid(ckid);
	      this.mainService.cartInsert(cartVO);
	      
	     //비회원 장바구니 쿠키생성 후 상품추가
	    } else if (cookie != null && session.getAttribute("member") == null) {
	    	
	      String ckValue = cookie.getValue();
	      cartVO.setCart_ckid(ckValue);
	      //장바구니 중복제한
	      if(mainService.cartCheck(cartVO) != 0) {
	    	  return 2;
	      }
	      //쿠키 시간 재설정해주기
	      cookie.setPath("/");
	      cookie.setMaxAge(60 * 60 * 24 * 1);
	      response.addCookie(cookie);
	      
	      mainService.cartInsert(cartVO);
	      
	     //회원 장바구니 상품추가
	    } else if(session.getAttribute("member") != null){
	      MemberVO memberVO = (MemberVO) session.getAttribute("member");
	      cartVO.setCart_mem_no(memberVO.getMEM_NO());
	      if(mainService.cartMemCheck(cartVO) != 0) {
	    	  return 2;
	      }
	      mainService.cartInsert(cartVO);
	    } 
	    return 1;
	  }*/
	
	
}
