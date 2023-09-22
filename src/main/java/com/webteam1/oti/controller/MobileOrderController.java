package com.webteam1.oti.controller;

import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.order.MobileOrder;
import com.webteam1.oti.dto.order.MobileOrderUser;
import com.webteam1.oti.dto.order.OrderHistory;
import com.webteam1.oti.service.OrderService;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/order")
public class MobileOrderController {
	@Resource
	private OrderService orderService;
	@Resource
	private ProductService productService;
	
	@GetMapping(value="/history", produces="application/json; charset=UTF-8")
	public List<OrderHistory> getHistory(String userId) throws ParseException{
		return orderService.getOrderHistory(userId);
	}
	
	@GetMapping(value="/getDates", produces="application/json; charset=UTF-8")
	public List<String> getDates(String userId) throws ParseException{
		return orderService.getDates(userId);
	}
	
	@GetMapping(value="/getOrderItems", produces="application/json; charset=UTF-8") //구매예정 상품들
	public List<MobileOrder> getOrderInfo(int cart_no) {
		log.info("레스트 컨트롤러 실행");
		log.info("리턴값" + orderService.getOrderInfo(cart_no));
		return orderService.getOrderInfo(cart_no);
	}
	
	@GetMapping(value="/getOrderInfo", produces="application/json; charset=UTF-8") //구매자의 정보
	public MobileOrderUser getOrderItem(int cart_no) {
		log.info("레스트 컨트롤러 실행");
		log.info("리턴값" + orderService.getOrderItems(cart_no));
		return orderService.getOrderItems(cart_no);
	}
	
	@GetMapping(value="/getProductImage", produces="image/jpeg")
	public byte[] getProductImage(int product_no) {
		
		return productService.getProduct(product_no).getProduct_imgFile();
	}
	
	@PostMapping(value="/getOrderInfos", produces="application/json; charset=UTF-8") //post로
	public List<MobileOrder> getOrderItems(@RequestBody List<Integer> cartNos){ //리스트는 requsetBody로 받아야 한다
		log.info("cartNos: " + cartNos);
		return orderService.getOrderInfos(cartNos);
	}
	

}
