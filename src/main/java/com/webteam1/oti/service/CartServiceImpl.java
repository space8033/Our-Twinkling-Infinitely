package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.CartDao;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.CartDto;
@Service
public class CartServiceImpl implements CartService{
	@Resource 
	private CartDao cartDao;

	@Override
	public int addCart(Cart cart) {
		int cartNo = cartDao.cartInsert(cart);
		return cartNo;
	}

	@Override
	public AddCartResult productCheck(Cart cart) {
		int products = cartDao.cartCheck(cart);
		if(products != 0) {
			return AddCartResult.DUPLICATED_PRODUCT_OPTION;
		}
		return AddCartResult.SUCCESS;
	}
	
	//옵션 내용에 해당하는 상품의 옵션번호 가져오기 위함 
	@Override
	public int getOptionNo(Map<String, Object> map) {
		int optionNo = cartDao.selectOptionNo(map);
		return optionNo;
	}

	@Override
	public void cartUpdate(Cart cart) {
		cartDao.cartUpdate(cart);
	}

	@Override
	public List<Cart> getCartByCkId(String ckId) {
		List<Cart> list = cartDao.selectByCkId(ckId);
		return list;
	}

	@Override
	public Map<String, CartDto> getCartList() {
		Map<String, CartDto> map = cartDao.selectCartList();
		return map;
	}

}
