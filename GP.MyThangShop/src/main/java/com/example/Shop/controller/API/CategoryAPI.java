package com.example.Shop.controller.API;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.service.ICategoryService;

@RestController
public class CategoryAPI {
	@Autowired	private ICategoryService categoryService;

	@GetMapping("/category")
	public List<CategoryEntity> findAll() {
		return categoryService.findAll();
	}
}
