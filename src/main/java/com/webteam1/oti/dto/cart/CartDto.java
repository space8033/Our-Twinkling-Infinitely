package com.webteam1.oti.dto.cart;

import lombok.Data;

@Data
public class CartDto {

	private int cart_no; 
	private int productOption_productOption_no;
	private String cart_optionContent;
	private String cart_ckId;
	private int cart_qty;
	private String users_users_id;
	private int product_no;
	private String product_name;
	private int product_price;
	private byte[] product_imgFile;
	private int productOption_no; 
	private String productOption_type;
}
