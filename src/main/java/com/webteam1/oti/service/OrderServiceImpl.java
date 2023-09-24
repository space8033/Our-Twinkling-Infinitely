package com.webteam1.oti.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webteam1.oti.dao.AddressDao;
import com.webteam1.oti.dao.CartDao;
import com.webteam1.oti.dao.CouponDao;
import com.webteam1.oti.dao.OrderDao;
import com.webteam1.oti.dao.OrderProductDao;
import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dao.ProductOptionDao;
import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.Address;
import com.webteam1.oti.dto.Coupon;
import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.ProductDetail;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.order.MobileOrder;
import com.webteam1.oti.dto.order.MobileOrderUser;
import com.webteam1.oti.dto.order.OrderHistory;
import com.webteam1.oti.dto.order.OrderInfo;
import com.webteam1.oti.dto.order.Porder;
import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;

import lombok.extern.slf4j.Slf4j;

//OrderProductService 전체 작성자 : 김시온
@Slf4j
@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderDao orderDao;
	@Resource
	private OrderProductDao orderProductDao;
	@Resource
	private ProductOptionDao productOptionDao;
	@Resource
	private ProductDao productDao;
	@Resource
	private CouponDao couponDao;
	@Resource
	private UserDao userDao;
	@Resource
	private AddressDao addressDao;
	@Resource
	private CartDao cartDao;
	
	
	@Override
	@Transactional
	public void addOrder(Porder order) {
		orderDao.insertOrder(order);
		//db에 저장할 orderNo
		int orderNo = getOneOrderNoByUserId(order.getUsers_users_id());
		//현재 주문할 상품 목록
		List<OrderProduct> list = orderProductDao.getOrderProductByUsersId(order.getUsers_users_id());
		for(OrderProduct op : list) {
			//주문할 각 상품에 대해 orderNo 업데이트 및 주문완료된 상품으로 표시
			Map<String, Object> map = new HashMap<>();
			map.put("orderNo", orderNo);
			map.put("orderproductNo", op.getOrderProduct_no());
			orderProductDao.addOrderNumber(map);
		}
		couponDao.updateUsedCoupon(order.getCoupon_coupon_no());
		
		//주문시 적립금 사용/적립 기능
		LoginDto user = userDao.selectByUsersId(order.getUsers_users_id());
		int beforePoint = user.getUsers_opoint();
		int usedPoint = order.getUsers_users_opoint();
		int totalPrice = order.getOrder_total_price();
		int savePoint = (int) (totalPrice * 0.005);
		int afterPoint = beforePoint - usedPoint + savePoint; 
		
		user.setUsers_opoint(afterPoint);
		userDao.updateOpoint(user);
		
	}

	@Override
	public int getOneOrderNoByUserId(String userId) {
		return orderDao.selectOneByUserId(userId);
	}
	
	@Transactional
	@Override
	public List<OrderInfo> getOrderList(String userId) throws ParseException{
		List<OrderInfo> orderInfoList = new ArrayList<>();
		//유저아이디로 order 찾아오기
		List<Integer> orderNumList = orderDao.selectByUserId(userId);
		//order 안에 있는 orderproductno로 productoptionno 찾기
		for(Integer i : orderNumList) {
			Porder order = orderDao.selectByOrderNo(i);
			List<OrderProduct> opNumList = orderProductDao.selectByOrderNo(i);
			for(OrderProduct j : opNumList) {
				//productoption_no로 product 찾기
				int productOptionNo = orderProductDao.selectOptionNo(j.getOrderProduct_no());
				int productNo = productOptionDao.selectProductNo(productOptionNo);
				Product product = productDao.selectByPno(productNo);
				//product에서 정보빼기
				OrderInfo orderInfo = new OrderInfo();
				String date = order.getOrder_createdDate().substring(0,  10);
				try {
					orderInfo.setOrderDate(date);
					Date arrivalDate = convertArrival(date);
					orderInfo.setArrivalDate(reverse(arrivalDate));
					
					Date today = new Date();
					if(arrivalDate.before(today)) {
						orderInfo.setDeliveryStatus("배송 완료");
					}else {
						orderInfo.setDeliveryStatus("배송 중");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				int addressNo = order.getAddress_no();
				
				Address address = addressDao.selectByAno(addressNo);
				String address1 = address.getAddress_roadAddress();
				String address2 = address.getAddress_extraAddress();
				String address3 = address.getAddress_detail();
				String addressInfo = address1 + address2 + address3;
				int couponNo = order.getCoupon_coupon_no();
				
				Coupon orderCoupon = couponDao.selectByCouponNo(couponNo);
				String coupontype = String.valueOf(orderCoupon.getCoupon_type());
				int couponValue = orderCoupon.getCoupon_value();
				String couponContent = coupontype + couponValue;
				
				orderInfo.setAddress(addressInfo);
				orderInfo.setOrderNo(order.getOrder_no());
				orderInfo.setTotalPrice(order.getOrder_total_price());
				orderInfo.setUsedPoint(order.getUsers_users_opoint());
				orderInfo.setAddressRequest(order.getAddress_request());
				orderInfo.setCouponContent(couponContent);
				
				orderInfo.setProductNo(productNo);
				orderInfo.setTitle(product.getProduct_name());
				orderInfo.setPrice(product.getProduct_price());
				orderInfo.setQuantity(j.getOrderProduct_qty());
				orderInfo.setImage(product.getProduct_imgFile());
				orderInfoList.add(orderInfo);
			}
			
		}
		
		return orderInfoList;
	}
	
	//날짜 변환
	public Date convertOrder(String date) throws ParseException{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date convertedDate = dateFormat.parse(date);
		
		return convertedDate;
	}
	
	//3일 뒤 날짜 변환
	public Date convertArrival(String date) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date convertedDate = dateFormat.parse(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(convertedDate);
		calendar.add(Calendar.DAY_OF_MONTH, 3);
		
		Date arrivalDate = calendar.getTime();
		
		return arrivalDate;
	}
	
	//날짜를 yyyy.MM.dd로 변환
	public String reverse(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		return sdf.format(date);
	}

	@Override
	@Transactional
	public List<OrderHistory> getOrderHistory(String userId) throws ParseException {
		List<OrderHistory> orderHistories = new ArrayList<>();
		List<Integer> orderNumList = orderDao.selectByUserId(userId);
		
		for(Integer i : orderNumList) {
			Porder order = orderDao.selectByOrderNo(i);
			List<OrderProduct> opNumList = orderProductDao.selectByOrderNo(i);
			for(OrderProduct j : opNumList) {
				//productoption_no로 product 찾기
				int productOptionNo = orderProductDao.selectOptionNo(j.getOrderProduct_no());
				int productNo = productOptionDao.selectProductNo(productOptionNo);
				Product product = productDao.selectByPno(productNo);
				//product에서 정보빼기
				OrderHistory orderHistory = new OrderHistory();
				String date = order.getOrder_createdDate().substring(0,  10);
				try {
					Date arrivalDate = convertArrival(date);
					orderHistory.setArrival(reverse(arrivalDate));
					
					Date today = new Date();
					if(arrivalDate.before(today)) {
						orderHistory.setDeliveryStatus("배송 완료");
					}else {
						orderHistory.setDeliveryStatus("배송 중");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				orderHistory.setProductNo(productNo);
				orderHistory.setProductName(product.getProduct_name());
				orderHistory.setPrice(product.getProduct_price());
				orderHistory.setQuantity(j.getOrderProduct_qty());
				orderHistory.setOrderDate(order.getOrder_createdDate().substring(0, 10));
				
				orderHistories.add(orderHistory);
			}
		}
		
			
		return orderHistories;
	}
	
	@Override
	public List<String> getDates(String userId) throws ParseException {
		List<OrderHistory> histories = getOrderHistory(userId);
		Set<String> set = new HashSet<>();
		
		for(OrderHistory oh : histories) {
			set.add(oh.getOrderDate());
		}
		
		List<String> list = new ArrayList<>();
		for(String s : set) {
			list.add(s);
		}
		
		Collections.sort(list, Collections.reverseOrder());
		
		return list;
	}

	@Override
	public List<MobileOrder> getOrderInfo(int cart_no) {
		
		List<MobileOrder> orderInfos = new ArrayList<>();
		
		Cart c = cartDao.selectCartByCartNo(cart_no); //cart 번호로 불러온 상품의 정보들
		
		log.info("카트 인포" + c);
		
		
			log.info("for문 실행");
			int cartNo = c.getCart_no();
			log.info("카트 번호" + cartNo);
			String usersId = c.getUsers_users_id(); //cart에서 userId를 가져온다
			log.info("유저 아이디" + usersId);
			int productNo = c.getProduct_product_no();
			log.info("상품 번호" + productNo);
			JoinDto userInfo = userDao.selectByusersId(usersId); //가져온 userID로 user의 name, phone, email를 가져온다.
			String userName = userInfo.getUsers_name(); //유저의 이름
			String userPhone = userInfo.getUsers_phone();//유저의 아이디
			String userEmail = userInfo.getUsers_email();// 유저의 이메일
			
			Product productInfo = productDao.selectByPno(productNo);
			String productName = productInfo.getProduct_name();
			int productPrice = productInfo.getProduct_price();
			int productOption = c.getProductOption_productOption_no();
			String productOption_type = productOptionDao.selectOptionNameByOptionNo(productOption);
			int qty = c.getCart_qty();
			int userPoint = userDao.selectOpointByUserId(usersId); // 유저의 적립금
			
			MobileOrder oneOrderInfo = new MobileOrder();
			
			oneOrderInfo.setCart_no(cart_no);
			oneOrderInfo.setCart_qty(qty);
			oneOrderInfo.setProduct_no(productNo);
			oneOrderInfo.setProduct_name(productName);
			oneOrderInfo.setProduct_price(productPrice);
			oneOrderInfo.setProductOption_type(productOption_type);
			oneOrderInfo.setUser_id(usersId);
			oneOrderInfo.setPoint(userPoint);
			oneOrderInfo.setUsers_email(userEmail);
			oneOrderInfo.setUsers_name(userName);
			oneOrderInfo.setUsers_phone(userPhone);
			
			orderInfos.add(oneOrderInfo);
		
		log.info("선택한 상품의 정보들" + orderInfos);
		return orderInfos;
	}

	public List<MobileOrder> getOrderInfos(List<Integer> cart_nos) {
		
		List<MobileOrder> orderInfos = new ArrayList<>();
		
		
		
		log.info("cart_nos: " + cart_nos);
		for(int i : cart_nos) {
			Cart c = cartDao.selectCartByCartNo(i); //cart 번호로 불러온 상품의 정보들
			log.info("for문 실행");
			log.info("c: " + c.toString());
			int cartNo = c.getCart_no();
			log.info("카트 번호" + cartNo);
			String usersId = c.getUsers_users_id(); //cart에서 userId를 가져온다
			log.info("유저 아이디" + usersId);
			int productNo = c.getProduct_product_no();
			log.info("상품 번호" + productNo);
			JoinDto userInfo = userDao.selectByusersId(usersId); //가져온 userID로 user의 name, phone, email를 가져온다.
			String userName = userInfo.getUsers_name(); //유저의 이름
			String userPhone = userInfo.getUsers_phone();//유저의 아이디
			String userEmail = userInfo.getUsers_email();// 유저의 이메일
			
			Product productInfo = productDao.selectByPno(productNo);
			String productName = productInfo.getProduct_name();
			int productPrice = productInfo.getProduct_price();
			int productOption = c.getProductOption_productOption_no();
			String productOption_type = productOptionDao.selectOptionNameByOptionNo(productOption);
			int qty = c.getCart_qty();
			int userPoint = userDao.selectOpointByUserId(usersId); // 유저의 적립금
			
			MobileOrder oneOrderInfo = new MobileOrder();
			
			oneOrderInfo.setCart_no(i);
			oneOrderInfo.setCart_qty(qty);
			oneOrderInfo.setPoint(userPoint);
			oneOrderInfo.setProduct_name(userName);
			oneOrderInfo.setProduct_no(productNo);
			oneOrderInfo.setProduct_price(productPrice);
			oneOrderInfo.setProductOption_type(productOption_type);
			oneOrderInfo.setUser_id(usersId);
			oneOrderInfo.setUsers_email(userEmail);
			oneOrderInfo.setUsers_name(userName);
			oneOrderInfo.setUsers_phone(userPhone);
			oneOrderInfo.setProduct_name(productName);
			
			orderInfos.add(oneOrderInfo);
		}
		log.info("선택한 상품의 정보들" + orderInfos);
		return orderInfos;
	}
	
	//상품 상세보기 -> 구매하기(모바일)
	@Override
	public List<MobileOrder> getOrderInfoDetail(String userId,int product_no){
		
		List<MobileOrder> orderInfos = new ArrayList<>();
		ProductDetail pdt = productDao.productDetail(product_no);
		List<String> optionType = productDao.getProductOptionMobile(product_no);
		
		
		return orderInfos;
	}
	
	@Override
	public MobileOrderUser getOrderItems(int cart_no) {
		
		MobileOrder mobileOrder = getOrderInfo(cart_no).get(0);
		
		MobileOrderUser orderUser = new MobileOrderUser();
		orderUser.setPoint(mobileOrder.getPoint());
		orderUser.setUser_id(mobileOrder.getUser_id());
		orderUser.setUsers_name(mobileOrder.getUsers_name());
		orderUser.setUsers_email(mobileOrder.getUsers_email());
		orderUser.setUsers_phone(mobileOrder.getUsers_phone());
		
		return orderUser;
	}
}

