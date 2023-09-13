package com.webteam1.oti.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam1.oti.dao.ImageDao;
import com.webteam1.oti.dto.Image;

@Service
public class ImageServiceImpl implements ImageService{
	@Resource
	private ImageDao imageDao;
	
	@Override
	public List<Image> getImage(int product_no) {
		List<Image> imageList = imageDao.selectByPno(product_no);
		return imageList;
	}

	@Override
	public Image getDetailImg(int product_no) {
		Image image = imageDao.getDetail(product_no);
		return image;
	}

	@Override
	public void registerImg(Image image) {
		imageDao.insertReviewImage(image);
	}

	@Override
	public List<Image> getReviewImages(int review_no) {
		List<Image> list = imageDao.selectByRno(review_no);
		return list;
	}

	@Override
	public void deleteImages(int review_no) {
		imageDao.deleteByRno(review_no);
	}

	@Override
	public List<Integer> getReviewImagesNo(int review_no) {
		List<Integer> list = imageDao.selectImageNoByReviewNo(review_no);
		
		return list;
	}

	@Override
	public Image getImageByImageNo(int image_no) {
		
		return imageDao.selectImageByImageNo(image_no);
	}

}
