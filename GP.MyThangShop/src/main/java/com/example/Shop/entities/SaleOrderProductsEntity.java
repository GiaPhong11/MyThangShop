package com.example.Shop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name ="tbl_saleorder_products")
public class SaleOrderProductsEntity extends BaseEntity{

	@Column(name ="quality",  nullable = false)
	private Integer quality;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private ProductsEntity product;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "saleorder_id") // Tên khóa phụ trong bảng products
	private SaleOrderEntity saleOrderEntity; // đây là cái mappedBy
	
	public SaleOrderEntity getSaleOrderEntity() {
		return saleOrderEntity;
	}

	public void setSaleOrderEntity(SaleOrderEntity saleOrderEntity) {
		this.saleOrderEntity = saleOrderEntity;
	}
	

	public ProductsEntity getProduct() {
		return product;
	}

	public void setProduct(ProductsEntity product) {
		this.product = product;
	}


	public Integer getQuality() {
		return quality;
	}

	public void setQuality(Integer quality) {
		this.quality = quality;
	}
	
	
}
