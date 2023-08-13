package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.ReviewDao;
import com.webteam1.oti.dto.review.Review;
import com.webteam1.oti.dto.review.ReviewReceive;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService{
	@Resource
	private ReviewDao reviewDao;
	
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
	
}
