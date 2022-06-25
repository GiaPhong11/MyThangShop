package com.example.Shop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name ="tbl_products_images")
public class ProductsImagesEntity extends BaseEntity{
	@Column(name ="title", length = 500, nullable = false)
	private String title;
	
	@Column(name ="path", length = 200, nullable = false)
	private String path;
	
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id") // Tên khóa phụ trong bảng products
	private ProductsEntity productsEntity; // đây là cái mappedBy

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public ProductsEntity getProductsEntity() {
		return productsEntity;
	}

	public void setProductsEntity(ProductsEntity productsEntity) {
		this.productsEntity = productsEntity;
	}
	
}
