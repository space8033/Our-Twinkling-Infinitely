package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.CartDto;

@Mapper
public interface CartDao {
	public int cartInsert(Cart cart);
	public void cartUpdate(Cart cart);
	public int cartDelete(Cart cart);
	//이미 추가한 상품의 옵션이 같은 상품을 또 장바구니에  추가할 경우를 알기 위함
	public int cartCheck(Cart cart);
	//상품 번호에 해당하는 상품옵션 내용을 받기 위함
	public int selectOptionNo(Map<String, Object> map);
	public List<Cart> selectByCkId(String ckId);
	public List<CartDto> selectCartList(Cart cart);
}
