package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.CartDto;

@Mapper
public interface CartDao {
	/**
	 * 장바구니에 상품추가
	 * @param cart : 장바구니 객체
	 * @return: 상품 추가한 장바구니 cart_no
	 */
	public int cartInsert(Cart cart);
	public void cartUpdate(Cart cart);
	public int cartCheck(Cart cart);
	public int selectOptionNo(Map<String, Object> map);
	public List<Cart> selectByCkId(String ckId);
	public List<CartDto> selectCartList(Cart cart);
}
