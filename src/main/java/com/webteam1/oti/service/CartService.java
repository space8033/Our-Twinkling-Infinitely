package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.CartDto;
import com.webteam1.oti.dto.cart.MobileCart;

public interface CartService {
	public int addCart(Cart cart);
	public int productCheck(Cart cart);
	public void cartUpdate(Cart cart);
	public void qtyUpdate(Cart cart);
	public void cartDelete(int cart_no);
	public List<Cart> getCartByCkId(String ckId);
	public int getOptionNo(Map<String, Object> map);
	public List<CartDto> getCartList(Cart cart);
	public List<MobileCart> getCartAll(String users_users_id);
	public int numberOfCart(String users_users_id);
	public void updateQty(int cart_no, int cart_qty); //모바일용 수량 업데이트
}

