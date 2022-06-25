package com.example.Shop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.UserEntity;
import com.example.Shop.repository.UserRepository;
import com.example.Shop.service.IUserService;

@Service
public class UserService implements IUserService {
	
	
	@Autowired
	private UserRepository User;


	@Override
	public UserEntity findByusername(String username) {
		return User.findByusername(username);
	}

	@Override
	public <S extends UserEntity> S save(S entity) {
		return User.save(entity);
	}

	@Override
	public Page<UserEntity> findAll(Pageable pageable) {
		return User.findAll(pageable);
	}

	@Override
	public List<UserEntity> findAll() {
		return User.findAll();
	}

	@Override
	public List<UserEntity> findAllById(Iterable<Integer> ids) {
		return User.findAllById(ids);
	}

	@Override
	public Optional<UserEntity> findById(Integer id) {
		return User.findById(id);
	}

	@Override
	public long count() {
		return User.count();
	}

	@Override
	public void deleteById(Integer id) {
		User.deleteById(id);
	}

	@Override
	public void deleteAll() {
		User.deleteAll();
	}

	@Override
	public UserEntity loadUserByUserName(String username) {
		UserEntity users = User.findByusername(username);
		return users;
	}

	@Override
	public void delete(UserEntity entity) {
		User.delete(entity);
	}

	@Override
	public Page<UserEntity> findByKeywork(String keywork, Pageable pageable) {
		// TODO Auto-generated method stub
		return User.findByKeywork(keywork, pageable);
	}

	@Override
	public UserEntity findById(int id) {
		// TODO Auto-generated method stub
		return User.findById(id).get();
	}

}
