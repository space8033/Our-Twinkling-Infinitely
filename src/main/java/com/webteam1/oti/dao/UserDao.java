package com.webteam1.oti.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Users;

@Mapper
public interface UserDao {
	public int insert(Users user); 
	//public Users selectByusers_id(String users_id);
}
