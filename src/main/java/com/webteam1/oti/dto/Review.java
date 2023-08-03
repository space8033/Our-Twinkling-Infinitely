package com.webteam1.oti.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int review_no;
	private String review_name;
	private int review_rating;
	private String review_contents;
	private String review_summary;
	private Date review_createdDate;
	private Date review_modifiedDate;
	private Date review_deletedDate;
	private int orderProduct_orderProduct_no;
	private boolean review_goodOrBad;
}
