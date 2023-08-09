package com.webteam1.oti.service;

import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;

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
	public LoginResult login(LoginDto user);
	public void modify(ModifyDto user);
	//public void (String users_id);
	
	//JoinForm 수행 service
	public JoinDto getUsersByUserId(String usersId);
	public JoinDto getUsersByUserEmail(String usersEmail);
	public JoinDto getUsersByUserPhone(String usersTel);
	
	//LoginForm 수행 service
	public LoginDto getUser(String uid);
	//LogOut
	public void logout(String uid);
	//회원 정보 수정 service
	//public void modifyUser(ModifyDto user);
	public ModifyDto getModifyByUsersId(String usersId);
	//ModifyDto로부터, Controller에서 post방식할때 사용 비밀번호 있는 버전
	public ModifyDto getModifyByUserId(String usersId);
	
	//unjoin
	public void unjoin(String uid);
	
	
	
}
