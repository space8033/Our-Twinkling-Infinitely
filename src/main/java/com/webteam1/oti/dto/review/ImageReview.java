package com.webteam1.oti.dto.review;

import lombok.Data;

@Data
public class ImageReview {
	private int review_no;
	private String review_name;
	private int review_rating;
	private String review_title;
	private String review_contents;
	private String review_createdDate;
	private int review_images;
}