package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Coupon {
	private int coupon_no;
	private CouponType coupon_type;
	private int coupon_value;
	private int coupon_condition;
	private String coupon_createdDate;
	private String coupon_expiredDate;
	private String users_users_id;
	private boolean coupon_used;
	
	public enum CouponType {
		BIRTHDAY_COUPON, DEL_FREE_COUPON, WELCOME_COUPON, NO_COUPON
	}
}
