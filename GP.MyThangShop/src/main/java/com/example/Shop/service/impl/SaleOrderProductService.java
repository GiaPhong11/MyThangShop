package com.example.Shop.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Shop.entities.SaleOrderProductsEntity;
import com.example.Shop.repository.SaleOrderProductReponsitory;
import com.example.Shop.service.ISaleOrderProductService;

@Service
public class SaleOrderProductService implements ISaleOrderProductService {

	@Autowired
	private SaleOrderProductReponsitory saleorprorepo;

	@Override
	public <S extends SaleOrderProductsEntity> S save(S entity) {
		return saleorprorepo.save(entity);
	}

	@Override
	public List<SaleOrderProductsEntity> findAll() {
		return saleorprorepo.findAll();
	}

	public List<SaleOrderProductsEntity> findById2(Integer id) {
		return saleorprorepo.findById2(id);
	}

	@Override
	public Optional<SaleOrderProductsEntity> findById(Integer id) {
		return saleorprorepo.findById(id);
	}

	@Override
	public long count() {
		return saleorprorepo.count();
	}

	@Override
	public void deleteAll() {
		saleorprorepo.deleteAll();
	}

	@Override
	public SaleOrderProductsEntity getById(Integer id) {
		return saleorprorepo.getById(id);
	}

	@Override
	public List<SaleOrderProductsEntity> findById2(int saleOrderId) {
		
		return saleorprorepo.findById2(saleOrderId);
	}

	@Override
	public List<SaleOrderProductsEntity> findByTime(Date date1, Date date2) {
		// TODO Auto-generated method stub
		return saleorprorepo.findByTime(date1, date2);
	}
	
	
	
}
