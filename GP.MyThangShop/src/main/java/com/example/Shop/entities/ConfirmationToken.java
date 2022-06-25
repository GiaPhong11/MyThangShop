//package com.example.Shop.entities;
//
//import java.util.Date;
//import java.util.UUID;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.JoinColumn;
//import javax.persistence.OneToOne;
//import javax.persistence.Table;
//import javax.persistence.Temporal;
//import javax.persistence.TemporalType;
//
//@Entity
//@Table(name = "tbl_confirmationtoken")
//public class ConfirmationToken extends BaseEntity{
//	@Column(name="confirmation_token")
//    private String confirmationToken;
//
//    @Temporal(TemporalType.TIMESTAMP)
//    private Date createdDate;
//
//    @OneToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
//    @JoinColumn(nullable = false, name = "user_id")
//    private UserEntity user;
//
//    public ConfirmationToken(UserEntity user) {
//        this.user = user;
//        createdDate = new Date();
//        confirmationToken = UUID.randomUUID().toString();
//    }
//
//	public String getConfirmationToken() {
//		return confirmationToken;
//	}
//
//	public void setConfirmationToken(String confirmationToken) {
//		this.confirmationToken = confirmationToken;
//	}
//
//	public Date getCreatedDate() {
//		return createdDate;
//	}
//
//	public void setCreatedDate(Date createdDate) {
//		this.createdDate = createdDate;
//	}
//
//	public UserEntity getUser() {
//		return user;
//	}
//
//	public void setUser(UserEntity user) {
//		this.user = user;
//	}
//    
//}
