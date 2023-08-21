package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Pinquiry {
	private int pinquiry_no;
	private String pinquiry_title;
	private String pinquiry_content;
	private int pinquiry_type;
	private int product_product_no;
	private String users_users_id;
	private String pinquiry_createdDate;
	private String pinquiry_modifiedDate;
	private String pinquiry_deletedDate;
}
