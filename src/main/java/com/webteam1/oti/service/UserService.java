package com.webteam1.oti.service;

import com.webteam1.oti.dto.user.JoinDto;

public interface UserService {
	public enum JoinResult {
		SUCCESS,
		FAIL_DUPLICATED_UID,
		FAIL_DUPLICATED_EMAIL,
		FAIL_DUPLICATED_TEL
	}
	
	public enum LoginResult {
		SUCCESS,
		FAIL_UID,
		FAIL_PASSWORD,
		FAIL_ENABLED
		
	}
	
	public JoinResult join(JoinDto user);
	//public LoginResult login(Users user);
	//public void modifyUser(Users user);
	//public void unjoin(String users_id);
	//public void logout(String users_id);
	public JoinDto getUsersByUserId(String usersId);
	public JoinDto getUsersByUserEmail(String usersEmail);
	public JoinDto getUsersByUserPhone(String usersTel);
}
