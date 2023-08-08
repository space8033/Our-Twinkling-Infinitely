package com.webteam1.oti.dto.user;

import lombok.Data;

@Data
public class LoginDto {
	private String users_id;
	private String users_password;
	private String users_type;
}
