package com.webteam1.oti.service;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.AgreementDao;
import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.user.Agreement;
import com.webteam1.oti.dto.user.JoinDto;

@Service
public class AgreementServiceImpl implements AgreementService{
	@Resource
	private AgreementDao agreementDao;
	@Resource
	private UserDao userDao;
	
	@Override
	public void insertAgreement(JoinDto users, Agreement agreement) {
		
		agreement.setUsers_users_id(users.getUsers_id());
		agreementDao.insert(agreement);
	}
/*
	@Override
	public void updateAddress(Address address) {
		addressDao.update(address);
	}*/

	
	
}
