package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;

//UserDao 전체 작성자 : 김시온
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
	public int updateLogindate(String usersId);
	
	//ModifyDto
	public int update(ModifyDto user); //users_password, users_name, users_phone, users_email 수정
	//ModifyDto로부터, Controller에서 get방식할때 사용 비밀번호 없는 버전
	public ModifyDto modifyByUsersId(String usersId);
	//JoinDto로부터 회원 탈퇴
	public int delete(JoinDto user);
	
	//생일인 유저조회
	public List<String> getUsersWithBirthday(String currentDate);
	//마지막 접속한 유저 조회
	public List<String> getLastLoginDate(String threeMonthsAgoDate);
	
}
