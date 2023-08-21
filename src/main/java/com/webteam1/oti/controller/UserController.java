package com.webteam1.oti.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

//github.com/space8033/Our-Twinkling-Infinitely.git

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.webteam1.oti.dto.Coupon;
import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Pinquiry;
import com.webteam1.oti.dto.cart.Cart;
import com.webteam1.oti.dto.point.Point;
import com.webteam1.oti.dto.user.Agreement;
import com.webteam1.oti.dto.user.JoinDto;
import com.webteam1.oti.dto.user.LoginDto;
import com.webteam1.oti.dto.user.ModifyDto;
import com.webteam1.oti.interceptor.Login;
import com.webteam1.oti.service.AgreementService;
import com.webteam1.oti.service.CartService;
import com.webteam1.oti.service.CouponService;
import com.webteam1.oti.service.PointService;
import com.webteam1.oti.service.ReviewService;
import com.webteam1.oti.service.UserService;
import com.webteam1.oti.service.UserService.JoinResult;
import com.webteam1.oti.service.UserService.LoginResult;

import lombok.extern.slf4j.Slf4j;


//UserController 전체 작성자 : 김시온
@Controller
@RequestMapping("/")
@Slf4j
public class UserController {
	@Resource
	private UserService userService;
	@Resource
	private CartService cartService;
	@Resource
	private ReviewService reviewService;
	@Resource
	private AgreementService agreementService;
	@Resource
	private CouponService couponService;
	@Resource
	private PointService pointService;
	
	//회원가입 폼 불러오기
	@GetMapping("/joinForm")
	public String joinForm() {
		
		return "join/joinForm";
	}
	
	//회원가입 신청
	@PostMapping("/joinForm")
	public String join(JoinDto users, Agreement agreement, Model model) {
		JoinResult result = userService.join(users);
		if(result == JoinResult.FAIL_DUPLICATED_UID) {
			String error1 = "이미 가입된 아이디입니다.";
			model.addAttribute("error1", error1);
			return "join/joinForm";
		} else if(result == JoinResult.FAIL_DUPLICATED_EMAIL){
			String userId = userService.getUsersByUserEmail(users.getUsers_email()).getUsers_id();
			String error2 = userId + "로 이미 가입된 이메일입니다.";
			model.addAttribute("error2", error2);
			return "join/joinForm";
		} else if(result == JoinResult.FAIL_DUPLICATED_TEL) {
			String userId = userService.getUsersByUserPhone(users.getUsers_phone()).getUsers_id();
			String error3 = userId + "로 이미 가입된 전화번호입니다.";
			model.addAttribute("error3", error3);
			return "join/joinForm";
		} else {
			log.info(agreement.isAgreement_info()+"동의 인포");
			log.info(agreement.isAgreement_required()+"동의 이용약관");
			log.info(agreement.isAgreement_sns()+"동의sns");
			agreementService.insertAgreement(users, agreement);
			couponService.generateWelcomeCoupon(users.getUsers_id());
			
			return "redirect:/loginForm";
		}
	}
	
	//로그인 폼 불러오기
	@GetMapping("/loginForm")
	public String loginForm(String msg, Model model) {
		model.addAttribute("msg", msg);
		return "login/loginForm";
	}
	
	//로그인 요청
	@PostMapping("/loginForm")
	public String login(LoginDto users, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String redirectUrl = (String) session.getAttribute("redirectUrl");
		LoginResult result = userService.login(users);
		log.info(result+"로그인 상태");
		if(result == LoginResult.FAIL_UID) {
			String error1 = "가입된 ID가 없습니다.";
			model.addAttribute("error1", error1);
		} else if(result == LoginResult.FAIL_ENABLED) {
			String error2 = "ID가 비활성화 되어 있습니다";
			model.addAttribute("error2", error2);
		} else if(result == LoginResult.FAIL_PASSWORD) {
			String error3 = "비밀번호가 틀립니다";
			model.addAttribute("error3", error3);
		} else {
			log.info("로그인에 성공하였습니다");
			LoginDto dbUser = userService.getUser(users.getUsers_id());
			session.setAttribute("loginIng", dbUser);
			
			LoginDto loginDto = (LoginDto) session.getAttribute("loginIng");
			model.addAttribute("loginIng", loginDto);
			
			//비회원 장바구니 회원장바구니로 이동
			Cookie cookie = WebUtils.getCookie(request, "cartCookie");

			if (cookie != null) {
				String ckValue = cookie.getValue();
				
				log.info("비회원장바구니 삭제");
				
				//쿠키가 있는 카트 중 해당 회원ID 입력
				List<Cart> list = cartService.getCartByCkId(ckValue);
				for(Cart cart: list) {
					cart.setUsers_users_id(loginDto.getUsers_id());
					cartService.cartUpdate(cart);
				}
				//쿠키 삭제
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			if(session.getAttribute("redirectUrl") == null) {
				session.removeAttribute("redirectUrl");
				return "redirect:/";
			}else {
				if(redirectUrl.contains("addOrderProduct")) {
					redirectUrl = "/orderPay";
				}
				session.removeAttribute("redirectUrl");
				return "redirect:" + redirectUrl;				
			}
		}
		return "login/loginForm";
	}
	
	//로그아웃 요청
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
	    return "redirect:/";
	}
	
