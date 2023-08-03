package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Pinquriy {
	private int pinquiry_no;
	private String pinquiry_title;
	private String pinquiry_content;
	private int product_product_no;
	private String users_users_id;
	private Date pinquiry_createdDate;
	private Date pinquiry_modifiedDate;
	private Date pinquiry_deletedDate;
}
