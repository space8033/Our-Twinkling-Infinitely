package com.webteam1.oti.dto.user;

import java.util.Date;

import lombok.Data;

//user안에 있는 DTO 전체 작성자 : 김시온
@Data
public class ModifyDto {
	private String users_id;
	private String users_password;
	private String users_name;
	private String users_phone;
	private String users_email;
	private Date users_bdate;
	
}
