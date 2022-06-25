package com.example.Shop.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;


import com.example.Shop.dto.Constants;

import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.repository.ProductRepository;
import com.example.Shop.service.IProductService;

import com.example.Shop.entities.ProductsImagesEntity;

@Service
public class ProductService implements IProductService ,Constants {

	@Autowired
	private ProductRepository productRepository;

	
	@Override
	public List<ProductsEntity> findProductShop() {
		return productRepository.findProductShop();
	}

	@Override
	public Page<ProductsEntity> findAll(String keywork, Pageable pageable) {
		return productRepository.findAll(keywork, pageable);
	}

	@Override
	public List<ProductsEntity> findAll() {
		// TODO Auto-generated method stub
		return productRepository.findAll();
	}

	@Override
	public Page<ProductsEntity> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return productRepository.findAll(pageable);
	}	
	
	public Page<ProductsEntity> ProductShop(Pageable pageable) {
		return productRepository.ProductShop(pageable);
	}

	@Override
	public ProductsEntity findById(int id) {
		// TODO Auto-generated method stub
		return productRepository.findById(id).get();
	}
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	@Override
	public ProductsEntity addProduct(ProductsEntity product,MultipartFile inputAvatar, MultipartFile[] inputPictures) throws Exception {
		if(!isEmptyUploadFile(inputAvatar)) {
			String pathToFile = UPLOAD_FILE_ROOT + "/product/avatar/"
				+ inputAvatar.getOriginalFilename();
			inputAvatar.transferTo(new File(pathToFile));
			product.setAvatar("product/avatar/" +inputAvatar.getOriginalFilename());
		}
		
		//product imgages
		// có đẩy pictures ???
		if (!isEmptyUploadFile(inputPictures)) {
			String pathToFile = UPLOAD_FILE_ROOT +"/product/pictures/";
					
			for (MultipartFile pic : inputPictures) {
				pic.transferTo(new File(pathToFile + pic.getOriginalFilename()));

				ProductsImagesEntity pi = new ProductsImagesEntity();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				product.addRelationProduct(pi);
			}
		}
		return productRepository.save(product);
	}
	
	
	@Override
	public ProductsEntity saveProduct(ProductsEntity product) {
		// TODO Auto-generated method stub
		return productRepository.save(product);
	}

	@Override
	public ProductsEntity editProduct(ProductsEntity product,MultipartFile productAvatar, MultipartFile[] productImages) throws Exception {
		//Có đẩy avatar lên không
				// lay thong tin san pham trong db.
				ProductsEntity productOnDb = productRepository.findById(product.getId()).get();
						
				// có đẩy avartar ???
				if(!isEmptyUploadFile(productAvatar)) {
					// xóa avatar trong folder lên
					new File(UPLOAD_FILE_ROOT + productOnDb.getAvatar()).delete();
							
					// add avartar moi
					productAvatar.transferTo(new File(UPLOAD_FILE_ROOT + "\\product\\avatar\\" + productAvatar.getOriginalFilename()));
					product.setAvatar("/product/avatar/" + productAvatar.getOriginalFilename());
				} else {
					// su dung lai avatar cu
					product.setAvatar(productOnDb.getAvatar());
				}
						
						// có đẩy pictures ???
				if (!isEmptyUploadFile(productImages)) {
							
							
					for (MultipartFile pic : productImages) {
						pic.transferTo(new File(UPLOAD_FILE_ROOT + "\\product\\pictures\\" + pic.getOriginalFilename()));

						ProductsImagesEntity pi = new ProductsImagesEntity();
						pi.setPath("/product/pictures/" + pic.getOriginalFilename());
						pi.setTitle(pic.getOriginalFilename());
								
						product.addRelationProduct(pi);
					}
				}
				
				return productRepository.save(product);
	}

	@Override
	public void deleteProduct(int id) {
		// TODO Auto-generated method stub
		productRepository.deleteById(id);
	}

	@Override
	public List<ProductsEntity> findByTitle(String title) {
		// TODO Auto-generated method stub
		return productRepository.findByTitle(title);
	}
	@Override
	public Page<ProductsEntity> findByKeywork(String keywork, Pageable pageable) {
		return productRepository.findByKeywork(keywork, pageable);
	}

	@Override
	public List<ProductsEntity> findProduct() {
		// TODO Auto-generated method stub
		return productRepository.findProduct();
	}
	
	
}
