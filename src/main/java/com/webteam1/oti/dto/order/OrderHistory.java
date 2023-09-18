package com.webteam1.oti.dto.order;

import lombok.Data;

@Data
public class OrderHistory {
	private String deliveryStatus;
	private String orderDate;
	private String arrival;
	private int productNo;
	private String productName;
	private int price;
	private int quantity;
}
