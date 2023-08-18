package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;

//OrderProductService 전체 작성자 : 김시온
public interface OrderProductService {
	public List<Product> getProduct(String userId); 
	public List<ProductOption> getOrderProductOption(String userId); 
	public List<OrderProduct> getOrderProduct(String userId); 
	public void addOrderNo(Map<String, Object> map);
	public void deleteOrderProduct(String usersId);
}
