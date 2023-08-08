package com.webteam1.oti.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;

@Service
public class ProductServiceImpl implements ProductService{
	@Resource
	private ProductDao productDao;
	
	@Override
	public List<Product> getList(Pager pager) {
		List<Product> productList = productDao.selectByPage(pager);
	    return productList;
	}

	@Override
	public Product getProduct(int product_no) {
		Product product = productDao.selectByPno(product_no);
		return product;
	}

	@Override
	public void addHitcount(int product_no) {
		Product product = productDao.selectByPno(product_no);
		int hitcount = product.getProduct_hitcount() + 1;
		product.setProduct_hitcount(hitcount);
		productDao.updateByBno(product);	
	}

	@Override
	public int getTotalProductNum() {
		int totalBoardNum = productDao.count();
		return totalBoardNum;
	}

	@Override
	public List<String> getOptionList(int product_no) {
		List<String> productOptionType = productDao.getProductOption(product_no);
		return productOptionType;
	}
	
}
