package com.webteam1.oti.dto;

import lombok.Data;

@Data
public class Users {
	private String usersId;
	private String usersPassword;
	private String usersEmail;
	private String usersName;
	private String usersPhone;
	private String[] agree;
}
