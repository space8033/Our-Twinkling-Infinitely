package com.webteam1.oti.dto.user;

import lombok.Data;

@Data
public class JoinDto {
	private String users_id;
	private String users_password;
	private String users_email;
	private String users_name;
	private String users_phone;
	private String users_type;
	private String[] agree;
}
