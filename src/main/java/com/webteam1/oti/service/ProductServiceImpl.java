package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.OrderProductDao;
import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;

@Service
public class ProductServiceImpl implements ProductService{
	@Resource
	private ProductDao productDao;
	@Resource
	private OrderProductDao orderProductDao;
	
	//product list
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
		productDao.updateByPno(product);
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
	
	@Override
	public List<ProductOption> getOptions(int product_no) {
		List<ProductOption> optionList = productDao.getPOption(product_no);
		return optionList;
	}
	
	//orderProduct
	@Override
	public void addOrderProduct(OrderProduct orderProduct) {
		orderProductDao.InsertOrderProducts(orderProduct);
	}

	//product search
	@Override
	public List<Product> search(Map<String, Object> map) {
		return productDao.search(map);
	}

	@Override
	public int countResult(Map<String, Object> map) {
		return productDao.countResult(map);
	}


	
}
