package com.webteam1.oti.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	
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
	
	@Override
	public LoginResult login(LoginDto user) {
		LoginDto dbUser = userDao.selectByUsersId(user.getUsers_id());
		log.info(dbUser + "디비유저는 저예욤");
		if(dbUser == null) {
			return LoginResult.FAIL_UID;
		}
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(passwordEncoder.matches(user.getUsers_password(), dbUser.getUsers_password())) {
			if(dbUser.getUsers_type().equals("ENABLED")) {
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
		return user;
	}
	
	@Override
	public void logout(String uid) {

	}
	
	@Override
	public void modifyUser(ModifyDto user) {
		userDao.update(user);
	}
	
	@Override
	public ModifyDto getModifyByUsersId(String usersId) {
		ModifyDto user = userDao.modifyByUsersId(usersId);
		return user;
	}
	
	
}
