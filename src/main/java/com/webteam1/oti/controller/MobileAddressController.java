package com.webteam1.oti.controller;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.Address;
import com.webteam1.oti.service.AddressService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/address")
public class MobileAddressController {
	@Resource
	private AddressService addressService;
	
	@PostMapping("/addressRegister")
	public void addAddrees(Address address) {
		address.setDeliveryRequest("");
		address.setAddress_isdefault(false);
		
		addressService.registerAddress(address);
	}
}
