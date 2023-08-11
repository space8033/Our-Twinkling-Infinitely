package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Review;

@Mapper
public interface ReviewDao {
	public List<Review> selectByPno(Map<String , Object> map);
	public int countByPno(int pno);
	public Review selectByRno(int review_no);
}