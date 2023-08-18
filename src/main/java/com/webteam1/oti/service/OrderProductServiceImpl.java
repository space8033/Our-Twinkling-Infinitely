package com.webteam1.oti.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.OrderProductDao;
import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dao.ProductOptionDao;
import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductOption;

import lombok.extern.slf4j.Slf4j;

//OrderProductService 전체 작성자 : 김시온
@Slf4j
@Service
public class OrderProductServiceImpl implements OrderProductService {
	@Resource
	private ProductDao productDao;
	@Resource
	private OrderProductDao orderProductDao;
	@Resource
	private ProductOptionDao productOptionDao;
	
	@Override
	public List<Product> getProduct(String userId) {
		//해당 유저의 orderProductList를 구함 주문된 양 옵션넘버  유저아이디 오더넘버
		List<OrderProduct> productList = orderProductDao.getOrderProductByUsersId(userId);
		
		//해당 유저의 orderProductList에서 productOption 리스트 객체 구함
		List<ProductOption> productOptionList = new ArrayList<>();
		List<Product> orderdproductList = new ArrayList<>();

		for (OrderProduct product : productList) {
		    int productOptionNo = product.getProductOption_productOption_no();
		    
		    //주문한 프러덕트의 option 객체들을 가져옴 .
		    ProductOption option = productOptionDao.selectByOptionNo(productOptionNo);
		    productOptionList.add(option);
		    
		    //productOption에 있는 productNo로 product객체들을 받아옴
		    Product orderProduct = productDao.selectByPno(option.getProduct_product_no());
		    orderdproductList.add(orderProduct);
		    
		}
		
		return orderdproductList;
	}
	
	@Override
	public List<ProductOption> getOrderProductOption(String userId) {
		//해당 유저의 orderProductList를 구함 주문된 양 옵션넘버  유저아이디 오더넘버
		List<OrderProduct> productList = orderProductDao.getOrderProductByUsersId(userId);
		
		//해당 유저의 orderProductList에서 productOption 리스트 객체 구함
		List<ProductOption> productOptionList = new ArrayList<>();
		
		for (OrderProduct product : productList) {
			int productOptionNo = product.getProductOption_productOption_no();
			
			//주문한 프러덕트의 option 객체들을 가져옴 .
			ProductOption option = productOptionDao.selectByOptionNo(productOptionNo);
			productOptionList.add(option);
			
		}
		
		return productOptionList;
	}
	
	@Override
	public List<OrderProduct> getOrderProduct(String userId) {
		List<OrderProduct> productList = orderProductDao.getOrderProductByUsersId(userId);
		return productList;
	}

	@Override
	public void addOrderNo(Map<String, Object> map) {
		orderProductDao.addOrderNumber(map);
		
	}
	
}
