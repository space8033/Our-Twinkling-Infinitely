package com.webteam1.oti.dto.review;

import java.util.List;

import lombok.Data;

@Data
public class ReviewMobile {
	private int review_no;
	private String review_name;
	private int review_rating;
	private String review_title;
	private String review_contents;
	private String review_createdDate;
	private int product_no;
	private String product_name;
	private List<Integer> images_no;
}
