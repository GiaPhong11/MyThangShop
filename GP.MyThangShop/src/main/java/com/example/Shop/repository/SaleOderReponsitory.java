package com.example.Shop.repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.entities.SaleOrderEntity;


@Repository
public interface SaleOderReponsitory extends JpaRepository<SaleOrderEntity, Integer> {
	@Query(value = "SELECT e.* FROM tbl_products e Where e.code like %?1%"
			+" OR e.total LIKE %?1%"
			+" OR e.customerName LIKE %?1%"
			+" OR e.customerAddress LIKE %?1%"
			+" OR e.customerPhone LIKE %?1%"
			+" OR e.customerEmail LIKE %?1%"
			, nativeQuery = true)
	public Page<SaleOrderEntity> findByKeywork(String keywork, Pageable pageable);
	
	
	@Query(value = "SELECT e.* FROM tbl_saleorder e Where e.id like %?1%", nativeQuery = true)
	public List<SaleOrderEntity> findById2(Integer id);
	
	@Query(value = "SELECT e.* FROM tbl_saleorder e Where e.created_date >= ?1 AND e.created_date <= ?2 ", nativeQuery = true)
	public List<SaleOrderEntity> findByTime(Date date1, Date date2);
	
	public Optional<SaleOrderEntity> findById(Integer id);
	
}
