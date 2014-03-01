package com.mholmes.mediapp.service;

import java.util.List;
import com.mholmes.mediapp.domain.User;

public interface UserService {

	public void create(String name, String type, String address, String phone, String email, String password);
	 
/*	   public User getUser(String id);
	  
	   public List<User> listUsers();
	 
	   public void delete(String id);
	 
	   public void update(User user);
	  
	   public void batchUpdate(final List<User> users);*/
	
}
