package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.review.Review;
import com.webteam1.oti.dto.review.ReviewReceive;

@Mapper
public interface ReviewDao {
	public List<Review> selectByPno(Map<String , Object> map);
	public int countByPno(int pno);
	public Review selectByRno(int review_no);
	public int insertReview(ReviewReceive review);
	public int selectByUserId(Map<String , Object> map);
	public int countByUser(String userId);
	public List<Review> selectByUser(Map<String, Object> map);
	public void updateReview(ReviewReceive review);
}