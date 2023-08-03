package com.webteam1.oti.dto;

import lombok.Data;

@Data
public class Payment {
	private int payment_no;
	private PaymentType payment_type;
	private String payment_password;
	private int users_users_id;
	
	public enum PaymentType {
		CARD, ACCOUNT, PHONE, VIRTUAL_ACCOUNT, OPAY
	}
}
