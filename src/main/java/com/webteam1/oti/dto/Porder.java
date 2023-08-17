package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Porder {
	private int order_no;
	private String users_users_id;
	private int address_no;
	private String address_request;
	private boolean order_cashReceipt;
	private Date order_createdDate;
	private Date order_modifiedDate;
	private Date order_deletedDate;
	private String order_del_fee;
	private int coupon_no;
}
