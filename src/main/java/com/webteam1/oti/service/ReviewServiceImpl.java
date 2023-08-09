package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.ReviewDao;
import com.webteam1.oti.dto.Review;

@Service
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
	
}
