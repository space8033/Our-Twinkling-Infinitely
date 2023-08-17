package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;

@Mapper
public interface ProductOptionDao {
	public ProductOption selectByOptionNo(int productOptionNo);
	
	
	
}
