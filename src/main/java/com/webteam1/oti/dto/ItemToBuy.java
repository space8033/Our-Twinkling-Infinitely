package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ItemToBuy {
	private int itemToBuy_no;
	private int itemToBuy_qty;
	private int product_product_no;
	private Date itemToBuy_createdDate;
	private Date itemToBuy_modifiedDate;
	private Date itemToBuy_deletedDate;
	private String users_users_id;
	
}
