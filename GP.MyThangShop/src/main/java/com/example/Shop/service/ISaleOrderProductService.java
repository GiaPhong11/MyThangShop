package com.example.Shop.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.example.Shop.entities.SaleOrderEntity;
import com.example.Shop.entities.SaleOrderProductsEntity;

public interface ISaleOrderProductService {

	SaleOrderProductsEntity getById(Integer id);

	void deleteAll();

	long count();

	Optional<SaleOrderProductsEntity> findById(Integer id);

	List<SaleOrderProductsEntity> findAll();

	<S extends SaleOrderProductsEntity> S save(S entity);

	List<SaleOrderProductsEntity> findById2(int saleOrderId);
	
	List<SaleOrderProductsEntity> findByTime(Date date1, Date date2);

}
