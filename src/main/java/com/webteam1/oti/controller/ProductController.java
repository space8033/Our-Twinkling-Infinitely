package com.webteam1.oti.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.Base64;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class ProductController {
	@Resource
	private ProductService productService;
	@GetMapping("/writeProductFile")
	@PostMapping("/writeProductFile")
	public String writeProductFile(Product product) throws Exception{

	   Image image = new Image();
	   File file = new File("C:/Users/KOSA/git/Our-Twinkling-Infinitely/src/main/webapp/resources/yuimg/메인상품리스트1.jpg");
	   byte[] byteFile = null;
	   byteFile = Files.readAllBytes(file.toPath());
	   image.setImage_file(byteFile);
	   log.info("파일 업로드 실행");

	   /*if(!mf.isEmpty()) {
		  //브라우저에서 선택한 파일 이름 작성
		 p.setBattachoname(mf.getOriginalFilename());
		 //파일의 형식(MIME 타입)을 설정(image.jpeg, image/png, ...)
		 board.setBattachtype(mf.getContentType());
		 
		 //방법2(첨부파일을 DB에 직접 저장)
		 board.setBattachdata(mf.getBytes());
	
	   }
	  
	   boardService.write(board);
	   //실제로 저장된 bno
	   log.info("저장된bno: " + board.getBno());*/
	
	   return "redirect:/home";
   }
	
	@GetMapping("/plz")
	public String plz(Model model) {
		
		
		return "";
	}
	
}
