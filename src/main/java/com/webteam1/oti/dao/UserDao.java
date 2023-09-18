package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Pinquiry;
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
	
	public void updateOpoint(LoginDto users);

	//작성자: 성유진
	//마이페이지 사진 추가
	public void updateMyImage(LoginDto login);
	//기본이미지로 변경(기존에 등록했던 이미지가 있다면 null로 변경)
    public void updateBasic(String usersId);
    //회원별 작성한 상품문의 수
    public int selectMyPinquiry(String usersId);
    //회원별 작성할 상품문의 리스트
    public List<Pinquiry> selectMyPinquiryList(String usersId);
    
    public List<Pinquiry> selectPinquiryListByUserId(String usersId);
    public List<Pinquiry> selectAllPinquiry();
    
    
}
