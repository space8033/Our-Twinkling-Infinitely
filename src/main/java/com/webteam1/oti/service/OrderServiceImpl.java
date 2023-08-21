package com.webteam1.oti.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webteam1.oti.dao.CouponDao;
import com.webteam1.oti.dao.OrderDao;
import com.webteam1.oti.dao.OrderProductDao;
import com.webteam1.oti.dao.ProductDao;
import com.webteam1.oti.dao.ProductOptionDao;
import com.webteam1.oti.dao.UserDao;
import com.webteam1.oti.dto.OrderProduct;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.dto.order.OrderInfo;
import com.webteam1.oti.dto.order.Porder;
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

	
	@Override
	@Transactional
	public void addOrder(Porder order) {
		orderDao.insertOrder(order);
		//db에 저장할 orderNo
		int orderNo = getOneOrderNoByUserId(order.getUsers_users_id());
		//현재 주문할 상품 목록
		List<OrderProduct> list = orderProductDao.getOrderProductByUsersId(order.getUsers_users_id());
		for(OrderProduct op : list) {
			log.info(op.toString());
			//주문할 각 상품에 대해 orderNo 업데이트 및 주문완료된 상품으로 표시
			Map<String, Object> map = new HashMap<>();
			map.put("orderNo", orderNo);
			map.put("orderproductNo", op.getOrderProduct_no());
			log.info("주문번호: " + orderNo);
			log.info("상품번호: " + op.getOrderProduct_no());
			orderProductDao.addOrderNumber(map);
		}
		couponDao.updateUsedCoupon(order.getCoupon_coupon_no());
		
		//주문시 적립금 사용/적립 기능
		LoginDto user = userDao.selectByUsersId(order.getUsers_users_id());
		int beforePoint = user.getUsers_opoint();
		log.info(beforePoint+"이전포인트");
		int usedPoint = order.getUsers_users_opoint();
		log.info(usedPoint+"사용포인트");
		int totalPrice = order.getOrder_total_price();
		int savePoint = (int) (totalPrice * 0.005);
		int afterPoint = beforePoint - usedPoint + savePoint; 
		log.info(afterPoint+"계산후포인트");
		
		user.setUsers_opoint(afterPoint);
		log.info(user.toString()+"나 바뀐 유저임 ㅋㅋ");
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
}
