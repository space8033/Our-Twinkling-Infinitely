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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webteam1.oti.dto.Address;
import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.cart.CartDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;
import com.webteam1.oti.interceptor.Login;
import com.webteam1.oti.service.AddressService;
import com.webteam1.oti.service.CartService;
import com.webteam1.oti.service.ProductService;
import com.webteam1.oti.service.UserService;

import lombok.extern.slf4j.Slf4j;

//OrderPayController 전체 작성자 : 김시온
@Slf4j
@Controller
@RequestMapping("/")
public class OrderPayController {
	@Resource
	private ProductService productService;
	@Resource
	private UserService userService;
	@Resource
	private AddressService addressService;
	@Resource
	private CartService cartService;
	
	//http://localhost:8080/our-twinkling-infinitely/ 요청하면 HomeController.index() 실행
	//홈 페이지 불러오기
	
	@Login
	@GetMapping("/orderPay")
	public String orderPay(Model model, HttpSession session) {
		LoginDto loginUser = (LoginDto) session.getAttribute("loginIng");
		ModifyDto loginUserData = userService.getModifyByUsersId(loginUser.getUsers_id());
		model.addAttribute("orderUser", loginUserData);
		
			Address loginUserAddress = addressService.getDefault(loginUser.getUsers_id());
			log.info(loginUserAddress+"loginUserAddress");
			if(loginUserAddress == null) {
				String addressNo = (String) session.getAttribute("addressNum");
				if(addressNo != null) { 
					model.asMap().remove("address");
					Address now = addressService.getByAddressNo(Integer.parseInt(addressNo));
					model.addAttribute("address", now);	
						
					//배송 요청사항 목록 받아오기
					String selectedValue = (String) session.getAttribute("selectedValue");
				    String selectedPwdValue = (String) session.getAttribute("selectedPwdValue");
				    log.info(selectedValue + "=selectedValue");
				    log.info(selectedPwdValue + "=selectedPwdValue");
				    if(selectedValue != null) {
				    	model.addAttribute("selectedValue", selectedValue);
				    	model.addAttribute("selectedPwdValue", selectedPwdValue);
				    }
				    
				    return "orderPay/orderPay";
					    
				}		
				return "orderPay/orderPay";
			} else {
				
				model.addAttribute("address", loginUserAddress);
			}
		 
		String addressNo = (String) session.getAttribute("addressNum");
		if(addressNo != null) { 
			model.asMap().remove("address");
			Address now = addressService.getByAddressNo(Integer.parseInt(addressNo));
			model.addAttribute("address", now);	
				
			//배송 요청사항 목록 받아오기
			String selectedValue = (String) session.getAttribute("selectedValue");
		    String selectedPwdValue = (String) session.getAttribute("selectedPwdValue");
		    
		    if(selectedValue != null) {
		    	model.addAttribute("selectedValue", selectedValue);
		    	model.addAttribute("selectedPwdValue", selectedPwdValue);
		    	return "orderPay/orderPay";
		    }
		}		
		return "orderPay/orderPay";
	}

	@Login
	@PostMapping("/orderPay")
	@ResponseBody
	public String orderPay(HttpSession session) {
        return "orderPay/orderPay";
	}
	
	@Login
	@GetMapping("/addressSelect")
	public String addressSelect(String pageNo, Model model, HttpSession session) {
		LoginDto userNow = (LoginDto) session.getAttribute("loginIng");
		String user_id = userNow.getUsers_id();
		
		if(pageNo == null) {
		   //세션에 저장되어 있는지 확인
		   pageNo = (String) session.getAttribute("pageNo3");
		   //저장되어있지 않다면 "1"로 초기화
		   if(pageNo == null) {
			   pageNo = "1";
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
		
		
		return "orderPay/addressSelect";
	}
	
	@PostMapping("/addressSelect")
	public String addressSelect(@RequestParam("addressNo") String addressNo, HttpSession session) {
		session.setAttribute("addressNum", addressNo);
		
		log.info(addressNo+"addressNo");
		return "redirect:/orderPay";
	}
	
	@Login
	@GetMapping("/addressRequest")
	public String addressRequest(Model model) {
		
		return "orderPay/addressRequest";
	}
	
	@Login
	@PostMapping("/addressRequest")
	public String addressRequest(@RequestParam("selectedValue") String selectedValue, @RequestParam("selectedPwdValue") String selectedPwdValue, HttpSession session) {
		session.setAttribute("selectedValue", selectedValue);
	    session.setAttribute("selectedPwdValue", selectedPwdValue);
	    log.info(selectedValue + "=selectedValue");
	    log.info(selectedPwdValue + "=selectedPwdValue");
	    
        return "redirect:/orderPay";
	}
	
	@Login
	@GetMapping("/addressModify")
	public String modifyAddress(String addressNo, Model model, HttpSession session) {
		log.info(addressNo+"=addressNo");
		Address now = addressService.getByAddressNo(Integer.parseInt(addressNo));
		model.addAttribute("address", now);
		session.setAttribute("addressNo", now.getAddress_no());
		
		return "orderPay/addressModify";
	}
	
	@PostMapping("/addressModify")
	public String addressModify(Address address, HttpSession session) {
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
		return "redirect:/addressSelect";
	}
	
	@Login
	@GetMapping("/addressAdd")
	public String addressAdd() {
		
		return "orderPay/addressAdd";
	}
	
	@PostMapping("/addressAdd")
	public String addressAdd(Address address, HttpSession session) {	
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
		log.info(user_id+"users_id");
		log.info(address+"address");
		
		addressService.registerAddress(address);
		
		return "redirect:/addressSelect";
	}
	
	@PostMapping("/addressdelete")
	public String addressdelete(int address_no) {
		
		return "redirect:/";
	}
	
	@Login
	@GetMapping("/addOrderProduct")
	public String goOrderPay() {
		return "orderPay/orderPay";
	}
	
	@Login
	@PostMapping("/addOrderProduct")
	public String addOrderProduct(@RequestParam(name="productOption_productOption_no", required=false) String[] selectedProductOptionNos,
								  @RequestParam(name="orderProduct_qty", required=false) String[] selectedQtys,
								  @RequestParam(name="productCheckBox", required=false)String[] productCheckBoxes,
								  @RequestParam(name="cart_no", required=false)String[] cartNos,
								  HttpSession session) {
		LoginDto loginDto = (LoginDto) session.getAttribute("loginIng");
		String userId = loginDto.getUsers_id();
		log.info("앙2");
		
		if(productCheckBoxes != null ) {			
			log.info("앙");
			for (int i = 0; i < selectedProductOptionNos.length; i++) {
				OrderProduct orderProduct = new OrderProduct();
				orderProduct.setOrderProduct_qty(Integer.parseInt(selectedQtys[i]));
				orderProduct.setProductOption_productOption_no(Integer.parseInt(selectedProductOptionNos[i]));
				orderProduct.setUsers_users_id(userId);
				productService.addOrderProduct(orderProduct); 
				log.info("앙" + selectedProductOptionNos);
				if(cartNos != null) {					
					cartService.cartDelete(Integer.parseInt(cartNos[i]));
				}
			}
		}
		
	    return "orderPay/orderPay";
	}
	
}