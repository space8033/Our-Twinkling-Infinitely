package com.webteam1.oti.dto.cart;

import lombok.Data;

@Data
public class MobileCart {
	
	private int cart_no;
    private int cart_qty;
    private String product_name;
    private int product_price;
    private String productOption_type;
    private int product_no;

}
