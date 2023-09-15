package com.webteam1.oti.dto.point;

import lombok.Data;

@Data
public class PointHistory {
	private String changeDate;
    private int changePoint;
    private String changeType;
    private int orderNo;
}
