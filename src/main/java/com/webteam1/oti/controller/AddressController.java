package com.webteam1.oti.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dto.Address;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.service.AddressService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
public class AddressController {
	/*@작성자: 오우주
	 * 
	 */
	@Resource
	private AddressService addressService;
	
	//주소지 목록 불러오기
	@GetMapping("/address")
	public String addressList(String pageNo, Model model, HttpSession session) {
		LoginDto userNow = (LoginDto) session.getAttribute("loginIng");
		String user_id = userNow.getUsers_id();
		
		if(pageNo == null) {
	         //세션에 저장되어 있는지 확인
	         if(session.getAttribute("pageNo") == null || session.getAttribute("pageNo") == "") {
	              pageNo = "1";            
	         } else {
	              pageNo = (String) session.getAttribute("pageNo");
	         }
	    }
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		//세션에 pageNo를 저장
		session.setAttribute("pageNo3", String.valueOf(pageNo));
		int totalRows = addressService.countByUserId(user_id);
		Pager pager = new Pager(5, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("user_id", user_id);
		
		List<Address> list = addressService.getList(map);
		
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		
		return "mypage/address/myAddress";
	}
	//주소지 등록 불러오기
	@GetMapping("/registerForm")
	public String registerForm() {
		
		return "mypage/address/myAddressAdd";
	}
	//주소지 등록하기
	@PostMapping("/registerForm")
	public String register(Address address, HttpSession session) {	
		LoginDto userNow = (LoginDto) session.getAttribute("loginIng");
		String user_id = userNow.getUsers_id();
		address.setUsers_users_id(user_id);
		
		if(address.isAddress_isdefault()) {
			if(addressService.getDefault(user_id) != null) {
				Address nowDefault = addressService.getDefault(user_id);
				nowDefault.setAddress_isdefault(false);
				addressService.updateAddress(nowDefault);
			}
		}
		
		addressService.registerAddress(address);
		
		return "redirect:/address";
	}
	//주소지 수정 불러오기
	@GetMapping("/modifyForm")
	public String loadModifyForm(String addressNo, Model model, HttpSession session) {
		Address now = addressService.getByAddressNo(Integer.parseInt(addressNo));
		model.addAttribute("address", now);
		session.setAttribute("addressNo", now.getAddress_no());
		
		return "mypage/address/myAddressModify";
	}
	//주소지 수정하기
	@PostMapping("/modifyForm")
	public String update(Address address, HttpSession session) {
		address.setAddress_no((int) session.getAttribute("addressNo"));
		if(address.isAddress_isdefault() ) {
			LoginDto userNow = (LoginDto) session.getAttribute("loginIng");
			String user_id = userNow.getUsers_id();
			if(addressService.getDefault(user_id) != null) {
				Address nowDefault = addressService.getDefault(user_id);
				nowDefault.setAddress_isdefault(false);
				addressService.updateAddress(nowDefault);
			}
		}
		
		addressService.updateAddress(address);
		return "redirect:/address";
	}
	//주소지 삭제하기
	@PostMapping("/deleteAddress")
	public String delete(int address_no) {
		addressService.deleteAddress(address_no);
		
		return "mypage/address/myAddress";
	}
	
	@GetMapping("/getDaumAddress")
	public String getDaumAddress() {
		return "mypage/address/daum";
	}
}
