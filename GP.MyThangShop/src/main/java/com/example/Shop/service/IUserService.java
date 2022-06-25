package com.example.Shop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.Shop.entities.UserEntity;


public interface IUserService {


	void deleteAll();

	void deleteById(Integer id);

	long count();

	Optional<UserEntity> findById(Integer id);

	List<UserEntity> findAllById(Iterable<Integer> ids);

	List<UserEntity> findAll();

	Page<UserEntity> findAll(Pageable pageable);

	<S extends UserEntity> S save(S entity);

	UserEntity loadUserByUserName(String username);

	UserEntity findByusername(String username);

	Page<UserEntity> findByKeywork(String keywork, Pageable pageable);

	UserEntity findById(int id);

	void delete(UserEntity entity);




	
}
