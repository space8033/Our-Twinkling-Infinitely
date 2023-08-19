package com.webteam1.oti.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.ProductOption;

@Mapper
public interface ProductOptionDao {
	public ProductOption selectByOptionNo(int productOptionNo);
	
}
