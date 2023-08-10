/*package com.webteam1.oti.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.webteam1.oti.dto.Pager;
import com.webteam1.oti.dto.Review;
import com.webteam1.oti.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	//리뷰 가져오기 (진행중)
	@GetMapping("/review")
	public String review(String pageNo2, Model model, HttpSession session) {
		log.info(pageNo2);
		if(pageNo2 == null) {
		   //세션에 저장되어 있는지 확인
		   pageNo2 = (String) session.getAttribute("pageNo2");
		   //저장되어있지 않다면 "1"로 초기화
		   if(pageNo2 == null) {
			   pageNo2 = "1";
		   }
		}
		log.info(pageNo2);
		int productNo = (int)session.getAttribute("productNum");
		log.info(productNo + "");
		//문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo2);
		//세션에 pageNo를 저장
		session.setAttribute("pageNo2", String.valueOf(pageNo2));
		int totalRows = reviewService.countByProductNo(productNo);
		Pager pager = new Pager(5, 5, totalRows, intPageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		map.put("productNo", productNo);
		
		List<Review> list = reviewService.getReviewListByPno(map);
		
		model.addAttribute("pager", pager);
		model.addAttribute("reviews", list);

		return "mypage/review/review";
	}
}
*/