package com.webteam1.oti.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.review.Review;
import com.webteam1.oti.dto.review.ReviewReceive;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.interceptor.Login;
import com.webteam1.oti.service.ReviewService;
import com.webteam1.oti.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	@Resource
	private UserService userService;
	//리뷰 가져오기 (진행중)
	@GetMapping("/review")
	public String review(String pageNo2, Model model, HttpSession session) {
		if(pageNo2 == null) {
		   //세션에 저장되어 있는지 확인
		   pageNo2 = (String) session.getAttribute("pageNo2");
		   //저장되어있지 않다면 "1"로 초기화
		   if(pageNo2 == null) {
			   pageNo2 = "1";
		   }
		}
		int productNo = -1;
		if(session.getAttribute("productNum") != null) {
			productNo = (int)session.getAttribute("productNum");			
		}
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

		return "detail/review";
	}
	
	@GetMapping("/reviewDetail")
	public String getReview(String review_no, Model model, HttpSession session) {
		Review review = reviewService.getReviewByRno(Integer.parseInt(review_no));
		model.addAttribute("review", review);
		return "detail/reviewDetail";
	}
	
	@Login
	@GetMapping("/reviewWrite")
	public String getWriteReview(String productNum, Model model, HttpSession session) {
		LoginDto user = (LoginDto) session.getAttribute("loginIng");
		model.addAttribute("user", user.getUsers_id());
		model.addAttribute("productNum", productNum);
		return "detail/reviewWrite";
	}
	
	@PostMapping("/reviewWrite")
	public String writeReview(ReviewReceive review, HttpSession session) {
		LoginDto user = (LoginDto) session.getAttribute("loginIng");
		String user_id = user.getUsers_id();
		
		int productNo = -1;
		if(session.getAttribute("productNum") != null) {
			productNo = (int)session.getAttribute("productNum");			
		}else {
			log.info("망했어유 상품정보가 없어유");
		}
		review.setProductNo(productNo);
		reviewService.createReview(review);
		int reviewNo = reviewService.findByUserId(user_id);
		log.info(reviewNo + "리뷰 번호");
		
		
		return "redirect:/";
	}
}
