package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import com.webteam1.oti.dto.InquiryMobile;
import com.webteam1.oti.dto.MyPage;
import com.webteam1.oti.dto.Pinquiry;
import com.webteam1.oti.dto.point.PointHistory;
import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.Login;
import com.webteam1.oti.dto.user.ModifyDto;

//UserService 전체 작성자 : 김시온
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
	
	//JoinForm 수행 service
	public JoinDto getUsersByUserId(String usersId);
	public JoinDto getUsersByUserEmail(String usersEmail);
	public JoinDto getUsersByUserPhone(String usersTel);
	
	//LoginForm 수행 service
	public LoginDto getUser(String uid);
	
	//LogOut
	public void logout(String uid);

	//회원 정보 수정 service
	public void modify(ModifyDto user);
	public ModifyDto getModifyByUsersId(String usersId);
	
	//회원 탈퇴
	public void unjoin(String uid);
	
	//작성자: 성유진
	//마이페이지 이미지 추가
	public void addMyImg(LoginDto user);
	
	//마이페이지 기본이미지로 변경
    public void changeBasic(String usersId);
    //마이페이지 상품문의 수
    public int getMyInquiry(String usersId);
    //마이페이지 상품문의 리스트
	public List<Pinquiry> getMyInquiryList(String usersId);
	public LoginResult loginByMember(Login member);
	public MyPage getMyPageInfo(String userId);
	public List<PointHistory> getPointHistory(String userId);
	public List<InquiryMobile> getInquriyList(String userId);
	public List<InquiryMobile> getAllInquriyList();
	
}
