package com.webteam1.oti.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.CouponDao;
import com.webteam1.oti.dao.ReviewDao;
import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.InquiryMobile;
import com.webteam1.oti.dto.MyPage;
import com.webteam1.oti.dto.Pinquiry;
import com.webteam1.oti.dto.point.Point;
import com.webteam1.oti.dto.point.PointHistory;
import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.Login;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;

import lombok.extern.slf4j.Slf4j;

//UserServiceImpl 전체 작성자 : 김시온
@Service
@Slf4j
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	@Resource
	private CouponDao couponDao;
	@Resource
	private ReviewDao reviewDao;
	@Resource
	private PointService pointService;
	@Resource
	private ProductService productService;
	
	//회원가입
	@Override
	public JoinResult join(JoinDto user) {
		JoinDto dbUserId = userDao.selectByusersId(user.getUsers_id());
		JoinDto dbUserEmail = userDao.selectByusersEmail(user.getUsers_email());
		JoinDto dbUserPhone = userDao.selectByusersTel(user.getUsers_phone());
		if(dbUserId != null) {
			return JoinResult.FAIL_DUPLICATED_UID;
		} else if(dbUserEmail != null){
			return JoinResult.FAIL_DUPLICATED_EMAIL;
		} else if(dbUserPhone != null) {
			return JoinResult.FAIL_DUPLICATED_TEL;
		} else {
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			user.setUsers_password(passwordEncoder.encode(user.getUsers_password()));
			userDao.insert(user);		
			return JoinResult.SUCCESS;
		}
	}

	//회원의 아이디로부터 유저정보가져오기
	@Override
	public JoinDto getUsersByUserId(String usersId) {
		JoinDto user = userDao.selectByusersId(usersId);
		return user;
	}

	@Override
	public JoinDto getUsersByUserEmail(String usersEmail) {
		JoinDto user = userDao.selectByusersEmail(usersEmail);
		return user;
	}

	@Override
	public JoinDto getUsersByUserPhone(String usersTel) {
		JoinDto user = userDao.selectByusersTel(usersTel);
		return user;
	}
	
	//로그인
	@Override
	public LoginResult login(LoginDto user) {
		LoginDto dbUser = userDao.selectByUsersId(user.getUsers_id());
		if(dbUser == null) {
			return LoginResult.FAIL_UID;
		}
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(passwordEncoder.matches(user.getUsers_password(), dbUser.getUsers_password())) {
			if(dbUser.getUsers_type().equals("ENABLED")) {
				userDao.updateLogindate(user.getUsers_id());
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_ENABLED;
			}
		} else {
			return LoginResult.FAIL_PASSWORD;
		}
		
	}
	
	//로그인 유효성 검사
	@Override
	public LoginDto getUser(String uid) {
		LoginDto user = userDao.selectByUsersId(uid);
		//마이페이지에 등록한 이미지가 있다면 base64로 인코딩
		if(user.getUsers_imgFile() != null) {
			String base64Img = Base64.getEncoder().encodeToString(user.getUsers_imgFile());
			user.setUsers_img(base64Img);
		}
		return user;
	}
	
	//로그 아웃
	@Override
	public void logout(String uid) {

	}

	//회원정보 수정에서 유저의 아이디로 부터 정보가져오기
	@Override
	public ModifyDto getModifyByUsersId(String usersId) {
		ModifyDto user = userDao.modifyByUsersId(usersId);
		return user;
	}
	
	//회원정보 수정
	@Override
	public void modify(ModifyDto user) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		user.setUsers_password(passwordEncoder.encode(user.getUsers_password()));
		userDao.update(user);	
		
	}
	
	//탈퇴하기
	@Override
	public void unjoin(String uid) {
		JoinDto user = userDao.selectByusersId(uid);
		userDao.delete(user);
	}
	
	//작성자: 성유진
	//마이페이지 사진 추가(변경)
	@Override
	public void addMyImg(LoginDto user) {
		userDao.updateMyImage(user);
	}
	
	//마이페이지 기본이미지로 사진 변경
	@Override
	public void changeBasic(String usersId) {
		userDao.updateBasic(usersId);
	}

	@Override
	public int getMyInquiry(String usersId) {
		int numOfPinquirys = userDao.selectMyPinquiry(usersId);
		return numOfPinquirys;
	}

	@Override
	public List<Pinquiry> getMyInquiryList(String usersId) {
		List<Pinquiry> list = userDao.selectMyPinquiryList(usersId);
		return list;
	}
	
	@Override
	public LoginResult loginByMember(Login member) {
		LoginDto dbUser = userDao.selectByUsersId(member.getUserId());
		if(dbUser == null) {
			return LoginResult.FAIL_UID;
		}
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(passwordEncoder.matches(member.getPassword(), dbUser.getUsers_password())) {
			if(dbUser.getUsers_type().equals("ENABLED")) {
				userDao.updateLogindate(member.getUserId());
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_ENABLED;
			}
		} else {
			return LoginResult.FAIL_PASSWORD;
		}
	}

	@Override
	public MyPage getMyPageInfo(String userId) {
		LoginDto user = userDao.selectByUsersId(userId);
		int couponCount = couponDao.countMyCoupon(userId);
		int reviewCount = reviewDao.countByUser(userId);
		int inquiryCount = getMyInquiry(userId);
		
		MyPage mypage = new MyPage();
		mypage.setName(user.getUsers_name());
		mypage.setCreated_at(user.getUsers_createdDate());
		mypage.setPoint(user.getUsers_opoint());
		mypage.setCouponCount(couponCount);
		mypage.setReviewCount(reviewCount);
		mypage.setInquiryCount(inquiryCount);
		
		return mypage;
	}

	@Override
	public List<PointHistory> getPointHistory(String userId) {
		List<Point> sp = pointService.savedPointList(userId);
		List<Point> up = pointService.usedPointList(userId);
		
		List<PointHistory> list = new ArrayList<>();
		for(Point p : sp) {
			PointHistory pointHistory = new PointHistory();
			pointHistory.setChangeDate(p.getDate());
			pointHistory.setChangePoint(p.getOpoint());
			pointHistory.setChangeType(p.getPoint_status());
			pointHistory.setOrderNo(p.getOrder_number());
			
			list.add(pointHistory);
		}
		
		for(Point p : up) {
			PointHistory pointHistory = new PointHistory();
			pointHistory.setChangeDate(p.getDate());
			pointHistory.setChangePoint(p.getOpoint());
			pointHistory.setChangeType(p.getPoint_status());
			pointHistory.setOrderNo(p.getOrder_number());
			
			list.add(pointHistory);
		}
		
		Comparator<PointHistory> dateComparator = Comparator.comparing(PointHistory::getChangeDate, Comparator.reverseOrder());
		list.sort(dateComparator);
		
		return list;
	}

	@Override
	public List<InquiryMobile> getInquriyList(String userId) {
		List<Pinquiry> inquiries = userDao.selectPinquiryListByUserId(userId);
		List<InquiryMobile> list = new ArrayList<>();
		
		for(Pinquiry p : inquiries) {
			InquiryMobile im = new InquiryMobile();
			im.setInquriyNo(p.getPinquiry_no());
			im.setProductNo(p.getProduct_product_no());
			im.setInquriyType(p.getPinquiry_type());
			im.setProductName(productService.getProduct(p.getProduct_product_no()).getProduct_name());
			im.setCreatedAt(p.getPinquiry_createdDate().substring(0, 10));
			im.setInquriyTitle(p.getPinquiry_title());
			
			list.add(im);
		}
		return list;
	}
	
	@Override
	public List<InquiryMobile> getAllInquriyList() {
		List<Pinquiry> inquiries = userDao.selectAllPinquiry();
		List<InquiryMobile> list = new ArrayList<>();
		
		for(Pinquiry p : inquiries) {
			InquiryMobile im = new InquiryMobile();
			im.setInquriyNo(p.getPinquiry_no());
			im.setProductNo(p.getProduct_product_no());
			im.setInquriyType(p.getPinquiry_type());
			im.setProductName(productService.getProduct(p.getProduct_product_no()).getProduct_name());
			im.setCreatedAt(p.getPinquiry_createdDate().substring(0, 10));
			im.setInquriyTitle(p.getPinquiry_title());
			
			list.add(im);
		}
		return list;
	}

	@Override
	public void updatePoint(String userId, int user_point) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("user_point", user_point);
		log.info("map의 정보들" + map);
		userDao.updatePoint(map);
		log.info("가자 dao로");
	}
}	
	
	
