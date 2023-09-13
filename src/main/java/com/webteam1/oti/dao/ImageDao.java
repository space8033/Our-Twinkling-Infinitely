package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Image;

@Mapper
public interface ImageDao {
	public List<Image> selectByPno(int pno); 
	public Image getDetail(int pno); 
	public int insertReviewImage(Image image);
	public List<Image> selectByRno(int rno);
	public List<Integer> selectImageNoByReviewNo(int review_review_no);
	public void deleteByRno(int review_no);
	public Image selectImageByImageNo(int image_no);
}
