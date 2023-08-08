package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Address;

@Mapper
public interface AddressDao {
	public int insert(Address address); 
	public int update(Address address);
	public List<Address> selectByPage(Map<String, Object> map);
	public int countByUserId(String user_id);
	public Address selectByAno(int address_no);
}
