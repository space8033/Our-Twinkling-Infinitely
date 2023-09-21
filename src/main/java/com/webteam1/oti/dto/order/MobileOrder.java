package com.webteam1.oti.dto.order;

import com.webteam1.oti.dto.Coupon.CouponType;

import lombok.Data;

@Data
public class MobileOrder {
	private String user_id; //회원 아이디
	private String users_name;  //회원이름
	private String users_email;	//회원 이메일
	private String users_phone; //회원 전화번호
	/*private String address_receiver; //배송지 수령자 이름
	private String address_roadAddress; //배송지 도로명 주소
	private String address_jibunAddress; //배송지 지번
	private String address_extraAddress;*/ //배송지 상세 주소
	/*private String deliveryRequest;*/ //배송시 요청 사항
	private int cart_no; // 카트번호
    private int cart_qty; // 카트 수량
    private String product_name; //상품명
    private int product_price; //상품 가격
    private String productOption_type; //상품 옵션 이름
    private int product_no; //상품 번호
	private int point; // 사용자 소유 포인트
}
