package com.webteam1.oti.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.order.CancelInfo;
import com.webteam1.oti.dto.order.OrderInfo;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.interceptor.Login;
import com.webteam1.oti.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/")
public class OrderListRestController {
	@Resource
	private OrderService orderService;
	
	@Login
	@ResponseBody
	@GetMapping("getOrderList")
	public List<OrderInfo> getOrderList(HttpSession session, Model model) throws ParseException {
		LoginDto user = (LoginDto)session.getAttribute("loginIng");
		String userId = user.getUsers_id();
		
		List<OrderInfo> list = orderService.getOrderList(userId);
		
		return list;
	}

	@Login
	@ResponseBody
	@GetMapping("getCancelList")
	public List<CancelInfo> getCancelList(HttpSession session, Model model) throws ParseException {
		List<CancelInfo> list = new ArrayList<>();
		CancelInfo ci1 = new CancelInfo();
		ci1.setProductName("선셋 만달라키 조명 16색 오로라 석양 무지개 감성 인테리어 무드등 선셋 오렌지");
		ci1.setQuantity(2);
		ci1.setPrice(25000);
		ci1.setCrType("취소");
		ci1.setCancelDate("2023.08.20");
		ci1.setOrderedDate("2023.08.16");
		ci1.setOrderNo("202308161111");
		list.add(ci1);
		
		CancelInfo ci2 = new CancelInfo();
		ci2.setProductName("미니 엔틱 무드등 인테리어 감성 조명 귀여운 무드등");
		ci2.setQuantity(1);
		ci2.setPrice(6900);
		ci2.setCrType("취소");
		ci2.setCancelDate("2023.08.20");
		ci2.setOrderedDate("2023.08.16");
		ci2.setOrderNo("202308161111");
		list.add(ci2);

		CancelInfo ci3 = new CancelInfo();
		ci3.setProductName("LED크리스마스 움직이는 기차 오르골 무드등 소품2종(캐롤 8종)");
		ci3.setQuantity(1);
		ci3.setPrice(17900);
		ci3.setCrType("취소");
		ci3.setCancelDate("2023.08.20");
		ci3.setOrderedDate("2023.08.16");
		ci3.setOrderNo("202308161111");
		list.add(ci3);

		CancelInfo ci4 = new CancelInfo();
		ci4.setProductName("무아스 철푸덕 LED 충전식 실리콘 무드등, 화이트");
		ci4.setQuantity(1);
		ci4.setPrice(19900);
		ci4.setCrType("환불");
		ci4.setCancelDate("2023.08.19");
		ci4.setOrderedDate("2023.08.15");
		ci4.setOrderNo("202308151100");
		list.add(ci4);
		
		return list;
	}
}
