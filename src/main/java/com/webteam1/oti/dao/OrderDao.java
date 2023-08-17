package com.webteam1.oti.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Porder;

@Mapper
public interface OrderDao {
	public int InsertOrder(Porder order);
	
}
