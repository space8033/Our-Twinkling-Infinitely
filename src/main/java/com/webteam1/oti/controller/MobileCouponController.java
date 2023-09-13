package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.CouponMobile;
import com.webteam1.oti.service.CouponService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/coupon")
@Slf4j
public class MobileCouponController {
	@Resource
	private CouponService couponService;
	
	@GetMapping(value="/getCouponByUser", produces="application/json; charset=UTF-8")
	public List<CouponMobile> getCouponByUser(String usersId) {
		List<CouponMobile> userCouponList = couponService.getCouponMobileByUsersId(usersId);
		
		return userCouponList;
	}
}	
