package com.webteam1.oti.dto.user;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewReceive {
	private String reviewTitle;
	private String reviewWriter;
	private int reviewRating;
	private String reviewContents;
	private MultipartFile[] images;
}
