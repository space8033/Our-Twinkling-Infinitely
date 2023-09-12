package com.webteam1.oti.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.OrderProductDao;
import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Pinquiry;
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
	public List<Product> getListAll(){
		List<Product> productList = productDao.selectProduct();
		return productList;
	}

	@Override
	public Product getProduct(int product_no) {
		Product product = productDao.selectByPno(product_no);
		return product;
	}
	@Override
	public Product getImgFile(int product_no) {
		Product product = productDao.selectImgFileDataByPno(product_no);
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
		int totalProductNum = productDao.count();
		return totalProductNum;
	}

	@Override
	public List<ProductOption> getOptionList(int product_no) {
		List<ProductOption> productOptions = productDao.getProductOption(product_no);
		return productOptions;
	}
	
	//orderProduct
	@Override
	public void addOrderProduct(OrderProduct orderProduct) {
		orderProductDao.InsertOrderProducts(orderProduct);
	}
	
	//Pinquiry list
	@Override
	public List<Pinquiry> getPinquiryList(Map<String, Object> map) {
		List<Pinquiry> list = productDao.selectPinquiryByPage(map);
		return list;
	}
	
	@Override
	public int getTotalPinquiryNum(int product_no) {
		int totalPinquiryNum = productDao.countPinquiry(product_no);
		return totalPinquiryNum;
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

	@Override
	public int writePinquiry(Pinquiry pinquiry) {
		int insertNo = productDao.insertPinquiry(pinquiry);
		return insertNo;
	}

	@Override
	public List<Product> searchProducts(String keyword) {
		List<Product> products = productDao.searchProducts(keyword);
		return products;
	}
	
	

	
}
