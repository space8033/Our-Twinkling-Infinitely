package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Delivery {
	private int delivery_no;
	private DeliveryStatus delivery_status;
	private Date delivery_arrivalDate;
	private int address_address_no;
	private int order_order_no;
	private int excref_excref_no;
	
	public enum DeliveryStatus {
		PROCESSING, SHIPPED, IN_DELIVERY, DELIVERED 
	}
}
