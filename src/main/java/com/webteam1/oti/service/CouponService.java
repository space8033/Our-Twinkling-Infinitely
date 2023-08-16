package com.webteam1.oti.service;



public interface CouponService {
	public int generateWelcomeCoupon(String users_id);
	public int generateBirthdayCoupon();
	public int generateComeBackCoupon();
	
/*	public void updateAddress(Address address);
	public List<Address> getList(Map<String, Object> map);
	public int countByUserId(String userId);
	public Address getByAddressNo(int address_no);
	public Address getDefault(String user_id);*/
}
