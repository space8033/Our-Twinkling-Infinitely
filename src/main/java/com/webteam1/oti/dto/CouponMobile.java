package com.webteam1.oti.dto;

import com.webteam1.oti.dto.Coupon.CouponType;

import lombok.Data;

@Data
public class CouponMobile {
	private int coupon_no;
	private CouponType coupon_type;
	private String users_id;

}
