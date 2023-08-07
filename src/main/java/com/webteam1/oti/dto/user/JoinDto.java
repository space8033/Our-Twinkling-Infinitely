package com.webteam1.oti.dto.user;

import lombok.Data;

@Data
public class JoinDto {
	private String usersId;
	private String usersPassword;
	private String usersEmail;
	private String usersName;
	private String usersPhone;
	private String[] agree;
}
