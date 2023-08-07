package com.webteam1.oti.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.user.JoinDto;

@Mapper
public interface UserDao {
	public int insert(JoinDto user);
	public JoinDto selectByusersId(String usersId);
	public JoinDto selectByusersEmail(String usersEmail);
	public JoinDto selectByusersTel(String usersTel);
	
}
