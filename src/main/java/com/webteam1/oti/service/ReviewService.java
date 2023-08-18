package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import com.webteam1.oti.dto.review.Review;
import com.webteam1.oti.dto.review.ReviewReceive;

public interface ReviewService {
	public List<Review> getReviewListByPno(Map<String, Object> map);
	public int countByProductNo(int productNo);
	public Review getReviewByRno(int review_no);
	public void createReview(ReviewReceive review);
	public int findByUserId(Map<String , Object> map);
	public int countByUserId(String userId);
	public List<Review> getReviewListByUser(Map<String, Object> map);
	public void updateReview(ReviewReceive review);
	public void deleteReview(int review_no);
}
