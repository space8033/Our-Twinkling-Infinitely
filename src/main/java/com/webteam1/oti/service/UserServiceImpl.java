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
}
