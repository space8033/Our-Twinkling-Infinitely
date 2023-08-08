package com.webteam1.oti.service;


import java.util.List;

import com.webteam1.oti.dto.Image;

public interface ImageService {
	public List<Image> getImage(int product_no);
	public Image getDetailImg(int product_no);
}
