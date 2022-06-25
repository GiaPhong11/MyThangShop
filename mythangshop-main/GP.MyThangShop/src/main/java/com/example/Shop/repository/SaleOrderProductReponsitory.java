package com.example.Shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.Shop.entities.SaleOrderProductsEntity;


@Repository
public interface SaleOrderProductReponsitory extends JpaRepository<SaleOrderProductsEntity, Integer> {
	@Query(value = "SELECT e.* FROM tbl_saleorder_products e Where e.saleorder_id like %?1%", nativeQuery = true)
	public List<SaleOrderProductsEntity> findById2(Integer id);
}
