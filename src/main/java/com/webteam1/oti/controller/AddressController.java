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
	
	@GetMapping("/registerAddress")
	public String loadForm() {
		
		return "mypage/address/myAddressAdd";
	}
	
	@PostMapping("/registerAddress")
	public String register(Address address) {
		addressService.registerAddress(address);
		
		return "redirect:/home";
	}
}
