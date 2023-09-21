package com.webteam1.oti.dto.review;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MobileReviewReceive {
	private int review_no;
	private String reviewTitle;
	private String reviewWriter;
	private String reviewRating;
	private String reviewContents;
	private String productNo;
	private MultipartFile[] file;
}
