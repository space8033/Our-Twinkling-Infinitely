package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import com.webteam1.oti.dto.Address;

public interface AddressService {
	public void registerAddress(Address address);
	public void updateAddress(Address address);
	public List<Address> getList(Map<String, Object> map);
	public int countByUserId(String userId);
	public Address getByAddressNo(int address_no);
	public Address getDefault(String user_id);
	public void deleteAddress(int address_no);
}
