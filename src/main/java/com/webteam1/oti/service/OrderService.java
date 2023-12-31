package com.webteam1.oti.service;

import java.text.ParseException;
import java.util.List;

import com.webteam1.oti.dto.order.MobileOrder;
import com.webteam1.oti.dto.order.MobileOrderUser;
import com.webteam1.oti.dto.order.OrderHistory;
import com.webteam1.oti.dto.order.OrderInfo;
import com.webteam1.oti.dto.order.Porder;

//OrderProductService 전체 작성자 : 김시온
public interface OrderService {
	public void addOrder(Porder order); 
	public int getOneOrderNoByUserId(String userId);
	public List<OrderInfo> getOrderList(String userId) throws ParseException;
	public List<OrderHistory> getOrderHistory(String userId) throws ParseException;
	public List<String> getDates(String userId) throws ParseException;
	public List<MobileOrder> getOrderInfos(List<Integer> cart_nos);
	public MobileOrderUser getOrderItems(int cart_no);
	public List<MobileOrder> getOrderInfo(int cart_no);
	//상세정보 -> 구매하기
	public List<MobileOrder> getOrderInfoDetail(String userId, int product_no);
}
