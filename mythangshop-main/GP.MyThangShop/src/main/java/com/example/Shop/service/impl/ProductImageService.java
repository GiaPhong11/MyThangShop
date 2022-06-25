package com.example.Shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Shop.entities.ProductsImagesEntity;
import com.example.Shop.repository.ProductImageRepository;
import com.example.Shop.service.IProductImageService;

@Service
public class ProductImageService implements IProductImageService {
	
	@Autowired
	private ProductImageRepository proImgRepo;

	@Override
	public List<ProductsImagesEntity> findAll() {
		return proImgRepo.findAll();
	}
	
	
	
}
