package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Users {
	private String users_id;
	private String users_email;
	private String users_password;
	private String users_name;
	private String users_phone;
	private UserType users_type;
	private int users_opoint;
	private Date users_createddate;
	private Date users_modifieddate;
	private Date users_deleteddate;
	private Date users_logindate;
	
	public enum UserType {
		ENABLED, NOT_ENABLED
	}
	
}
