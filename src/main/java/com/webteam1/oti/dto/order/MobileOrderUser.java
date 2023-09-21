package com.webteam1.oti.dto.order;

import com.webteam1.oti.dto.Coupon.CouponType;

import lombok.Data;

@Data
public class MobileOrderUser {
	private String user_id; //회원 아이디
	private String users_name;  //회원이름
	private String users_email;	//회원 이메일
	private String users_phone; //회원 전화번호
	private int point; // 사용자 소유 포인트
}
