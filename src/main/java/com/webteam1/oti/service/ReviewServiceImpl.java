package com.webteam1.oti.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.ImageDao;
import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dao.ReviewDao;
import com.webteam1.oti.dto.review.Review;
import com.webteam1.oti.dto.review.ReviewMobile;
import com.webteam1.oti.dto.review.ReviewReceive;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Resource
	private ReviewDao reviewDao;
	@Resource
	private ProductDao productDao;
	@Resource
	private ImageDao imageDao;
	
	@Override
	public List<Review> getReviewListByPno(Map<String, Object> map) {
		return reviewDao.selectByPno(map);
	}

	@Override
	public int countByProductNo(int productNo) {
		return reviewDao.countByPno(productNo);
	}

	@Override
	public Review getReviewByRno(int review_no) {
		return reviewDao.selectByRno(review_no);
	}

	@Override
	public void createReview(ReviewReceive review) {
		reviewDao.insertReview(review);
	}

	@Override
	public int findByUserId(String user_id) {
		return reviewDao.selectByUserId(user_id);
	}

	@Override
	public int countByUserId(String userId) {
		return reviewDao.countByUser(userId);
	}

	@Override
	public List<Review> getReviewListByUser(Map<String, Object> map) {
		return reviewDao.selectByUser(map);
	}
	
	@Override
	public List<ReviewMobile> getReviewListByUserId(String userId) {
		List<ReviewMobile> list = new ArrayList<>();
		List<Review> reviewList = reviewDao.selectByUserIdMobile(userId);
		for(Review review : reviewList) {
			int pno = review.getProduct_no();
			String pname = productDao.selectByPno(pno).getProduct_name();
			List<Integer> imageList = imageDao.selectImageNoByReviewNo(review.getReview_no());
			
			ReviewMobile reviewMobile = new ReviewMobile();
			reviewMobile.setReview_no(review.getReview_no());
			reviewMobile.setReview_name(review.getReview_name());
			reviewMobile.setReview_rating(review.getReview_rating());
			reviewMobile.setReview_title(review.getReview_title());
			reviewMobile.setReview_contents(review.getReview_contents());
			reviewMobile.setReview_createdDate(review.getReview_createdDate());
			reviewMobile.setProduct_no(review.getProduct_no());
			reviewMobile.setProduct_name(pname);
			reviewMobile.setImages_no(imageList);
			
			list.add(reviewMobile);
		}
		
		return list;
	}
	
	@Override
	public List<Integer> getImageNoByReviewNo(int review_no) {
		return reviewDao.selectImageNoByReviewNo(review_no);
	}

	@Override
	public void updateReview(ReviewReceive review) {
		reviewDao.updateReview(review);
	}

	@Override
	public void deleteReview(int review_no) {
		reviewDao.deleteReview(review_no);
	}
	
}
