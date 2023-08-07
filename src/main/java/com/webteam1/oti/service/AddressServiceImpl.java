package com.webteam1.oti.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.AddressDao;
import com.webteam1.oti.dto.Address;

@Service
public class AddressServiceImpl implements AddressService{
	@Resource
	private AddressDao addressDao;
	
	@Override
	public void registerAddress(Address address) {
		
		addressDao.insert(address);
	}

	@Override
	public void updateAddress(Address address) {
		addressDao.update(address);
	}
	
}
