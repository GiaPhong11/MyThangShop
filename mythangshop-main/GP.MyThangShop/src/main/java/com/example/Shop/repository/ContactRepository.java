package com.example.Shop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.Shop.entities.ContactEntity;
import com.example.Shop.entities.ProductsEntity;

@Repository
public interface ContactRepository extends JpaRepository<ContactEntity, Integer>{
	@Query(value = "SELECT e.* FROM tbl_contact e Where e.firstName like %?1%"
			+" OR e.lastName LIKE %?1%"
			+" OR e.email LIKE %?1%"
			+" OR e.message LIKE %?1%"
			, nativeQuery = true)
	public Page<ContactEntity> findByKeywork(String keywork, Pageable pageable);
}
