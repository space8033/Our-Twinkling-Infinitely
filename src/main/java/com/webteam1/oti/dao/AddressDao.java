package com.webteam1.oti.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Address;

@Mapper
public interface AddressDao {
	public int insert(Address address); 
}
