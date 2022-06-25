package com.example.Shop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.Shop.entities.SaleOrderEntity;
import com.example.Shop.entities.SaleOrderProductsEntity;


public interface ISaleOderService {

	public SaleOrderEntity saveSaleOder(SaleOrderEntity saleorder);


	SaleOrderEntity getById(Integer id);

	void deleteAll();

	void delete(SaleOrderEntity entity);

	long count();

	<S extends SaleOrderEntity> List<S> saveAll(Iterable<S> entities);


	Page<SaleOrderEntity> findByKeywork(String keywork, Pageable pageable);


	Page<SaleOrderEntity> findAll(Pageable pageable);


	List<SaleOrderEntity> findById2(Integer id);






}
