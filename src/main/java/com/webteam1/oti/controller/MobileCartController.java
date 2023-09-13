package com.webteam1.oti.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.cart.Cart;
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
	public List<Cart> getCartList(){
		List<Cart> list = cartService.getCartAll();
		log.info("리스트"+list.size());
		return list;
	}
	
	@GetMapping(value="/fileDownload", produces="image/jpeg")
	public byte[] fileDownload(int product_no){
		Product product = productService.getImgFile(product_no);
		return product.getProduct_imgFile();
	}
}
