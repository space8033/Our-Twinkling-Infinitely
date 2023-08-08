package com.webteam1.oti.service;


import java.util.List;

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
}
