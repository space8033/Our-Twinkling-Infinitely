package com.webteam1.oti.dto.user;

import com.webteam1.oti.service.UserService.LoginResult;

import lombok.Data;

@Data
public class Login {
	private String userId;
	private String password;
}
