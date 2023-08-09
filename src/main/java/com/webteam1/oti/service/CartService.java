package com.webteam1.oti.service;

import com.webteam1.oti.dto.Cart;

public interface CartService {
	public int addCart(Cart cart);
	public int productExsist(Cart cart);
}
