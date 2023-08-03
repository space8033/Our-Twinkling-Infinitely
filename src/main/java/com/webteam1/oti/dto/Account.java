package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Account {
	private int account_no;
	private String account_bank;
	private boolean isRef;
	private int users_id;
	private Date account_createddate;
	private Date account_deleteddate;
}
