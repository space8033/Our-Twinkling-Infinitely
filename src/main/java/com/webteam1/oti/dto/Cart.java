package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Cart {
	private int cart_no; //장바구니 PK
	private int cart_qty;
	private int product_product_no;//상품 PK
	private Date cart_createdDate;
	private Date cart_cklimit;//쿠키제한시간(삭제용)
	private String cart_ckid; //쿠키value값
	private String users_users_id;//회원PR
}
