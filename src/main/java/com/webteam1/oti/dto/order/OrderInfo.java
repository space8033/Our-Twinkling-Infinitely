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
}
