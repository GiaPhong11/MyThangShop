package com.example.Shop.service;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.example.Shop.entities.ProductsEntity;

public interface IProductService {
	//Lấy hết 
	public List<ProductsEntity> findAll();
	
	public Page<ProductsEntity> findAll(Pageable pageable);

	//Lấy theo ID
	public ProductsEntity findById(int id);
	
	//Thêm mới
	public ProductsEntity addProduct(ProductsEntity product,MultipartFile productAvatar, MultipartFile[] productImages) throws Exception;
	
	//Lưu
	public ProductsEntity saveProduct(ProductsEntity product);

	
	
	//Xóa
	public void deleteProduct(int id);
	
	public List<ProductsEntity> findByTitle(String title);
	//Sửa
	ProductsEntity editProduct(ProductsEntity product, MultipartFile productAvatar, MultipartFile[] productImages) throws Exception;


	public Page<ProductsEntity> findByKeywork(String keywork, Pageable pageable);

	public List<ProductsEntity> findProduct();

	List<ProductsEntity> findProductShop();

	Page<ProductsEntity> findAll(String keywork, Pageable pageable);

	public Page<ProductsEntity> ProductShop(Pageable pageable);

	

		
	
}
