package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.OrderProduct;

@Mapper
public interface OrderProductDao {
	public void InsertOrderProducts(OrderProduct orderProduct);
	public List<OrderProduct> getOrderProductByUsersId (String users_id);
	public void addOrderNumber(Map<String, Object> map);
	public List<Integer> selectByOrderNo(int orderNo);
}
