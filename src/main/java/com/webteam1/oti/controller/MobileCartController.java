package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.MobileCart;
import com.webteam1.oti.service.CartService;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/cart")
public class MobileCartController {
    @Resource
	private CartService cartService;
    @Resource
    private ProductService productService;
   
    @GetMapping(value="/getCartList", produces="application/json; charset=UTF-8")
	public List<MobileCart> getCartList(String user_Id){
		List<MobileCart> list = cartService.getCartAll(user_Id);
		log.info("리스트"+list.size());
		return list;
	}
	
	@GetMapping(value="/fileDownload", produces="image/jpeg")
	public byte[] fileDownload(int product_no){
		Product product = productService.getImgFile(product_no);
		return product.getProduct_imgFile();
	}
	
	@GetMapping(value="/getCartCount",  produces="application/json; charset=UTF-8")
	public int getCartCount(String user_Id) {
		return cartService.numberOfCart(user_Id);
	}
	
	@GetMapping(value="/updateCartCount", produces="application/json; charset=UTF-8")
	public void qtyUpdate(int cart_no, int cart_qty) {
		cartService.updateQty(cart_no, cart_qty);
		log.info("작동중");
	}
	//카트 지우기
	@GetMapping(value="/deleteOneCart", produces="application/json; charset=UTF-8")
	public void deleteOneCart(int cart_no) {
		cartService.cartDelete(cart_no);
	}
	
	//모바일 장바구니 담기
	@PostMapping(value="/addMobileCart", produces="application/json; charset=UTF-8")
	public int addMobileCart(MobileCart mobileCart) {
		cartService.addMobileCart(mobileCart);
		int cart_no = cartService.getCartNoRecent(mobileCart);
		log.info("장바구니 추가");
		return cart_no;
	}
}
