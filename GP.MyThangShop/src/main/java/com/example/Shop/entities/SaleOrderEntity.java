package com.example.Shop.entities;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name ="tbl_saleorder")
public class SaleOrderEntity extends BaseEntity{
	@Column(name ="code", length = 45, nullable = false)
	private String code;
	
	@Column(name = "total",precision = 13, scale = 2,  nullable = true)
	private BigDecimal total;
	
	@Column(name ="customer_name", length = 100, nullable = true)
	private String customerName;
	
	@Column(name ="customer_address", length = 100, nullable = true)
	private String customerAddress;
	
	@Column(name ="customer_phone", length = 100, nullable = true)
	private String customerPhone;
	
	@Column(name ="cutomer_email", length = 100, nullable = true)
	private String customerEmail;
	
	@Column(name ="tinh_trang", length = 255, nullable = true)
	private String tinhTrang;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity user;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY, mappedBy = "saleOrderEntity")
	@JsonIgnore
	//Cái giá trị mappedBy sẽ được lấy theo cái tên bên class product, theo cái trường
	private Set<SaleOrderProductsEntity> saleProduct = new HashSet<SaleOrderProductsEntity>();
	
	public void addRelationProduct(SaleOrderProductsEntity saleOrder) {
		saleProduct.add(saleOrder);
		saleOrder.setSaleOrderEntity(this);
	}

	/**
	 * xoa san pham khoi danh sach @OneToMany
	 * @param product
	 */
	public void deleteRelationProduct(SaleOrderProductsEntity saleOrder) {
		saleProduct.remove(saleOrder);
		saleOrder.setSaleOrderEntity(null);
	}
	
	
	
	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public Set<SaleOrderProductsEntity> getSaleProduct() {
		return saleProduct;
	}

	public void setSaleProduct(Set<SaleOrderProductsEntity> saleProduct) {
		this.saleProduct = saleProduct;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	

	public BigDecimal getTotal() {
		return total;
	}

	public String getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	
	
}
