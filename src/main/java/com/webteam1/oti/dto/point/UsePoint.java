package com.webteam1.oti.dto.point;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//user안에 있는 DTO 전체 작성자 : 김시온
@Data
public class UsePoint {
	private int used_opoint;
	private String used_date;
	private int order_number;
	private String point_status;
	private String point_category;
}
