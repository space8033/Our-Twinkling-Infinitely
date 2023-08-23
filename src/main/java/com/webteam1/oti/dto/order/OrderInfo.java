package com.webteam1.oti.dto.order;

import lombok.Data;

@Data
public class OrderInfo {
	private String orderDate;
	private String arrivalDate;
	private String deliveryStatus;
	
	private int productNo;
	private String title;
	private int price;
	private int quantity;
	private byte[] image;
	
	//김시온
	private int orderNo;
	private int totalPrice;
	private String address;
	private String addressRequest;
	private String couponContent;
	private int usedPoint;
	
}
