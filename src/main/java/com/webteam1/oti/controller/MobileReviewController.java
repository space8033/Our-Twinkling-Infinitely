package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.review.ReviewMobile;
import com.webteam1.oti.service.ImageService;
import com.webteam1.oti.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/review")
@Slf4j
public class MobileReviewController {
	@Resource
	private ReviewService reviewService;
	@Resource
	private ImageService imageService;
	
	@GetMapping(value="/getReviewByUser", produces="application/json; charset=UTF-8")
	public List<ReviewMobile> getReviewListByUserId(String userId) {
		List<ReviewMobile> list = reviewService.getReviewListByUserId(userId);
		
		return list;
	}
	
	@GetMapping(value="/getReviewImage", produces="image/jpeg")
	public byte[] getReviewImage(int image_no) {
		Image image = imageService.getImageByImageNo(image_no);
		
		return image.getImage_file();
	}
	
	@GetMapping(value="/deleteReview", produces="application/json; charset=UTF-8")
	public void deleteReview(int reviewNo) {
		reviewService.deleteReview(reviewNo);
	}
}
