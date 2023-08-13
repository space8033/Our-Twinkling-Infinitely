package com.webteam1.oti.dto.review;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewReceive {
	private int review_no;
	private String reviewTitle;
	private String reviewWriter;
	private int reviewRating;
	private String reviewContents;
	private int productNo;
	private MultipartFile[] file;
}
