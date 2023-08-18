package com.webteam1.oti.service;

import com.webteam1.oti.dto.Porder;

//OrderProductService 전체 작성자 : 김시온
public interface OrderService {
	public void addOrder(Porder order); 
	public int getOneOrderNoByUserId(String userId);
	
	
}
