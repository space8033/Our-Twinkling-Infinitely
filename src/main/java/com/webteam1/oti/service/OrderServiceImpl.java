package com.webteam1.oti.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.OrderDao;
import com.webteam1.oti.dao.OrderProductDao;
import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dao.ProductOptionDao;
import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Porder;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;

import lombok.extern.slf4j.Slf4j;

//OrderProductService 전체 작성자 : 김시온
@Slf4j
@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	private ProductDao productDao;
	@Resource
	private OrderProductDao orderProductDao;
	@Resource
	private ProductOptionDao productOptionDao;
	@Resource
	private OrderDao orderDao;
	
	@Override
	public void addOrder(Porder order) {
		
		orderDao.InsertOrder(order);
		
	}
	
	
	
	
}
