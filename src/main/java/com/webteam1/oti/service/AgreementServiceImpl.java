package com.webteam1.oti.service;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.AgreementDao;
import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.user.Agreement;
import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.ModifyDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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

	@Override
	public void updateAgreement(ModifyDto users, Agreement agreement) {
		Agreement loginUser = agreementDao.selectByUserId(users.getUsers_id());
		log.info(loginUser+"=loginUser");
		loginUser.setAgreement_info(agreement.isAgreement_info());
		log.info(loginUser+"=loginUser");
		loginUser.setAgreement_sns(agreement.isAgreement_sns());
		log.info(loginUser+"=loginUser");
		agreementDao.update(loginUser);
	}
	
	@Override
	public Agreement getByUsersId(String userId) {
		Agreement agreement = agreementDao.selectByUserId(userId);
		return agreement;
	}
	
}
