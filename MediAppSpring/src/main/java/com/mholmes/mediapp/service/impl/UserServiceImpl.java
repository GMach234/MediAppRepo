package com.mholmes.mediapp.service.impl;

import com.mholmes.mediapp.dao.UserDAO;
import com.mholmes.mediapp.domain.User;
import com.mholmes.mediapp.service.UserService;

public class UserServiceImpl implements UserService {

private UserDAO userDAO;
    
    public void setUserDAO(UserDAO userDAO) {
    	this.userDAO = userDAO;
    }	
	
	public void create(User user) {
		//if(user.getEnabled() == null) user.setEnabled(1);
		userDAO.create(user);
	}

	/*public User getUser(String username) {
		return userDAO.getUser(username);
	}

	@Override
	public List<User> listUsers() {
		return userDAO.listUsers();
	}

	@Override
	public void delete(String username) {
		userDAO.delete(username);
	}

	@Override
	public void update(User user) {
		userDAO.update(user);
	}

	@Override
	public void batchUpdate(List<User> users) {
		userDAO.batchUpdate(users);
	}*/
	
}
