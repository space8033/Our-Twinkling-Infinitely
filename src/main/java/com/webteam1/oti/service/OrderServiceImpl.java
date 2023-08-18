package com.webteam1.oti.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webteam1.oti.dao.OrderDao;
import com.webteam1.oti.dao.OrderProductDao;
import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Porder;

import lombok.extern.slf4j.Slf4j;

//OrderProductService 전체 작성자 : 김시온
@Slf4j
@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderDao orderDao;
	@Resource
	private OrderProductDao orderProductDao;
	
	@Override
	@Transactional
	public void addOrder(Porder order) {
		orderDao.insertOrder(order);
		//db에 저장할 orderNo
		int orderNo = getOneOrderNoByUserId(order.getUsers_users_id());
		//현재 주문할 상품 목록
		List<OrderProduct> list = orderProductDao.getOrderProductByUsersId(order.getUsers_users_id());
		for(OrderProduct op : list) {
			log.info(op.toString());
			//주문할 각 상품에 대해 orderNo 업데이트 및 주문완료된 상품으로 표시
			Map<String, Object> map = new HashMap<>();
			map.put("orderNo", orderNo);
			map.put("orderproductNo", op.getOrderProduct_no());
			log.info("주문번호: " + orderNo);
			log.info("상품번호: " + op.getOrderProduct_no());
			orderProductDao.addOrderNumber(map);
		}
		
	}

	@Override
	public int getOneOrderNoByUserId(String userId) {
		return orderDao.selectOneByUserId(userId);
	}
	
}
