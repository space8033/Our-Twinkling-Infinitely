package com.webteam1.oti.dto.cart;

import lombok.Data;

@Data
public class CartDto {

	private int cart_no; 
	private int productOption_productOption_no;
	private String cart_optionContent;
	private String cart_ckId;
	private String users_users_id;
	private int product_no;
	private String product_name;
	private int product_price;
	private String product_img;
	private int productOption_no; 
	private String productOption_type;
}
