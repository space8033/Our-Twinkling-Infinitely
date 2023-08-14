package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.CartDto;

public interface CartService {
	public int addCart(Cart cart);
	public int productCheck(Cart cart);
	public void cartUpdate(Cart cart);
	public int cartDelete(Cart cart);
	public List<Cart> getCartByCkId(String ckId);
	public int getOptionNo(Map<String, Object> map);
	public List<CartDto> getCartList(Cart cart);
}

