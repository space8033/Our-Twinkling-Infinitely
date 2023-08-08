package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;

@Mapper
public interface ProductDao {
	public int insert(Product product);
	public List<Product> selectByPage(Pager pager);
	public Product selectByPno(int product_no);
	public int updateByBno(Product product);
	public Image selectByImg(Product product);
	public int count();
	public List<String>getProductOption(int product_no);
}
