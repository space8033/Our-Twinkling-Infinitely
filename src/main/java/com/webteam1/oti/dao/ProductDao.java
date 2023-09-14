package com.webteam1.oti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Pinquiry;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductDetail;
import com.webteam1.oti.dto.ProductOption;

@Mapper
public interface ProductDao {
	public int insert(Product product);
	public List<Product> selectByPage(Pager pager);
	public List<Product> selectProduct();
	public Product selectByPno(int product_no);
	public Product selectImgFileDataByPno(int product_no);
	public int updateByPno(Product product);
	public Image selectByImg(Product product);
	public int count();
	//상품에 해당하는 옵션타입
	public List<ProductOption> getProductOption(int product_no);
	//상품 상세정보에서 그 상품에 해당하는 상품옵션 객체
	public List<Product> search(Map<String, Object> map);
	public int countResult(Map<String, Object> map);
	//상품문의 작성
	public int insertPinquiry(Pinquiry pinquiry);
	//페이지 별 상품문의 리스트
	public List<Pinquiry> selectPinquiryByPage(Map<String,Object> map);
	//총 상품문의리스트 행의수 
	public int countPinquiry(int product_no);
	
	
	//모바일 검색기능
	public List<Product> searchProducts(String keyword);
	//상품 상세정보(사진 제외)
	public ProductDetail productDetail(int product_no);
	//상품 타입 가져오기
	public List<String> getProductOptionMobile(int product_no);
	//상품 상세정보(상세보기 썸네일 사진들)
	public List<Image> selectDetailImgThumbnail(int product_no);
	//상품 상세정보(상세 정보 사진)
	public Image selectDetailImgDetail(int product_no);
}
