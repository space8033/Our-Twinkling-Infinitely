package com.webteam1.oti.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dto.Address;
import com.webteam1.oti.service.AddressService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class AddressController {
	@Resource
	private AddressService addressService;
	
	@GetMapping("/registerForm")
	public String registerForm() {
		
		return "mypage/address/myAddressAdd";
	}
	
	@PostMapping("/registerForm")
	public String register(Address address) {
		log.info(address.toString());
		addressService.registerAddress(address);
		
		return "redirect:/home";
	}
	
	//실험중
	@GetMapping("/modifyAddress")
	public String loadModifyForm() {
		
		return "mypage/address/myAddressModify";
	}
	
	//실험중
	@PostMapping("/modifyAddress")
	public String update(Address address) {
		addressService.registerAddress(address);
		
		return "redirect:/home";
	}
}
