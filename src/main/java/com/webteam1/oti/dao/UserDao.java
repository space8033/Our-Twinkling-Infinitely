package com.webteam1.oti.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;

@Mapper
public interface UserDao {
	//JoinDto
	public int insert(JoinDto user);
	//Join은 users가 소문자
	public JoinDto selectByusersId(String usersId);
	public JoinDto selectByusersEmail(String usersEmail);
	public JoinDto selectByusersTel(String usersTel);
	//LoginDto
	//Login은 Users가 대문자
	public LoginDto selectByUsersId(String usersId);
	
	//ModifyDto
	public int update(ModifyDto user); //users_password, users_name, users_phone, users_email 수정
	
}
