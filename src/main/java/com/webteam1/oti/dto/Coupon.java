package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Coupon {
	private int coupon_no;
	private String coupon_code;
	private CouponType coupon_type;
	private int coupon_value;
	private int coupon_condition;
	private Date coupon_createdDate;
	private Date coupon_expiredDate;
	private int users_users_id;
	
	public enum CouponType {
		PERCENTAGE, PRICE
	}
}
