package com.webteam1.oti.service;

import java.util.List;

import com.webteam1.oti.dto.point.Point;


public interface PointService {
	public List<Point> savedPointList(String userId);
	public List<Point> usedPointList(String userId);
	public int countPointList(String usersId);
}
