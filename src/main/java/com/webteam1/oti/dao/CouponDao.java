package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Coupon;

@Mapper
public interface CouponDao {
	public int insert(Coupon coupon);
	public int delete(Coupon coupon);
	public List<Coupon> getExpiredCoupons(String nowDate);
	
}
