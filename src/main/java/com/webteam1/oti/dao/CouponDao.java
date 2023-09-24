package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Coupon;

@Mapper
public interface CouponDao {
	public int insert(Coupon coupon);
	public void updateUsedCoupon(int coupon_no);
	public int delete(Coupon coupon);
	public List<Coupon> getExpiredCoupons(String nowDate);
	public List<Coupon> selectCouponByUsersId(String usersId);
	//회원당 쿠폰 개수
	public int countMyCoupon(String usersId);
	public Coupon selectByCouponNo(int coupon_no);
	//모바일용 결제시 구폰 삭제
	public void deleteCoupon(int coupon_no);
}
