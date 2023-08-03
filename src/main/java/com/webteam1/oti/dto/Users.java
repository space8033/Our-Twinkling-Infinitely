package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Users {
	private int users_id;
	private String users_email;
	private String users_password;
	private String users_name;
	private String users_phone;
	private int users_opoint;
	private Date users_createddate;
	private Date users_modifieddate;
	private Date users_deleteddate;
	private Date users_logindate;
	private boolean users_type;
	
}
