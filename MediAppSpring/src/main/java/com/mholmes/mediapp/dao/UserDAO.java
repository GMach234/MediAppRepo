package com.mholmes.mediapp.dao;

import java.util.List;
import javax.sql.DataSource;

import com.mholmes.mediapp.domain.User;

public interface UserDAO {

	public void createUser(String name, String type, String address, String phone, String email, String password, int enabled);
	public User getUser(int id);
	public List<User> searchUsers(int id, String name, String email);
	public List<User> listUsers();
	public void removeUser(int id);
	
	//public void update(User user);
	
	//public void batchUpdate(final List<User> users);
	//public void setDataSource(DataSource dataSource);
}
