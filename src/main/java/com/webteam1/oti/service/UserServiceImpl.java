package com.webteam1.oti.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.Users;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	
	@Override
	public JoinResult join(Users user) {
		userDao.insert(user);
		
		return JoinResult.SUCCESS;
	}
}
