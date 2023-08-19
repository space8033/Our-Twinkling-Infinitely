package com.webteam1.oti.dto;

import lombok.Data;

@Data
public class Product {
	private int product_no;
	private String product_name;
	private ProductStatus product_status;
	private int product_price;
	private int product_qty;
	private String product_createdDate;
	private String product_detail;
	private int product_hitcount;
	private int product_discountRate;
	private byte[] product_imgFile;
	private String product_img;
	public enum ProductStatus {
		SOLDOUT, REMAIN
	}
	
}
