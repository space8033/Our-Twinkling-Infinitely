package com.webteam1.oti.dto;

import lombok.Data;

@Data
public class Image {
	private int image_no;
	private String image_name;
	private byte[] image_file;
	private int product_product_no;
	private int review_review_no;
	private String image_fileName;
}
