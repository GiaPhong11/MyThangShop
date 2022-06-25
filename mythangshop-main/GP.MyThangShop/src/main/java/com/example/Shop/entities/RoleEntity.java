package com.example.Shop.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;



@Entity
@Table(name = "tbl_roles")
public class RoleEntity extends BaseEntity implements GrantedAuthority{	
	//private static final long serialVersionUID = -4109488814868694331L;

	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@Column(name = "description", length = 45, nullable = false)
	private String description;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_users_roles", 
	joinColumns = @JoinColumn(name = "role_id"),
	inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<UserEntity> users = new ArrayList<UserEntity>();
	
	public void addUsers(UserEntity user) {
		user.getRoles().add(this);
		users.add(user);
	}
	public void deleteUsers(UserEntity user) {
		user.getRoles().remove(this);
		users.remove(user);
	}

	public List<UserEntity> getUser() {
		return users;
	}

	public void setUser(List<UserEntity> user) {
		this.users = user;
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
//	@Override
//	public String getAuthority() {
//		// TODO Auto-generated method stub
//		return name;
//	}
	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return name;
	}
}
