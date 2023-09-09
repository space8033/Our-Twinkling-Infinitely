package com.webteam1.oti.controller;

import java.io.Serializable;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
//github.com/space8033/Our-Twinkling-Infinitely.git
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//github.com/space8033/Our-Twinkling-Infinitely.git

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Pinquiry;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.interceptor.Login;
//github.com/space8033/Our-Twinkling-Infinitely.git
import com.webteam1.oti.service.CartService;
import com.webteam1.oti.service.ImageService;
import com.webteam1.oti.service.ProductService;
import com.webteam1.oti.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class ProductController implements Serializable{
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
	public String detailView(String product_no, String pageNo2, String pageNo8, Model model, HttpSession session) {
		   int productNum = Integer.parseInt(product_no);
		   Product product = productService.getProduct(productNum);
		   if(product.getProduct_imgFile() != null) {
			   String base64Img = Base64.getEncoder().encodeToString(product.getProduct_imgFile());
			   product.setProduct_img(base64Img);
		   }
		   model.addAttribute("product", product);
		   //상품 문의하기에 해당 상품의 정보를 가져오기 위함
		   session.setAttribute("product", product);
		   
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
		   List<ProductOption> optionList = productService.getOptionList(productNum);
		   model.addAttribute("options", optionList);
		   
		   //상품에 해당하는 상품상세이미지 가져오기
		   Image detailImg = imageService.getDetailImg(productNum);
		   if(detailImg.getImage_file() != null) {
			   String base64Img = Base64.getEncoder().encodeToString(detailImg.getImage_file());
			   detailImg.setImage_fileName(base64Img);
		   }
		   model.addAttribute("detailImg", detailImg);
		   List<ProductOption> options = productService.getOptionList(productNum);
		   model.addAttribute("optionsList", options);
		   
		   session.setAttribute("productNum", productNum);
		   model.addAttribute("productNum", productNum);
		   model.addAttribute("pageNo2", pageNo2);
		   
		   
		   //----------리뷰 페이징 및 리뷰 리스트 ----------------------------------------------------
		   if(pageNo2 == null) {
		         //세션에 저장되어 있는지 확인
		         if(session.getAttribute("pageNo2") == null || session.getAttribute("pageNo2") == "") {
		              pageNo2 = "1";            
		         } else {
		              pageNo2 = (String) session.getAttribute("pageNo2");
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
		   model.addAttribute("pager", pager);
		   
		   //상품문의 ============================================================
		   //상품 문의하기에 해당 상품의 옵션을 가져오기 위함
		   session.setAttribute("options", options);
		   
		   //상품에 해당하는 상품문의 리스트(page8: 상품문의 페이징)
		   if(pageNo8 == null) {
			   //세션에 저장되어있는지 확인
			   pageNo8 = (String) session.getAttribute("pageNo8");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageNo8 == null) {
				   pageNo8 = "1";
			   }
		   }
		   //문자열을 정수로 변환
		   int intPageNo8 = Integer.parseInt(pageNo8);
		   //세션에 pageNo8를 저장
		   session.setAttribute("pageNo8", String.valueOf(pageNo8));
		   
		   //상품별 총 상품문의 수
		   int pinquiryNum = productService.getTotalPinquiryNum(Integer.parseInt(product_no));
		   Pager pager8 = new Pager(5, 5, pinquiryNum, intPageNo8);
		   
		   Map<String, Object> map2 = new HashMap<>();
		   map2.put("startRowNo", pager.getStartRowNo());
		   map2.put("endRowNo", pager.getEndRowNo());
		   map2.put("product_no", productNo);
		   List<Pinquiry> pinquirys = productService.getPinquiryList(map2);
		   
		   model.addAttribute("pager8", pager8);
		   model.addAttribute("pinquirys", pinquirys);
		   
		   return "detail/detailView";
	}
	
	//상품문의 작성
	@Login
	@GetMapping("/productInquiryWrite")
	public String pInquiryForm(HttpSession session, Model model){
		Product product = (Product)session.getAttribute("product");
		model.addAttribute("product", product);
		
		@SuppressWarnings("unchecked")
		List<ProductOption> options = (List<ProductOption>) session.getAttribute("options");
		model.addAttribute("options", options);
		
		LoginDto user = (LoginDto) session.getAttribute("loginIng");
		model.addAttribute("user", user);
		
		return "detail/productInquiryWrite";
	}
	
	@Login
	@PostMapping("/productInquiryWrite")
	public String pInquiryWrite(HttpSession session, Model model, Pinquiry pinquiry) {
		productService.writePinquiry(pinquiry);

		return "redirect:/productInquiryWrite";
	}
	
	//검색
	@GetMapping("searchResult")
	public String search(String pageNo4, Model model, HttpSession session, String search) {
		//매개 변수 역할을 할 map 선언
		Map<String, Object> map = new HashMap<>();
	    map.put("search", search);
	    
		if(pageNo4 == null) {
		   //세션에 저장되어 있는지 확인
		   pageNo4 = (String) session.getAttribute("pageNo4");
		   //저장되어있지 않다면 "1"로 초기화
		   if(pageNo4 == null) {
			   pageNo4 = "1";
		   }
	   }
	   //문자열을 정수로 변환
	   int intPageNo = Integer.parseInt(pageNo4);
	   //세션에 pageNo를 저장
	   session.setAttribute("pageNo4", String.valueOf(pageNo4));
	   
	   int totalRows = productService.countResult(map);
	   Pager pager = new Pager(12, 5, totalRows, intPageNo);
	   
	   map.put("startRowNo", pager.getStartRowNo());
	   map.put("endRowNo", pager.getEndRowNo());
	   
	   List<Product> list = productService.search(map);
	   for(Product product: list) {
		   if(product.getProduct_imgFile() != null) {
			   //0과 1로 구성된 바이너리 데이터를 base64 문자열로 변환 
			   String base64Img = Base64.getEncoder().encodeToString(product.getProduct_imgFile());
			   product.setProduct_img(base64Img);
		   }
	   }
	   model.addAttribute("pager", pager);
	   model.addAttribute("products", list);
	   model.addAttribute("search", search);
	   
	   return "search/search";
	}
	
}
