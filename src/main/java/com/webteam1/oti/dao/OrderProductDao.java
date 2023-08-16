package com.webteam1.oti.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.OrderProduct;

@Mapper
public interface OrderProductDao {
	public int orderProductInsert(OrderProduct orderProduct);
}
