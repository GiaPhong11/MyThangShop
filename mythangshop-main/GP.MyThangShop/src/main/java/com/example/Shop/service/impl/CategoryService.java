package com.example.Shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.repository.CategoryRepository;
import com.example.Shop.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public List<CategoryEntity> findAll() {
		// TODO Auto-generated method stub
		return categoryRepository.findAll();
	}
	
	@Override
	public void deleteById(Integer id) {
		categoryRepository.deleteById(id);
	}

	@Override
	public <S extends CategoryEntity> S save(S entity) {
		return categoryRepository.save(entity);
	}

	@Override
	public void delete(CategoryEntity entity) {
		categoryRepository.delete(entity);
	}

	@Override
	public Page<CategoryEntity> findByKeywork(String keywork, Pageable pageable) {
		return categoryRepository.findByKeywork(keywork, pageable);
	}

	@Override
	public Page<CategoryEntity> findAll(Pageable pageable) {
		return categoryRepository.findAll(pageable);
	}

	@Override
	public CategoryEntity findById(int id) {
		// TODO Auto-generated method stub
		return categoryRepository.findById(id).get();
	}

	@Override
	public CategoryEntity addCategory(CategoryEntity category) {
		// TODO Auto-generated method stub
		return categoryRepository.save(category);
	}

	@Override
	public CategoryEntity saveCategory(CategoryEntity category) {
		// TODO Auto-generated method stub
		return categoryRepository.save(category);
	}



	@Override
	public void deleteCategory(int id) {
		// TODO Auto-generated method stub
		categoryRepository.deleteById(id);
	}

	@Override
	public List<CategoryEntity> findCategoryByTitle(String name) {
		// TODO Auto-generated method stub
		return categoryRepository.findByTitle(name);
	}

	@Override
	public CategoryEntity editCategory(CategoryEntity category) {
		// TODO Auto-generated method stub
		CategoryEntity cateOnDb = categoryRepository.findById(category.getId()).get();
		return categoryRepository.save(cateOnDb);
	}
	
	
}
