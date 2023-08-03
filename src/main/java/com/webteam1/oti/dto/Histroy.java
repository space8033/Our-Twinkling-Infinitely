package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Histroy {
	private int history_no;
	private Date history_createdDate;
	private String users_user_id;
	private int product_product_no;
}
