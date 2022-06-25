package com.example.Shop.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.Shop.entities.RoleEntity;
import com.example.Shop.entities.UserEntity;



@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
	@Query(value = "SELECT e.* FROM tbl_users e Where e.username = ?1", nativeQuery = true)
	UserEntity findByusername(String username);

	@Query(value = "SELECT e.* FROM tbl_users e Where e.username like %?1%"
			+" OR e.email LIKE %?1%"
			, nativeQuery = true)
	Page<UserEntity> findByKeywork(String keywork, Pageable pageable);
}
