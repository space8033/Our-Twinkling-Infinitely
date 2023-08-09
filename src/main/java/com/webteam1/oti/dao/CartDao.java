package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Cart;
import com.webteam1.oti.dto.ProductOption;

@Mapper
public interface CartDao {
	/**
	 * 장바구니에 상품추가
	 * @param cart : 장바구니 객체
	 * @return: 상품 추가한 장바구니 cart_no
	 */
	public int cartInsert(Cart cart);
	public int cartCheck(Cart cart);
}