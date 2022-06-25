package com.example.Shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Shop.entities.ProductsImagesEntity;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductsImagesEntity, Integer> {
	
}
