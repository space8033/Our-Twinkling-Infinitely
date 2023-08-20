package com.webteam1.oti.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.OrderDao;
import com.webteam1.oti.dto.order.Porder;
import com.webteam1.oti.dto.point.Point;
import com.webteam1.oti.dto.point.UsePoint;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class PointServiceImpl implements PointService {
	@Resource
	private OrderDao orderDao;
	
	@Override
	public List<Point> savedPointList(String userId) {
		//적립된 적립금 리스트
		List<Porder> orderList = orderDao.selectOrderByUsersId(userId);
		//log.info(orderList.toString()+"나유저33의 주문내역");
		List<Point> savePointList = new ArrayList<>();
		for (Porder order : orderList) {
		    Point point = new Point();
		    // SavePoint 클래스에 맞게 값을 설정해주는 로직
		    point.setOrder_number(order.getOrder_no()); 
		    point.setDate(order.getOrder_createdDate());
		    int totalPrice = order.getOrder_total_price();
		    int savedPoint = (int)(totalPrice*0.005);
		    //log.info(totalPrice+"나 주문 금액");
		    //log.info(savedPoint+"나 적립된 금액");
		    point.setOpoint(savedPoint);
		    point.setPoint_category("주문시 적립된 포인트");
		    point.setPoint_status("적립 완료");
		    if(point.getOpoint() != 0) {
		    	savePointList.add(point);
		    }
		}
		
		return savePointList;
	}
	
	@Override
	public List<Point> usedPointList(String userId) {
		//사용된 적립금 리스트
		List<Porder> orderList = orderDao.selectOrderByUsersId(userId);
		List<Point> usePointList = new ArrayList<>();
		for (Porder order : orderList) {
			Point point = new Point();
		    // UsePoint 클래스에 맞게 값을 설정해주는 로직
			point.setOrder_number(order.getOrder_no()); 
			point.setDate(order.getOrder_createdDate());
			point.setOpoint(order.getUsers_users_opoint());
		    //log.info(order.getUsers_users_opoint()+"나 사용된 금액");
		    point.setPoint_category("주문시 사용된 포인트");
		    point.setPoint_status("사용 완료");
		    if(point.getOpoint() != 0) {
		    	usePointList.add(point);
		    }
		}
		
		return usePointList;
	}
	
	@Override
	public int countPointList(String usersId) {
		
		int countPoint = orderDao.countOrderByUsersId(usersId);
		
		return countPoint;
	}
}
