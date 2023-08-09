package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int review_no;
	private String review_name;
	private int review_rating;
	private String review_title;
	private String review_contents;
	private String review_summary;
	private String review_createdDate;
	private String review_modifiedDate;
	private String review_deletedDate;
	private int product_no;
	private boolean review_goodOrBad;
}
