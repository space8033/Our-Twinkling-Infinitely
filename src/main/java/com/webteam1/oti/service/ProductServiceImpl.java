package com.webteam1.oti.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.ImageDao;
import com.webteam1.oti.dao.OrderProductDao;
import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Pinquiry;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductDetail;
import com.webteam1.oti.dto.ProductOption;

@Service
public class ProductServiceImpl implements ProductService{
	@Resource
	private ProductDao productDao;
	@Resource
	private OrderProductDao orderProductDao;
	@Resource
	private ImageDao imageDao;
	
	//product list
	@Override
	public List<Product> getList(Pager pager) {
		List<Product> productList = productDao.selectByPage(pager);
	    return productList;
	}
	
	@Override
	public List<Product> getListAll(){
		List<Product> list = new ArrayList<>();
		List<Product> productList = productDao.selectProduct();
		for(Product product : productList) {
			List<Integer> imageList = imageDao.selectImageNoByProductNo(product.getProduct_no());
			List<String> optionType = productDao.getProductOptionMobile(product.getProduct_no());
			
			Product renewproduct = new Product();
			renewproduct.setProduct_no(product.getProduct_no());
			renewproduct.setProduct_name(product.getProduct_name());
			renewproduct.setProduct_price(product.getProduct_price());
			renewproduct.setProduct_option(optionType);
			renewproduct.setImage_no(imageList);
			
			list.add(renewproduct);
		}
		return list;
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
	@Override
	public ProductDetail productDetail(int product_no) {
			
		ProductDetail pdt = productDao.productDetail(product_no);
		
		ProductDetail pd = new ProductDetail();
		List<Integer> imageList = imageDao.selectImageNoByProductNo(product_no);
		List<String> optionType = productDao.getProductOptionMobile(product_no);
		pd.setProduct_no(pdt.getProduct_no());
		pd.setProduct_name(pdt.getProduct_name());
		pd.setProduct_price(pdt.getProduct_price());
		pd.setProductoption_type(optionType);
		pd.setImages_no(imageList);
		
		return pd;
	}

	@Override
	public List<Image> selectDetailImgThumbnail(int product_no) {
		List<Image> products = productDao.selectDetailImgThumbnail(product_no);
		return products;
	}

	@Override
	public Image selectDetailImgDetail(int product_no) {
		Image products = productDao.selectDetailImgDetail(product_no);
		return products;
	}
	

	
}
