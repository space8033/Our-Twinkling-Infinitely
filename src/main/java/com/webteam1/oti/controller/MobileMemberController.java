package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.InquiryMobile;
import com.webteam1.oti.dto.MyPage;
import com.webteam1.oti.dto.point.PointHistory;
import com.webteam1.oti.dto.user.Login;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.service.CouponService;
import com.webteam1.oti.service.ReviewService;
import com.webteam1.oti.service.UserService;
import com.webteam1.oti.service.UserService.LoginResult;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/member")
public class MobileMemberController {
	@Resource
	private UserService userService;
	@Resource
	private CouponService couponService;
	@Resource
	private ReviewService reviewService;
	
	@GetMapping("/login")
	public String login(Login member) {
		log.info(member.toString());
		LoginResult loginResult = userService.loginByMember(member);
		
		JSONObject jsonObject = new JSONObject();
		if(loginResult == LoginResult.SUCCESS) {
			jsonObject.put("result", "success");
			LoginDto loginDto = userService.getUser(member.getUserId());
			jsonObject.put("userId", loginDto.getUsers_id());
			jsonObject.put("password", loginDto.getUsers_password());
		}else if(loginResult == LoginResult.FAIL_UID) {
			jsonObject.put("result", "Id Not Found");
		}else if(loginResult == LoginResult.FAIL_PASSWORD) {
			jsonObject.put("result", "Wrong Password.");			
		}
		String json = jsonObject.toString();
		
		return json;
	}
	
	@GetMapping(value="/mypage", produces="application/json; charset=UTF-8")
	public MyPage getMyPageInfo(String userId) {
		MyPage mypage = userService.getMyPageInfo(userId);
		
		return mypage;
	}
	
	@GetMapping(value="/myImage", produces="image/jpeg")
	public byte[] getMyImage(String userId) {
		LoginDto user = userService.getUser(userId);
		
		return user.getUsers_imgFile();	
	}
	
	@GetMapping(value="/point", produces="application/json; charset=UTF-8")
	public List<PointHistory> getMyPointHistory(String userId) {
		return userService.getPointHistory(userId);
	}
	
	@GetMapping(value="/totalPoint", produces="application/json; charset=UTF-8")
	public Integer totalPoint(String userId) {
		LoginDto user = userService.getUser(userId);
		
		return user.getUsers_opoint();
	}
	
	@GetMapping(value="/inquriy", produces="application/json; charset=UTF-8")
	public List<InquiryMobile> inquriy(String userId) {
		
		return userService.getInquriyList(userId);
	}
}