package com.webteam1.oti.dto.order;

import lombok.Data;

@Data
public class CancelInfo {
	private String productName;
	private int quantity;
	private int price;
	private String crType;
	private String cancelDate;
	private String orderedDate;
	private String orderNo;
}
