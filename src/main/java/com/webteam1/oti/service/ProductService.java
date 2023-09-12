package com.webteam1.oti.service;


import java.util.List;
import java.util.Map;

import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Pinquiry;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;

public interface ProductService {
	//product list Service
	public List<Product> getList(Pager pager);
	public List<Product> getListAll();
	public Product getProduct(int product_no);
	public Product getImgFile(int product_no);
	public void addHitcount(int product_no);
	public int getTotalProductNum();
	public List<ProductOption>getOptionList(int product_no);
	//orderProdcut Service
	public void addOrderProduct(OrderProduct orderProduct);
	//product Search Service
	public List<Product> search(Map<String, Object> map);
	public int countResult(Map<String, Object> map);
	//productInquiry Service
	public int writePinquiry(Pinquiry pinquiry);
	public List<Pinquiry> getPinquiryList(Map<String, Object> map); 
	public int getTotalPinquiryNum(int product_no);
	//모바일 검색
	public List<Product> searchProducts(String keyword);
}
