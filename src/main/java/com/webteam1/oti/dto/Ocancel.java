package com.webteam1.oti.dto;

import com.webteam1.oti.dto.Excref.ReasonType;

import lombok.Data;

@Data
public class Ocancel {
	private int ocancel_no;
	private ReasonType ocancel_type;
	private int order_order_no;
}
