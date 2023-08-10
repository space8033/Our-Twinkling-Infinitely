package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Cart {
	//장바구니 PK
	private int cart_no; 
	private int cart_qty;
	//해당 상품 옵션 (상품옵션)
	private int productOption_productOption_no;
	//해당 상품의 옵션 내용
	private String cart_optionContent;
	//해당 상품 번호
	private int product_product_no;
	private Date cart_createdDate;
	//쿠키제한시간(삭제용)
	private Date cart_cklimit;
	//쿠키value값
	private String cart_ckId; 
	//회원PR
	private String users_users_id;
	//로그인 했는지 유뮤 
	private int cart_isLogin;
}
