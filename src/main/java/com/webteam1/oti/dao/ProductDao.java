package com.webteam1.oti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Product;

@Mapper
public interface ProductDao {
	public int insert(Product product);
	public List<Product> selectByPage(Pager pager);
	public Product selectBypno(int product_no);
	public int updateByBno(Product product);
	public Image selectByImg(Product product);
	public int count();
}
