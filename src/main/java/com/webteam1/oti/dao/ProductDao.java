package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

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
	public int updateByPno(Product product);
	public Image selectByImg(Product product);
	public int count();
	//상품에 해당하는 옵션타입
	public List<String>getProductOption(int product_no);
	//상품 상세정보에서 그 상품에 해당하는 상품옵션 객체
	public List<ProductOption> getPOption (int product_no);
	public List<Product> search(Map<String, Object> map);
	public int countResult(Map<String, Object> map);
}
