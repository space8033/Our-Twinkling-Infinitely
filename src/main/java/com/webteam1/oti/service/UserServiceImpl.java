package com.webteam1.oti.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.Users;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	
	@Override
	public JoinResult join(Users user) {
//		Users dbUserId = userDao.selectByusers_id(user.getUsers_id());
//		if(dbUserId != null) {
//			return JoinResult.FAIL_DUPLICATED_UID;
//		}
//		
//		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
//		user.setUsers_password(passwordEncoder.encode(user.getUsers_password()));
		
		userDao.insert(user);
		
		return JoinResult.SUCCESS;
	}
}
