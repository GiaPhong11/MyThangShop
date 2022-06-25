package com.example.Shop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.Shop.entities.ContactEntity;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.repository.ContactRepository;
import com.example.Shop.service.IContactService;

@Service
public class ContactService implements IContactService {
	
	@Autowired
	private ContactRepository contactRepo;

	@Override
	public Page<ContactEntity> findAll(Pageable pageable) {
		return contactRepo.findAll(pageable);
	}

	@Override
	public Page<ContactEntity> findByKeywork(String keywork, Pageable pageable) {
		return contactRepo.findByKeywork(keywork, pageable);
	}

	@Override
	public <S extends ContactEntity> Page<S> findAll(Example<S> example, Pageable pageable) {
		return contactRepo.findAll(example, pageable);
	}

	@Override
	public List<ContactEntity> findAll() {
		return contactRepo.findAll();
	}

	@Override
	public List<ContactEntity> findAll(Sort sort) {
		return contactRepo.findAll(sort);
	}

	@Override
	public Optional<ContactEntity> findById(Integer id) {
		return contactRepo.findById(id);
	}

	@Override
	public long count() {
		return contactRepo.count();
	}

	@Override
	public void delete(ContactEntity entity) {
		contactRepo.delete(entity);
	}

	@Override
	public void deleteAll() {
		contactRepo.deleteAll();
	}

	@Override
	public ContactEntity getById(Integer id) {
		return contactRepo.getById(id);
	}

	public <S extends ContactEntity> S save(S entity) {
		return contactRepo.save(entity);
	}

	
	
}
