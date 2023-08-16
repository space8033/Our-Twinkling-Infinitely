package com.webteam1.oti.service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.scheduling.annotation.Scheduled;

import com.webteam1.oti.dao.CouponDao;
import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.Coupon;
import com.webteam1.oti.dto.Coupon.CouponType;
import com.webteam1.oti.dto.user.ModifyDto;

import lombok.extern.slf4j.Slf4j;


@Slf4j
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
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		 String coupon_createdDate = now.format(formatter);

		 coupon.setCoupon_createdDate(coupon_createdDate);
		 
		 LocalDateTime expiredDate = now.plusMonths(1); // 1개월 후의 날짜와 시간
		 String coupon_expiredDate = expiredDate.format(formatter);
		 coupon.setCoupon_expiredDate(coupon_expiredDate);
	     
		 
		 log.info(coupon.toString()+"쿠폰 들어갈 목록이야");
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
		 log.info(currentMonthDay+"오늘 날짜 아마도");
	     for (String user : users) {
	            Coupon coupon = new Coupon();
	            coupon.setCoupon_type(CouponType.BIRTHDAY_COUPON);
	            coupon.setCoupon_condition(20000);
	            coupon.setCoupon_value(2000);
	            coupon.setUsers_users_id(user);
	            LocalDateTime now = LocalDateTime.now();
	   		 	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	   		 	String coupon_createdDate = now.format(formatter);
	   		 	coupon.setCoupon_createdDate(coupon_createdDate);
	   		 
	   		 	LocalDateTime expiredDate = now.plusMonths(1); // 1개월 후의 날짜와 시간
	   		 	String coupon_expiredDate = expiredDate.format(formatter);
	   		 	coupon.setCoupon_expiredDate(coupon_expiredDate);
	            
	            log.info(coupon.toString());
	            couponDao.insert(coupon);
	     }
	        
	     log.info(users.size()+"생성된 쿠폰 수");
	     return users.size(); // 생성된 쿠폰 수 반환
	}
	
	@Override
	public int generateComeBackCoupon(String users_id) {
		 Coupon coupon = new Coupon();
		 coupon.setCoupon_type(CouponType.DEL_FREE_COUPON);
		 coupon.setCoupon_condition(30000);
		 coupon.setCoupon_value(2500);
		 coupon.setUsers_users_id(users_id);
		 
		return couponDao.insert(coupon);
	}
	
/*	@Override
	public void registerAddress(Address address) {
		
		addressDao.insert(address);
	}

	@Override
	public void updateAddress(Address address) {
		addressDao.update(address);
	}

	@Override
	public List<Address> getList(Map<String, Object> map) {
		List<Address> addressList = addressDao.selectByPage(map);
		
		return addressList;
	}

	@Override
	public int countByUserId(String userId) {
		
		return addressDao.countByUserId(userId);
	}

	@Override
	public Address getByAddressNo(int address_no) {
		
		return addressDao.selectByAno(address_no);
	}

	@Override
	public Address getDefault(String user_id) {
		
		return addressDao.selectByDefault(user_id);
	}*/
	
}
