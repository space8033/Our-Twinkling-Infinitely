package com.webteam1.oti.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.Porder;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/")
public class OrderListRestController {
	@ResponseBody
	@GetMapping("/getOrderList")
	public List<Porder> getOrderList() {
		return null;
	}
}
