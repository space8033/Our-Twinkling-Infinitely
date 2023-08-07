package com.webteam1.oti.dto;

import lombok.Data;

@Data
public class Address {
	private int address_no;
	private String address_receiver;
	private String address_roadAddress;
	private String address_jibunAddress;
	private String address_extraAddress;
	private String address_detail;
	private DeliveryType deliveryRequest;
	private boolean address_isdefault;
	private String users_users_id;
	private String users_phone;
	
	public enum DeliveryType {
		DOOR, SECURITY_OFFICE, COURIER_BOX
	}
}
