package com.webteam1.oti.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dto.Address;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.service.AddressService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class AddressController {
	@Resource
	private AddressService addressService;
	
	@GetMapping("/address")
	public String addressList(String pageNo, Model model, HttpSession session) {
		if(pageNo == null) {
			   //세션에 저장되어 있는지 확인
			   pageNo = (String) session.getAttribute("pageNo");
			   //저장되어있지 않다면 "1"로 초기화
			   if(pageNo == null) {
				   pageNo = "1";
			   }
		   }
		   //문자열을 정수로 변환
		   int intPageNo = Integer.parseInt(pageNo);
		   //세션에 pageNo를 저장
		   session.setAttribute("pageNo", String.valueOf(pageNo));
		   
		   int totalRows = addressService.getTotalProductNum();
		   Pager pager = new Pager(12, 5, totalRows, intPageNo);
		
		return "mypage/address/myAddress";
	}
	
	@GetMapping("/registerForm")
	public String registerForm() {
		
		return "mypage/address/myAddressAdd";
	}
	
	@PostMapping("/registerForm")
	public String register(Address address) {
		addressService.registerAddress(address);
		
		return "redirect:/";
	}
	
	//실험중
	@GetMapping("/modifyForm")
	public String loadModifyForm() {
		
		return "mypage/address/myAddressModify";
	}
	
	//실험중
	@PostMapping("/modifyForm")
	public String update(Address address) {
		addressService.updateAddress(address);
		
		return "redirect:/";
	}
	
	@PostMapping("/delete")
	public String delete(int address_no) {
		
		return "redirect:/";
	}
}
