package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.CartDto;

public interface CartService {
	public enum AddCartResult {
		SUCCESS,
		DUPLICATED_PRODUCT_OPTION
	}
	public int addCart(Cart cart);
	public AddCartResult productCheck(Cart cart);
	public void cartUpdate(Cart cart);
	public List<Cart> getCartByCkId(String ckId);
	public int getOptionNo(Map<String, Object> map);
	public List<CartDto> getCartList(Cart cart);
}

