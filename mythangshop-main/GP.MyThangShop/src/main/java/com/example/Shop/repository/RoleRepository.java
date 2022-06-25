package com.example.Shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Shop.entities.RoleEntity;
import com.example.Shop.entities.UserEntity;

public interface RoleRepository extends JpaRepository<RoleEntity, Integer> {
	/* List<RoleEntity> findByuser(UserEntity user); */
}
