package com.mholmes.mediapp.service;

import java.util.List;
import com.mholmes.mediapp.domain.User;

public interface UserService {

	public void createUser(String name, String type, String address, String phone, String email, String password, int enabled);
	 
	public User getUser(int id);
	  
	public List<User> listUsers(int id, String name, String email);
	 
	public void removeUser(int id);
	//public void delete(String id);
	 
	//public void update(User user);
	  
	//public void batchUpdate(final List<User> users);
	
}
