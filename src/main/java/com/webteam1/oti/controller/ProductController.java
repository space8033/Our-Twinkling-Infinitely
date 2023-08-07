package com.webteam1.oti.controller;

import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webteam1.oti.dto.Image;
import com.webteam1.oti.dto.Product;
import com.webteam1.oti.service.ImageService;
import com.webteam1.oti.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class ProductController {
	@Resource
	private ProductService productService;
	@Resource
	private ImageService imageService;

<<<<<<< HEAD
	@GetMapping("/detailProduct")
	public String detailView(String product_no, Model model, HttpSession session) {
		   int productNum = Integer.parseInt(product_no);
		   Product product = productService.getProduct(productNum);
		   if(product.getProduct_imgFile() != null) {
			   String base64Img = Base64.getEncoder().encodeToString(product.getProduct_imgFile());
			   product.setProduct_img(base64Img);
		   }
		   model.addAttribute("product", product);
		   
		   //상품 상세페이지에 있을 이미지 배열 가져오기
		   List<Image> imageList = imageService.getImage(productNum); 
		   for(Image image: imageList) {			   
			   if(image.getImage_file() != null) {
				  String base64Img = Base64.getEncoder().encodeToString(image.getImage_file());
				  image.setImage_fileName(base64Img);
			   }else {
				   return "redirect:/detail/detailView";
			   }
		   }
		   model.addAttribute("images",  imageList);
		   return "detail/detailView";
=======
	   Image image = new Image();
	   File file = new File("C:/Users/KOSA/git/Our-Twinkling-Infinitely/src/main/webapp/resources/yuimg/메인상품리스트1.jpg");
	   byte[] byteFile = null;
	   byteFile = Files.readAllBytes(file.toPath());
	   image.setImage_file(byteFile);

	   /*if(!mf.isEmpty()) {
		  //브라우저에서 선택한 파일 이름 작성
		 p.setBattachoname(mf.getOriginalFilename());
		 //파일의 형식(MIME 타입)을 설정(image.jpeg, image/png, ...)
		 board.setBattachtype(mf.getContentType());
>>>>>>> branch 'master' of https://github.com/space8033/Our-Twinkling-Infinitely.git
		 
	}
}
