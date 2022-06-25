package com.example.Shop.controller.API;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.Shop.dto.ResponseObjectDTO;
import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.service.ICategoryService;
import com.example.Shop.service.IProductService;


@RestController
public class ProductAPI {
	@Autowired
	private IProductService productService;
	
	@Autowired	private ICategoryService categoryService;

	@GetMapping("/api/admin/product")
	public List<ProductsEntity> findAll() {
		return productService.findAll();
	}

	@GetMapping("/api/admin/product/{id}")
	public ProductsEntity getOneProduct(@PathVariable int id) {
		return productService.findById(id);
	}
	@GetMapping("/api/admin/findProduct")
	public ResponseEntity<List<ProductsEntity>> listProductByName(
			@RequestParam String name) {
			List<ProductsEntity> proFound = productService.findByTitle(name.trim());
			return ResponseEntity.ok(proFound);
	}

	@PostMapping("/api/admin/product")
	public ResponseEntity<ResponseObjectDTO> saveProduct(@RequestBody ProductsEntity productEntity) {
		try {
			int id = productEntity.getCategories().getId();
			CategoryEntity cate = new CategoryEntity();
			cate.setId(id);
			productEntity.setCategories(cate);
			String name = productEntity.getTitle();
			if (name == null || name == "") {
				return ResponseEntity.status(HttpStatus.NOT_FOUND)
						.body(new ResponseObjectDTO("Fail", "Tieu de khong duoc de trong", ""));
			}
			String detail = productEntity.getDetails();
			if (detail == null || detail == "") {
				return ResponseEntity.status(HttpStatus.NOT_FOUND)
						.body(new ResponseObjectDTO("Fail", "Detail khong duoc de trong", ""));
			}
			BigDecimal price = productEntity.getPrice();
			if (price == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND)
						.body(new ResponseObjectDTO("Fail", "Price khong duoc de trong", ""));
			}
			return ResponseEntity.status(HttpStatus.OK)
					.body(new ResponseObjectDTO("200", "Them thanh cong", productService.saveProduct(productEntity)));

		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseObjectDTO("fail",
					"Khong co danh muc san pham voi id: " + productEntity.getCategories().getId(), ""));
		}

	}

	

	@DeleteMapping("/api/admin/product/{id}")
	public ResponseEntity<ResponseObjectDTO> deleteProduct(
			@PathVariable int id) {
		try {
			productService.deleteProduct(id);
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseObjectDTO("200", "Xoa thanh cong", ""));
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(new ResponseObjectDTO("Failed", "Khong tim thay id: " + id, ""));
		}
	}
	
}	
