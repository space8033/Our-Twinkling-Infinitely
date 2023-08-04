package com.webteam1.oti.service;

import com.webteam1.oti.dto.Users;

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
	
	public JoinResult join(Users user);
	//public LoginResult login(Users user);
	//public void modifyUser(Users user);
	//public void unjoin(String users_id);
	//public void logout(String users_id);
	//public Users getUsers(String users_id);
}
