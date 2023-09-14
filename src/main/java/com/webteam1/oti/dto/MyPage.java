package com.webteam1.oti.dto;

import lombok.Data;

@Data
public class MyPage {
	private String name;
	private String created_at;
	private int point;
	private int couponCount;
	private int reviewCount;
	private int inquiryCount;
}