	//개인정보 수정 불러오기
	@Login
	@GetMapping("/modify")
	public String modify(Model model, HttpSession session) {
		LoginDto loginUser = (LoginDto) session.getAttribute("loginIng");
		ModifyDto loginUserData = userService.getModifyByUsersId(loginUser.getUsers_id());
		model.addAttribute("userInfo", loginUserData);
		Agreement userAgreement = agreementService.getByUsersId(loginUser.getUsers_id());
		log.info(userAgreement+"userAgreement");
		model.addAttribute("agreement", userAgreement);
		log.info(loginUserData.getUsers_bdate()+"=내생일은?");
		return "modify/modify";
	}
	
	//개인정보 수정 요청
	@Login
	@PostMapping("/modify")
	public String modify(ModifyDto user, Agreement agreement, Model model, HttpSession session) {
		//로그인한 유저의 정보를 불러오기
		LoginDto loginUser = (LoginDto) session.getAttribute("loginIng");
		JoinDto dbUserE = (JoinDto) userService.getUsersByUserEmail(user.getUsers_email());
		String dbUserEmail;
		if(dbUserE != null) {
			dbUserEmail = dbUserE.getUsers_email();
		} else {
			dbUserEmail = "없음";
		}
		
		//입력한 정보와 db에 있는 유저 정보간의 중복체크
		JoinDto dbUserP = (JoinDto) userService.getUsersByUserPhone(user.getUsers_phone());
		String dbUserPhone;
		if(dbUserP != null) {
			dbUserPhone = dbUserP.getUsers_phone();
		} else {
			dbUserPhone = "없음";
		}
		ModifyDto loginUserData = userService.getModifyByUsersId(loginUser.getUsers_id());
		boolean emailModifyResult = user.getUsers_email().equals(loginUserData.getUsers_email());
		boolean phoneModifyResult = user.getUsers_phone().equals(loginUserData.getUsers_phone());
			
		if(!emailModifyResult) {
			//입력한 이메일과 로그인 이메일이 다른 경우 : 입력한 이메일이 db에서 null이거나 로그인 이메일이 db에서 null
			if(dbUserEmail.equals("없음")) {
				//입력한 이메일이 로그인 이메일과 다른데, null일 경우 -> 디비 저장 가능
				    if(!phoneModifyResult) { 
					//이메일 비어있고 폰의 입력 결과가 다른 경우
				    	if(dbUserPhone.equals("없음")) {
				    		//이메일 비어있고 폰도 비어있는 경우
				    		userService.modify(user);
				    		log.info(agreement.isAgreement_info()+"동의 인포");
							log.info(agreement.isAgreement_sns()+"동의sns");
				    		agreementService.updateAgreement(user, agreement);
							log.info("이메일 비어있고 폰도 비어있는 경우: 회원 정보 수정 성공");
				    		model.addAttribute("msg", "회원 정보가 수정되었습니다.");
				    		session.removeAttribute("loginIng");
				    		return "redirect:/loginForm";
				    	} else {
				    		//이메일은 비어 있는데 폰번호가 중복인 경우
				    		String error2 = "이미 사용중인 번호입니다.";
				    		model.addAttribute("error2", error2);
				    		log.info("이메일은 비어있는데 전화번호가 중복인 경우: 회원 정보 수정 실패");
				    		model.addAttribute("msg", "회원 정보 수정에 실패하였습니다 : 전화번호 중복");
				    	}
				   } else {
					   //이메일 비어있고 폰의 입력 결과가 같은 경우 -> 성공
					    userService.modify(user);
					    log.info(agreement.isAgreement_info()+"동의 인포");
						log.info(agreement.isAgreement_sns()+"동의sns");
			    		agreementService.updateAgreement(user, agreement);
						log.info("이메일은 비어있는데 핸드폰 번호가 기존과 동일 : 회원 정보 수정 성공");
						model.addAttribute("msg", "회원 정보가 수정되었습니다.");
			    		session.removeAttribute("loginIng");
			    		return "redirect:/loginForm";
			    		
				   }
			} else {
			//입력한 이메일이 로그인 이메일과 다른데, 디비에 이메일이  존재하는 경우(not null) -> 디비 저장 불가능
				String error1 = "이미 사용중인 이메일입니다.";
				model.addAttribute("error1", error1);
				log.info("입력한 이메일이 db에 이미 존재 : 회원 정보 수정 실패");
				model.addAttribute("msg", "회원 정보 수정에 실패하였습니다 : 이메일 중복");
				
			}	    
		} else {
			//입력한 이메일과 로그인 이메일이 같은 경우 : 입력한 폰번호가 db에서에서 null이거나 로그인 폰번호가 db에서 null
			if(!phoneModifyResult) { 
				//폰의 입력 결과가 다른 경우
			    	if(dbUserPhone.equals("없음")) {
			    		//폰번호가 비어있는 경우
			    		userService.modify(user);
			    		log.info(agreement.isAgreement_info()+"동의 인포");
						log.info(agreement.isAgreement_sns()+"동의sns");
			    		agreementService.updateAgreement(user, agreement);
						log.info("이메일은 기존과 같고 입력한 휴대폰 번호가 db에 없는 경우: 회원 정보 수정 성공");
						model.addAttribute("msg", "회원 정보가 수정되었습니다.");
			    		session.removeAttribute("loginIng");
			    		return "redirect:/loginForm";
			    	} else {
			    		//폰번호가 중복인 경우
			    		String error2 = "이미 사용중인 번호입니다. 이메일은 기존과 같습니다.";
			    		model.addAttribute("error2", error2);
			    		log.info("이메일은 기존과 같으나 전화번호가 다른 회원과 중복인 경우 : 회원 정보 수정 실패");
			    		model.addAttribute("msg", "회원 정보 수정에 실패하였습니다 : 전화번호 중복");
			    	}
			} else {
				//폰의 입력 결과가 같은 경우
				userService.modify(user);
				log.info(agreement.isAgreement_info()+"동의 인포");
				log.info(agreement.isAgreement_sns()+"동의sns");
	    		agreementService.updateAgreement(user, agreement);
				log.info("이메일이 같고 폰 번호도 기존과 같은 경우: 회원 정보 수정 성공");
				model.addAttribute("msg", "회원 정보가 수정되었습니다.");
	    		session.removeAttribute("loginIng");
	    		return "redirect:/loginForm";
			}
	   }
	   model.addAttribute("userInfo", loginUserData);	
	   return "modify/modify";
	}
	
