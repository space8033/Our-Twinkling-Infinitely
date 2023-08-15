package com.webteam1.oti.service;


import com.webteam1.oti.dto.user.Agreement;
import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.ModifyDto;

public interface AgreementService {
	public void insertAgreement(JoinDto users, Agreement agreement);
	public void updateAgreement(ModifyDto users, Agreement agreement);
	//public List<Address> getList(Map<String, Object> map);
	//public int countByUserId(String userId);
	public Agreement getByUsersId(String userId);
	//public Address getDefault(String user_id);*/
}
