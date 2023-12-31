package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.AddressDao;
import com.webteam1.oti.dto.Address;
import com.webteam1.oti.dto.Pager;

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

	@Override
	public List<Address> getList(Map<String, Object> map) {
		
		return addressDao.selectByPage(map);
	}

	@Override
	public int countByUserId(String userId) {
		
		return addressDao.countByUserId(userId);
	}

	@Override
	public Address getByAddressNo(int address_no) {
		
		return addressDao.selectByAno(address_no);
	}

	@Override
	public Address getDefault(String user_id) {
		
		return addressDao.selectByDefault(user_id);
	}

	@Override
	public void deleteAddress(int address_no) {
		addressDao.deleteByAno(address_no);
	}
	
}
