package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.cart.CartDto;
import com.webteam1.oti.dto.cart.MobileCart;

@Mapper
public interface CartDao {
	public int cartInsert(Cart cart);
	public void cartUpdate(Cart cart);
	public void qtyUpdate(Cart cart);
	public void cartDelete(int cart_no);
	//이미 추가한 상품의 옵션이 같은 상품을 또 장바구니에  추가할 경우를 알기 위함
	public int cartCheck(Cart cart);
	//상품 번호에 해당하는 상품옵션 내용을 받기 위함
	public int selectOptionNo(Map<String, Object> map);
	public List<Cart> selectByCkId(String ckId);
	public List<CartDto> selectCartList(Cart cart);
	public List<MobileCart> selectCart(String users_users_id);
	public int countCart(String users_users_id);
	public void updateQty(Map<String, Object> map);
	public Cart selectCartByCartNo(int cart_no); // 주문결제시 장바구니에서 선택된 cart_no로 카트의 정보를 불러옴
	//모바일 장바구니 추가
	public int mobileCartInsert(MobileCart mobileCart);
	public List<Integer> cartSelectByUserId(MobileCart mobileCart);
}
