package com.webteam1.oti.dto.user;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//user안에 있는 DTO 전체 작성자 : 김시온
@Data
public class LoginDto {
	private String users_id;
	private String users_password;
	private String users_name;
	private String users_createdDate;
	private String users_type;
	//마이페이지에 이미지를 업로드 할 때 이미지의 바이트 배열을 받기 위함
	private MultipartFile users_mattach; 
	//바이트타입의 이미지
	private byte[] users_imgFile;
	//base64로 인코딩된 이미지 
	private String users_img;
}
