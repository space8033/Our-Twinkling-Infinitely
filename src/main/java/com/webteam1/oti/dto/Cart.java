package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Cart {
	private int cart_no;
	private int cart_qty;
	private int product_product_no;
	private Date cart_createdDate;
	private Date cart_modifiedDate;
	private Date cart_deletedDate;
	private String users_users_id;
	
}
