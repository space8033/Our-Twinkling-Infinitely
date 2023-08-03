package com.webteam1.oti.service;

import com.webteam1.oti.dto.Users;

public interface UserService {
	public enum JoinResult {
		SUCCESS,
		FAIL_DUPLICATED_MID
	}
	
	public JoinResult join(Users user);
}
