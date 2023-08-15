package com.webteam1.oti.service;


import com.webteam1.oti.dto.user.Agreement;
import com.webteam1.oti.dto.user.JoinDto;

public interface AgreementService {
	public void insertAgreement(JoinDto users, Agreement agreement);
	/*public void updateAddress(Address address);
	public List<Address> getList(Map<String, Object> map);
	public int countByUserId(String userId);
	public Address getByAddressNo(int address_no);
	public Address getDefault(String user_id);*/
}
