package com.example.Shop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.entities.SaleOrderEntity;
import com.example.Shop.entities.SaleOrderProductsEntity;
import com.example.Shop.repository.SaleOderReponsitory;
import com.example.Shop.service.ISaleOderService;


@Service
public class SaleOderService implements ISaleOderService {
	
	@Autowired
	private SaleOderReponsitory saleoderRepository;


	
	@Override
	public <S extends SaleOrderEntity> List<S> saveAll(Iterable<S> entities) {
		return saleoderRepository.saveAll(entities);
	}





	@Override
	public Page<SaleOrderEntity> findAll(Pageable pageable) {
		return saleoderRepository.findAll(pageable);
	}


	@Override
	public Page<SaleOrderEntity> findByKeywork(String keywork, Pageable pageable) {
		return saleoderRepository.findByKeywork(keywork, pageable);
	}


	@Override
	public long count() {
		return saleoderRepository.count();
	}



	@Override
	public void delete(SaleOrderEntity entity) {
		saleoderRepository.delete(entity);
	}



	@Override
	public void deleteAll() {
		saleoderRepository.deleteAll();
	}



	@Override
	public SaleOrderEntity getById(Integer id) {
		return saleoderRepository.getById(id);
	}



	@Override
	public SaleOrderEntity saveSaleOder(SaleOrderEntity saleorder) {
		// TODO Auto-generated method stub
		return saleoderRepository.save(saleorder);
	}





	public List<SaleOrderEntity> findById2(Integer id) {
		return saleoderRepository.findById2(id);
	}






	
	
}
