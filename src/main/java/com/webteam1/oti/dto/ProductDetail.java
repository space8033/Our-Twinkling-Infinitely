package com.webteam1.oti.dto;

import java.util.List;

import lombok.Data;

@Data
public class ProductDetail {
	private int product_no;
	private String product_name;
	private int product_price;
	private int product_qty;
	private List<String> productoption_type;
	private List<Integer> images_no;
}
