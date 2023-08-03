package com.webteam1.oti.dto;

import lombok.Data;

@Data
public class Excref {
	private int excref_no;
	private ReasonType excref_reasonType;
	private String excref_reason;
	private String excref_solution;
	private boolean excref_isRef;
	
	public enum ReasonType {
		CLIENT_PROBLEM, PRODUCT_PROBLEM, DELIVERY_PROBLEM
	}
}
