package com.webteam1.oti.service;

import javax.annotation.Resource;

import com.webteam1.oti.dao.CartDao;
import com.webteam1.oti.dto.Cart;

public class CartServiceImpl implements CartService{
	@Resource private CartDao cartDao;

	@Override
	public int addCart(Cart cart) {
		int cartNo = cartDao.cartInsert(cart);
		return cartNo;
	}

	@Override
	public int productExsist(Cart cart) {
		int products = cartDao.cartCheck(cart);
		return products;
	}

}
