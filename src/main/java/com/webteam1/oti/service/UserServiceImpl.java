package com.webteam1.oti.service;

import java.util.Base64;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;

//UserServiceImpl 전체 작성자 : 김시온
@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	
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
}	
	
	
