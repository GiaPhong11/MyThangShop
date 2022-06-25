package com.example.Shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.Shop.dto.ProductSearch;
import com.example.Shop.entities.ProductsEntity;


@Repository
public interface ProductRepository extends JpaRepository<ProductsEntity, Integer> {
	@Query(value = "SELECT e.* FROM tbl_products e Where e.title like %?1%"
			, nativeQuery = true)
	public List<ProductsEntity> findByTitle(String title);
	
	@Query(value = "SELECT e.* FROM tbl_products e Where e.title like %?1%"
			+" OR e.id LIKE %?1%"
			+" OR e.price LIKE %?1%"
			+" OR e.short_description LIKE %?1%"
			+" OR e.detail_description LIKE %?1%"
			, nativeQuery = true)
	public Page<ProductsEntity> findByKeywork(String keywork, Pageable pageable);
	
	@Query(value = " SELECT * FROM tbl_products LIMIT 3", nativeQuery = true)
	public Page<ProductsEntity> ProductShop(Pageable pageable);
	
	@Query(value = " SELECT * FROM tbl_products LIMIT 4", nativeQuery = true)
	public List<ProductsEntity> findProduct();
	
	@Query(value = " SELECT * FROM tbl_products LIMIT 9", nativeQuery = true)
	public List<ProductsEntity> findProductShop();
	
	
	
	@Query(value = "SELECT e FROM tbl_products e WHERE "
		+"CONCAT(e.id,e.title,e.price,e.shortDescription)"
			+" LIKE %?1%", nativeQuery = true)
	public Page<ProductsEntity> findAll(String keywork, Pageable pageable);


}
