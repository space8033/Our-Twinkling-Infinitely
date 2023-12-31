package com.webteam1.oti.service;

import java.util.List;

import com.webteam1.oti.dto.Coupon;
import com.webteam1.oti.dto.CouponMobile;

public interface CouponService {
	public int generateWelcomeCoupon(String users_id);
	public int generateBirthdayCoupon();
	public int generateComeBackCoupon();
	public void useCoupon(int coupon_no);
	public void deleteExpiredCoupons();
	public List<Coupon> getCouponByUsersId(String usersId);
	//쿠폰 개수
	public int numberOfCoupon(String usersId);
	public List<CouponMobile> getCouponMobileByUsersId(String usersId);
	public void deleteCoupon(int coupon_no);

}
