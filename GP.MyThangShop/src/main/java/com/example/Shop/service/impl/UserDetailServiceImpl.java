package com.example.Shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.Shop.entities.UserEntity;
import com.example.Shop.service.IUserService;


@Service
public class UserDetailServiceImpl implements UserDetailsService{
	@Autowired
	private IUserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity user = userService.loadUserByUserName(username);
		return user;
	}

}
