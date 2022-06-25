	package com.example.Shop.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity // can dinh nghia de spring-jpa biet.
@Table(name = "tbl_category")
public class CategoryEntity extends BaseEntity {
	
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	
	@Column(name = "description", length = 100, nullable = false)
	private String description;

//	@Column(name ="parent_id", nullable = true)
//	private Integer parentId;
	
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	
	@JsonIgnore
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY, mappedBy = "categories")
	//Cái giá trị mappedBy sẽ được lấy theo cái tên bên class product, theo cái trường
	private Set<ProductsEntity> products = new HashSet<ProductsEntity>();

	/**
	 * them  1 san pham vao danh sach @OneToMany
	 * @param product
	 */
	public void addRelationProduct(ProductsEntity product) {
		products.add(product);
		product.setCategories(this);
	}

	/**
	 * xoa san pham khoi danh sach @OneToMany
	 * @param product
	 */
	public void deleteRelationProduct(ProductsEntity product) {
		products.remove(product);
		product.setCategories(null);
	}
	
	public Set<ProductsEntity> getProducts() {
		return products;
	}

	public void setProducts(Set<ProductsEntity> products) {
		this.products = products;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}
	
	
}
