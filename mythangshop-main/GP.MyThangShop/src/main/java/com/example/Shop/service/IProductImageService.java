package com.example.Shop.service;

import java.util.List;

import com.example.Shop.entities.ProductsImagesEntity;

public interface IProductImageService {

	List<ProductsImagesEntity> findAll();
	
}
