package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Address {
	private int address_no;
	private String address_receiver;
	private String address_basic;
	private String address_detail;
	private boolean address_isdefault;
	private String users_users_id;
	private Date address_createddate;
	private Date address_modifieddate;
	private Date address_deleteddate;
	
}
