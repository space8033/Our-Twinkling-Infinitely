package com.webteam1.oti.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.user.JoinDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	
	@Override
	public JoinResult join(JoinDto user) {
		JoinDto dbUserId = userDao.selectByusersId(user.getUsersId());
		log.info("dbUserId: " + dbUserId);
		if(dbUserId != null) {
			return JoinResult.FAIL_DUPLICATED_UID;
		} else {
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			user.setUsersPassword(passwordEncoder.encode(user.getUsersPassword()));
			userDao.insert(user);		
			return JoinResult.SUCCESS;
	
		}
	}
}
