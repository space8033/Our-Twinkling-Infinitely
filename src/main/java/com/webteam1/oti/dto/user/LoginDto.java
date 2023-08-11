package com.webteam1.oti.dto.user;

import lombok.Data;

//user안에 있는 DTO 전체 작성자 : 김시온
@Data
public class LoginDto {
	private String users_id;
	private String users_password;
	private String users_type;
}