	//회원탈퇴 불러오기
	@Login
	@GetMapping("/unjoin")
	public String unjoin(HttpSession session) {
		LoginDto loginUser = (LoginDto) session.getAttribute("loginIng");
		String userId = loginUser.getUsers_id();
		userService.unjoin(userId);
		session.invalidate();
		return "home";
	}
	
	//작성자: 성유진
	//마이페이지
	@Login
	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) {
		LoginDto user = (LoginDto)session.getAttribute("loginIng");
		
		//리뷰 수
		int totalReviews = reviewService.countByUserId(user.getUsers_id());
		model.addAttribute("totalReviews", totalReviews);
		
		//쿠폰 수
		int totalCoupons = couponService.numberOfCoupon(user.getUsers_id());
		model.addAttribute("totalCoupons", totalCoupons);
		
		//가용 적립금
		LoginDto loginUser = userService.getUser(user.getUsers_id());
		int totalPoints = loginUser.getUsers_opoint();
		model.addAttribute("totalPoints", totalPoints);
		
		
		//쿠폰리스트
		List<Coupon> list = couponService.getCouponByUsersId(user.getUsers_id());
		model.addAttribute("coupons", list);
		
		//상품문의 수
		int pinquirys = userService.getMyInquiry(user.getUsers_id());
		model.addAttribute("pinquirys", pinquirys);
		//상품문의 리스트
		List<Pinquiry> pinquiryList = userService.getMyInquiryList(user.getUsers_id());
		log.info("리스틀얍 : " + pinquiryList.toString());
		model.addAttribute("myinquiryList", pinquiryList);
		
		//마이페이지에 보일 가입일
		String join = user.getUsers_createdDate();
	    String joinDay = join.substring(0, 10);
	
	    model.addAttribute("joinDay", joinDay);
		
	    return "mypage/orderlist/myOti";
	}
	
	@Login
	@GetMapping("/getHistory")
	public String pointHistory(@RequestParam(name = "pageNo7", required = false) String pageNo7, HttpSession session, Model model) {
		
		LoginDto loginUser = (LoginDto)session.getAttribute("loginIng");
		//작성자: 김시온
		//적립금리스트
		if(pageNo7 == null) {
		    //세션에 저장되어 있는지 확인
		    pageNo7 = (String) session.getAttribute("pageNo7");
		    //저장되어있지 않다면 "1"로 초기화
		    if(pageNo7 == null) {
		        pageNo7 = "1";
		    }
		}

		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo7);
		List<Point> usedPointList = pointService.usedPointList(loginUser.getUsers_id());
		List<Point> savedPointList = pointService.savedPointList(loginUser.getUsers_id());
		// 날짜를 내림차순으로 정렬하는 Comparator
		// 날짜를 내림차순으로 정렬하는 Comparator
		Comparator<Point> dateComparator = Comparator.comparing(Point::getDate, Comparator.reverseOrder());

		// 사용된 포인트 리스트를 날짜 내림차순으로 정렬
		usedPointList.sort(dateComparator);

		// 적립된 포인트 리스트를 날짜 내림차순으로 정렬
		savedPointList.sort(dateComparator);

		// 두 리스트를 합친 후 날짜순으로 정렬
		List<Point> combinedPointList = new ArrayList<>();
		combinedPointList.addAll(usedPointList);
		combinedPointList.addAll(savedPointList);
		combinedPointList.sort(dateComparator);

		// 합친 리스트의 크기를 구하고 페이징 처리
		int combinedListSize = combinedPointList.size();
		log.info(combinedListSize+"몇갠데 그래서");
		int itemsPerPage = 10;
		int totalRows = combinedListSize;
		Pager pager = new Pager(itemsPerPage, 5, totalRows, intPageNo);

		// 페이징 처리된 범위에 맞게 합친 리스트를 추출
		int startRow = (pager.getPageNo() - 1) * itemsPerPage;
		int endRow = Math.min(startRow + itemsPerPage, combinedListSize);
		List<Point> pagedPointList = combinedPointList.subList(startRow, endRow);
		
		log.info(pagedPointList+"이게뭐야 페이지드 리스트?");
		// 세션에 pageNo를 저장
		session.setAttribute("pageNo7", String.valueOf(pageNo7));

		model.addAttribute("pager", pager);
		log.info(pageNo7 + "나페이지넘버세븐");
		model.asMap().remove("pointList");
		model.addAttribute("pointList", pagedPointList); // 합친 리스트 대신 페이징 처리된 리스트를 전달
		
		return "mypage/point/myPoint";
	}
	
	
	//마이페이지 기본 이미지로 변경(기존에 이미지 파일이 있다면 null로 업데이트)
	@Login
	@GetMapping("/basic")
	public String basicImg(HttpSession session) {
		LoginDto user = (LoginDto)session.getAttribute("loginIng");
		//기존에 있던 이미지 삭제
		userService.changeBasic(user.getUsers_id());
		user.setUsers_imgFile(null);
		user.setUsers_img(null);

		return "redirect:/mypage";
	}
	
	//마이페이지 이미지 추가
	@Login
	@PostMapping("/mypage")
	public String addMyImg(MultipartFile users_mattach, HttpSession session, Model model) throws Exception{
		LoginDto loginDto = (LoginDto)session.getAttribute("loginIng");
		loginDto.setUsers_mattach(users_mattach);
		
		//MultipartFile타입의 파일을 바이트 타입으로 변경
		if(users_mattach != null) {			
			loginDto.setUsers_imgFile(users_mattach.getBytes());
		}
		//변경된 이미지 파일을 업데이트 
		userService.addMyImg(loginDto);
		
		//마이페이지에 등록한 이미지가 있다면 base64로 인코딩
		if(loginDto.getUsers_imgFile() != null) {
			String base64Img = Base64.getEncoder().encodeToString(loginDto.getUsers_imgFile());
			loginDto.setUsers_img(base64Img);
		}
		return "redirect:/mypage";
	}
	

}
