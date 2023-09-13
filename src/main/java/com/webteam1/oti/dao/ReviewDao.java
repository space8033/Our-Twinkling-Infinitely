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
	public int selectByUserId(String user_id);
	public int countByUser(String userId);
	public List<Review> selectByUser(Map<String, Object> map);
	public List<Review> selectByUserIdMobile(String userId);
	public List<Integer> selectImageNoByReviewNo(int review_no);
	public void updateReview(ReviewReceive review);
	public void deleteReview(int review_no);
}