package com.webteam1.oti.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//github.com/space8033/Our-Twinkling-Infinitely.git

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;
//github.com/space8033/Our-Twinkling-Infinitely.git
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
	private CartService cartService;
    @Resource
    private ReviewService reviewService;

	//상품 상세 페이지 불러오기
	//상품리스트에서 그 상품에 해당하는 상품 상세정보
	@GetMapping("/detailProduct")
	public String detailView(String product_no, String pageNo2, Model model, HttpSession session) {
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
		   model.addAttribute("pageNo2", pageNo2);
		   
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
			
		   model.addAttribute("pager", pager);
		   
		   return "detail/detailView";
	}
	
	@GetMapping("searchResult")
	public String search(String pageNo4, Model model, HttpSession session, String search) {
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
