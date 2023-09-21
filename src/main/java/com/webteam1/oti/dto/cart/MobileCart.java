package com.webteam1.oti.dto.cart;

import java.util.Date;

import lombok.Data;

@Data
public class MobileCart {
	
	private int cart_no;
    private int cart_qty;
    private String product_name;
    private int product_price;
    private String productOption_type;
    private int productOption_productOption_no;
    private int product_no;
    private int product_product_no;
    private String users_users_id;
    private Date cart_createdDate;

}
