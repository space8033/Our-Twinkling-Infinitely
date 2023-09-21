package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.review.MobileReviewReceive;
import com.webteam1.oti.dto.review.ReviewMobile;
import com.webteam1.oti.dto.review.ReviewReceive;
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
	
	@GetMapping(value="/getReviewProductNo", produces="application/json; charset=UTF-8")
	public List<ReviewMobile> getReviewListByProductNo(int product_no) {
		List<ReviewMobile> list = reviewService.getReviewListByProductNo(product_no);
		
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
	
	@PostMapping(value="/writeReview", produces="application/json; charset=UTF-8")
	public void writeReview(MobileReviewReceive review) {
		ReviewReceive reviewReceive = new ReviewReceive();
		reviewReceive.setReviewTitle(review.getReviewTitle());
		reviewReceive.setReviewWriter(review.getReviewWriter());
		reviewReceive.setReviewRating(Integer.parseInt(review.getReviewRating()));
		reviewReceive.setReviewContents(review.getReviewContents());
		reviewReceive.setProductNo(Integer.parseInt(review.getProductNo()));
		reviewReceive.setFile(review.getFile());
		
		log.info(reviewReceive.toString());
		
		reviewService.createReview(reviewReceive);
		int rno = reviewService.findByUserId(reviewReceive.getReviewWriter());
		
		try {
			if(reviewReceive.getFile() != null) {
				MultipartFile mf = reviewReceive.getFile()[0];
				Image image = new Image();
				image.setImage_name(mf.getOriginalFilename());
				image.setImage_fileName(mf.getContentType());
				image.setImage_file(mf.getBytes());
				image.setReview_review_no(rno);
				log.info("image 등록");
				imageService.registerImg(image);
			}	
		} catch (Exception e) {
			
		}
	}
}
