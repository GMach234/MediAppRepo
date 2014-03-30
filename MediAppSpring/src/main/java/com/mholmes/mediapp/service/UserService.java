package com.mholmes.mediapp.service;

import java.util.List;
import com.mholmes.mediapp.domain.User;

public interface UserService {

	public void createUser(String name, String type, String address, String phone, String email, String password, int enabled);
	 
	public User getUser(int id, String email);
	  
	public List<User> searchUsers(int id, String name, String email);
	 
	public List<User> listUsers();
	
	public void addAssociation(int u_id, int c_id);
	public void removeAssociation(int u_id, int c_id);
	public boolean checkAssociation(int u_id, int c_id);
	
	public void removeUser(int id);
	//public void delete(String id);
	 
	//public void update(User user);
	  
	//public void batchUpdate(final List<User> users);
	
}
