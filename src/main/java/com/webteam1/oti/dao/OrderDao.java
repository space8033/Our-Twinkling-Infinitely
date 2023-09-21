package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.order.Porder;

@Mapper
public interface OrderDao {
	public int insertOrder(Porder order);
	public int selectOneByUserId(String userId);
	public List<Integer> selectByUserId(String userId);
	public Porder selectByOrderNo(int orderNo);
	public List<Porder> selectOrderByUsersId(String userId);
	public int countOrderByUsersId(String usersId);
	public List<Porder> selectByCartId(int cart_no);
}
