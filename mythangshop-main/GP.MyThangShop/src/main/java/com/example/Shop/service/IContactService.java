package com.example.Shop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.example.Shop.entities.ContactEntity;
import com.example.Shop.entities.ProductsEntity;

public interface IContactService {

	ContactEntity getById(Integer id);

	void deleteAll();

	void delete(ContactEntity entity);

	long count();

	Optional<ContactEntity> findById(Integer id);

	List<ContactEntity> findAll(Sort sort);

	List<ContactEntity> findAll();

	Page<ContactEntity> findAll(Pageable pageable);

	<S extends ContactEntity> Page<S> findAll(Example<S> example, Pageable pageable);

	Page<ContactEntity> findByKeywork(String keywork, Pageable pageable);

	

}
