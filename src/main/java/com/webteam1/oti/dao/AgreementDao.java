package com.webteam1.oti.dao;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.user.Agreement;

//AgreementDao 전체 작성자 : 김시온
@Mapper
public interface AgreementDao {
	//Agreement
	public int insert(Agreement agreement_no);
	
	
}
