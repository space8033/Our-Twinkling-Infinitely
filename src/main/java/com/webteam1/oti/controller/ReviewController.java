package com.webteam1.oti.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
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

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.review.ImageReview;
import com.webteam1.oti.dto.review.Review;
import com.webteam1.oti.dto.review.ReviewReceive;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.interceptor.Login;
import com.webteam1.oti.service.ImageService;
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
	@Resource
	private ImageService imageService;
	/*@ 작성자 오우주
	 * 
	 */
	
	//해당 상품의 전체 리뷰 가져오기
	@GetMapping("/review")
	public String review(String pageNo2, String filter, Model model, HttpSession session) {
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
		
		List<Review> reviewList = reviewService.getReviewListByPno(map);
		List<ImageReview> list = new ArrayList<>();
		for(Review review: reviewList) {
			ImageReview imageReview = new ImageReview();
			imageReview.setReview_no(review.getReview_no());
			imageReview.setReview_name(review.getReview_name());
			imageReview.setReview_rating(review.getReview_rating());
			imageReview.setReview_title(review.getReview_title());
			imageReview.setReview_contents(review.getReview_contents());
			imageReview.setReview_createdDate(review.getReview_createdDate());
			imageReview.setReview_images(imageService.getReviewImages(review.getReview_no()).size());
			
			if(filter != null) {
				model.addAttribute("bold", 1);
				if(imageReview.getReview_images() != 0) {
					list.add(imageReview);
				}
			}else {
				model.addAttribute("bold", 0);
				list.add(imageReview);								
			}
		}
		
		model.addAttribute("pager", pager);
		model.addAttribute("reviews", list);

		return "detail/review";
	}
	
	//리뷰 상세히 보기
	@GetMapping("/reviewDetail")
	public String getReview(String review_no, Model model, HttpSession session) {
		Review review = reviewService.getReviewByRno(Integer.parseInt(review_no));
		model.addAttribute("review", review);
		log.info("review_no:" + review.getReview_no());
		List<Image> images = imageService.getReviewImages(Integer.parseInt(review_no));
		List<String> base64Img = new ArrayList<>();
		
		for(Image image : images) {
			String img = Base64.getEncoder().encodeToString(image.getImage_file());
			base64Img.add(img);
		}
		
		model.addAttribute("base64Img", base64Img);
		
		return "detail/reviewDetail";
	}
	
	//새 리뷰 작성창 띄우기
	@Login
	@GetMapping("/reviewWrite")
	public String getWriteReview(String productNum, Model model, HttpSession session) {
		LoginDto user = (LoginDto) session.getAttribute("loginIng");
		model.addAttribute("user", user.getUsers_id());
		model.addAttribute("productNum", productNum);
		return "detail/reviewWrite";
	}
	
	//리뷰 작성하기
	@Login
	@PostMapping("/reviewWrite")
	public String writeReview(ReviewReceive review, HttpSession session) throws IOException {
		int productNo = -1;
		if(session.getAttribute("productNum") != null) {
			productNo = (int)session.getAttribute("productNum");			
		}else {
		}
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", review.getReviewWriter());
		map.put("productNo", productNo);
		map.put("title", review.getReviewTitle());
		
		review.setProductNo(productNo);
		reviewService.createReview(review);
		int reviewNo = reviewService.findByUserId(map);
		log.info(reviewNo + "리뷰 번호");
		
		MultipartFile[] files = review.getFile();
		
		for(MultipartFile file : files) {
			Image image = new Image();
			if(!file.isEmpty()) {
				image.setImage_name(file.getOriginalFilename());
				image.setImage_fileName(file.getContentType());
				image.setImage_file(file.getBytes());
				image.setReview_review_no(reviewNo);
				
				imageService.registerImg(image);
			}
		}
		return "redirect:/review";
	}
	
	//해당 유저의 리뷰 가져오기
	@GetMapping("/reviewByUser")
	public String reviewByUser(String pageNo5, Model model, HttpSession session) {
		if(pageNo5 == null) {
		   //세션에 저장되어 있는지 확인
		   pageNo5 = (String) session.getAttribute("pageNo5");
		   //저장되어있지 않다면 "1"로 초기화
		   if(pageNo5 == null) {
			   pageNo5 = "1";
		   }
		}
		LoginDto user = (LoginDto) session.getAttribute("loginIng");
		String userId = user.getUsers_id();
		
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo5);
		//세션에 pageNo를 저장
		session.setAttribute("pageNo5", String.valueOf(pageNo5));
		int totalRows = reviewService.countByUserId(userId);
		Pager pager = new Pager(5, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("userId", userId);
		
		List<Review> reviewList = reviewService.getReviewListByUser(map);
		List<ImageReview> list = new ArrayList<>();
		for(Review review: reviewList) {
			ImageReview imageReview = new ImageReview();
			imageReview.setReview_no(review.getReview_no());
			imageReview.setReview_name(review.getReview_name());
			imageReview.setReview_rating(review.getReview_rating());
			imageReview.setReview_title(review.getReview_title());
			imageReview.setReview_contents(review.getReview_contents());
			imageReview.setReview_createdDate(review.getReview_createdDate());
			imageReview.setReview_images(imageService.getReviewImages(review.getReview_no()).size());
			
			list.add(imageReview);
		}
		
		model.addAttribute("pager", pager);
		model.addAttribute("reviews", list);

		return "mypage/orderlist/review";
	}
	
	//마이페이지에서 리뷰 상세보기
	@GetMapping("/myReviewDetail")
	public String getMyPageReview(String review_no, Model model, HttpSession session) {
		Review review = reviewService.getReviewByRno(Integer.parseInt(review_no));
		model.addAttribute("review", review);
		List<Image> images = imageService.getReviewImages(Integer.parseInt(review_no));
		List<String> base64Img = new ArrayList<>();
		
		for(Image image : images) {
			String img = Base64.getEncoder().encodeToString(image.getImage_file());
			base64Img.add(img);
		}
		
		model.addAttribute("base64Img", base64Img);
		
		return "mypage/orderlist/reviewDetail";
	}
	//리뷰 수정하기
	@GetMapping("/modifyReview")
	public String modifyReview(String review_no, Model model, HttpSession session) {
		log.info("여긴옴?");
		Review review = reviewService.getReviewByRno(Integer.parseInt(review_no));
		model.addAttribute("review", review);
		log.info("여긴옴?");
		return "mypage/orderlist/reviewModify";
	}
	
	@Login
	@PostMapping("/modifyReview")
	public String modifyReviewPost(ReviewReceive review, HttpSession session) throws Exception{
		log.info(review.getReviewWriter() + "작성자스");
		log.info(review.getReview_no() + "리뷰번호");
		
		reviewService.updateReview(review);
		imageService.deleteImages(review.getReview_no());
		
		MultipartFile[] files = review.getFile();
		
		for(MultipartFile file : files) {
			Image image = new Image();
			if(!file.isEmpty()) {
				image.setImage_name(file.getOriginalFilename());
				image.setImage_fileName(file.getContentType());
				image.setImage_file(file.getBytes());
				image.setReview_review_no(review.getReview_no());
				
				imageService.registerImg(image);
			}
		}
		
		return "redirect:/review";
	}
}
