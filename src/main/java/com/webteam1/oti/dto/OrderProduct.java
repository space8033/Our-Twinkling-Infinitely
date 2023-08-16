package com.webteam1.oti.dto;

import lombok.Data;

@Data
public class OrderProduct {
	private int orderProduct_no;
	private int orderProduct_qty;
	private int productOption_productOption_no;
	private String user_id;
}
