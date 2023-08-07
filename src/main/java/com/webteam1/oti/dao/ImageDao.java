package com.webteam1.oti.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Image;

@Mapper
public interface ImageDao {
	public Image selectByPno(int pno); 
}
