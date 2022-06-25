package com.example.Shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.ProductsEntity;

public interface ICategoryService {

	//Lấy hết 
	public List<CategoryEntity> findAll();
	
	//Lấy theo ID
	public CategoryEntity findById(int id);
	
	//Thêm mới
	public CategoryEntity addCategory(CategoryEntity category);
	
	
	
	//Lưu
	public CategoryEntity saveCategory(CategoryEntity category);

	//Sửa
	public CategoryEntity editCategory(CategoryEntity category);
	
	//Xóa
	public void deleteCategory(int id);
	
	//Tìm theo tên
	public List<CategoryEntity> findCategoryByTitle(String name);

	Page<CategoryEntity> findAll(Pageable pageable);

	Page<CategoryEntity> findByKeywork(String keywork, Pageable pageable);

	void delete(CategoryEntity entity);

	void deleteById(Integer id);

	<S extends CategoryEntity> S save(S entity);
}
