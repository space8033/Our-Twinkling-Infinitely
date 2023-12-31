package com.webteam1.oti.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.CouponDao;
import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.Coupon;
import com.webteam1.oti.dto.CouponMobile;
import com.webteam1.oti.dto.Coupon.CouponType;
import com.webteam1.oti.interceptor.Login;

import lombok.extern.slf4j.Slf4j;


@Service
public class CouponServiceImpl implements CouponService{
	@Resource
	private CouponDao couponDao;
	@Resource
	private UserDao userDao;
	
	@Override
	public int generateWelcomeCoupon(String users_id) {
		 Coupon coupon = new Coupon();
		 coupon.setCoupon_type(CouponType.WELCOME_COUPON);
		 coupon.setCoupon_condition(10000);
		 coupon.setCoupon_value(10);
		 coupon.setUsers_users_id(users_id);
		 LocalDateTime now = LocalDateTime.now();
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		 String coupon_createdDate = now.format(formatter);

		 coupon.setCoupon_createdDate(coupon_createdDate);
		 
		 LocalDateTime expiredDate = now.plusMonths(1); // 1개월 후의 날짜와 시간
		 String coupon_expiredDate = expiredDate.format(formatter);
		 coupon.setCoupon_expiredDate(coupon_expiredDate);
	     
		 
	     return couponDao.insert(coupon);
	}
	
	@Override
	@Scheduled(cron = "0 0 0 * * ?")
	public int generateBirthdayCoupon() {
		 SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd");
		 String currentDate = dateFormat.format(new Date());
		 
		 // 월과 일만 추출해서 비교
		 String currentMonthDay = currentDate.substring(0, 5);
				 
		 List<String> users = userDao.getUsersWithBirthday(currentMonthDay);
	     for (String user : users) {
	            Coupon coupon = new Coupon();
	            coupon.setCoupon_type(CouponType.BIRTHDAY_COUPON);
	            coupon.setCoupon_condition(20000);
	            coupon.setCoupon_value(2000);
	            coupon.setUsers_users_id(user);
	            LocalDateTime now = LocalDateTime.now();
	   		 	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	   		 	String coupon_createdDate = now.format(formatter);
	   		 	coupon.setCoupon_createdDate(coupon_createdDate);
	   		 
	   		 	LocalDateTime expiredDate = now.plusMonths(1); // 1개월 후의 날짜와 시간
	   		 	String coupon_expiredDate = expiredDate.format(formatter);
	   		 	coupon.setCoupon_expiredDate(coupon_expiredDate);
	            
	            couponDao.insert(coupon);
	     }
	        
	     return users.size(); // 생성된 쿠폰 수 반환
	}
	
	@Override
	@Scheduled(cron = "0 0 0 * * ?")
	public int generateComeBackCoupon() {
		
		 LocalDate today = LocalDate.now();
	     LocalDate threeMonthsAgo = today.minusMonths(3);

	     DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	     String threeMonthsAgoDate = threeMonthsAgo.format(formatter1);
	     List<String> users = userDao.getLastLoginDate(threeMonthsAgoDate);
	     for (String user : users) {
			 Coupon coupon = new Coupon();
			 coupon.setCoupon_type(CouponType.DEL_FREE_COUPON);
			 coupon.setCoupon_condition(30000);
			 coupon.setCoupon_value(2500);
			 coupon.setUsers_users_id(user);
	         LocalDateTime now = LocalDateTime.now();
	         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	   		 String coupon_createdDate = now.format(formatter);
	   		 coupon.setCoupon_createdDate(coupon_createdDate);
	   		 
	   		 LocalDateTime expiredDate = now.plusMonths(1); // 1개월 후의 날짜와 시간
	   		 String coupon_expiredDate = expiredDate.format(formatter);
	   		 coupon.setCoupon_expiredDate(coupon_expiredDate);
	            
	         couponDao.insert(coupon);
	     }
	     return users.size(); // 생성된 쿠폰 수 반환
	}
	
	@Override
	public void useCoupon(int coupon_no) {
		couponDao.updateUsedCoupon(coupon_no);
	}
	
	@Override
	@Scheduled(cron = "0 0 0 * * ?")
	public void deleteExpiredCoupons() {
		 LocalDate today = LocalDate.now();
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	     String nowDate = today.format(formatter);
	     List<Coupon> expiredCoupons = couponDao.getExpiredCoupons(nowDate);
	        
	        for (Coupon coupon : expiredCoupons) {
	        	couponDao.delete(coupon);
	        }    
	}
	
	@Override
	public List<Coupon> getCouponByUsersId(String usersId) {
		List<Coupon> userCouponList = couponDao.selectCouponByUsersId(usersId);
		return userCouponList;
	}
	
	@Override
	public List<CouponMobile> getCouponMobileByUsersId(String usersId) {
		List<CouponMobile> list = new ArrayList<>();
		
		List<Coupon> couponList = couponDao.selectCouponByUsersId(usersId);
		for(Coupon coupon : couponList) {
			CouponMobile couponMobile = new CouponMobile();
			couponMobile.setCoupon_no(coupon.getCoupon_no());
			couponMobile.setCoupon_type(coupon.getCoupon_type());
			couponMobile.setUsers_id(coupon.getUsers_users_id());
			
			list.add(couponMobile);
		}
		
		return list;
		
	}
	
	@Login
	@Override
	public int numberOfCoupon(String usersId) {
		int numOfCoupon = couponDao.countMyCoupon(usersId);
		return numOfCoupon;
	}

	@Override
	public void deleteCoupon(int coupon_no) {
		couponDao.deleteCoupon(coupon_no);
	}
}
