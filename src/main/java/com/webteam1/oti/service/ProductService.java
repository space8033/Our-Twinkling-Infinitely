package com.webteam1.oti.service;


import java.util.List;
import java.util.Map;

import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;

public interface ProductService {
	//product list Service
	public List<Product> getList(Pager pager);
	public Product getProduct(int product_no);
	public void addHitcount(int product_no);
	public int getTotalProductNum();
	public List<String>getOptionList(int product_no);
	public List<ProductOption>getOptions(int product_no);
	//orderProdcut Service
	public void addOrderProduct(OrderProduct orderProduct);
	//product Search Service
	public List<Map<String, Object>> search(Map<String, Object> map);
	public int countResult(Map<String, Object> map);
}
