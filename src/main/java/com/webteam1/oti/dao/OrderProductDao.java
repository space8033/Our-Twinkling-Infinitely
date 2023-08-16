package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.OrderProduct;

@Mapper
public interface OrderProductDao {
	public  void InsertOrderProducts(OrderProduct orderProduct);
}
