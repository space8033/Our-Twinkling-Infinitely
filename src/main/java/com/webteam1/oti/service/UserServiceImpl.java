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

		log.info(userDao.selectByusersId("tldhs123")+"");
		JoinDto dbUserId = userDao.selectByusersId(user.getUsers_id());
		log.info(user.getUsers_id());
		log.info(dbUserId + "문자열");


		if(dbUserId != null) {
			return JoinResult.FAIL_DUPLICATED_UID;
		} else {

			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			user.setUsers_password(passwordEncoder.encode(user.getUsers_password()));
			userDao.insert(user);		
			return JoinResult.SUCCESS;
	

		}
	}
}
