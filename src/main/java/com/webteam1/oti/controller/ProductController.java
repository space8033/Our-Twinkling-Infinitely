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
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;
import com.webteam1.oti.dto.Review;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.service.CartService;
import com.webteam1.oti.service.CartService.AddCartResult;
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
	private CartService cartService;
    @Resource
    private ReviewService reviewService;

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
		   
		   //----------리뷰 페이징 및 리뷰 리스트 ----------------------------------------------------
			if(pageNo2 == null) {
			   //세션에 저장되어 있는지 확인
			   pageNo2 = (String) session.getAttribute("pageNo2");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageNo2 == null) {
				   pageNo2 = "1";
			   }
			}
			int productNo = (int)session.getAttribute("productNum");
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
			//리뷰 리스트 가져오기
			List<Review> list = reviewService.getReviewListByPno(map);
			
			model.addAttribute("pager", pager);
			model.addAttribute("reviews", list);
		   
		   return "detail/detailView";
	}
	
}
