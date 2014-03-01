package com.mholmes.mediapp.dao;

import java.util.List;
import javax.sql.DataSource;

import com.mholmes.mediapp.domain.User;

public interface UserDAO {

	public void create(String name, String type, String address, String phone, String email, String password);
	//public void delete(String id);
	
	//public User getUser(String id);
	//public List<User> listUsers();
	
	//public void update(User user);
	
	//public void batchUpdate(final List<User> users);
	//public void setDataSource(DataSource dataSource);
}
