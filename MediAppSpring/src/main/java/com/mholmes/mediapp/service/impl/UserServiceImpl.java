package com.mholmes.mediapp.service.impl;

import java.util.List;

import com.mholmes.mediapp.dao.UserDAO;
import com.mholmes.mediapp.domain.User;
import com.mholmes.mediapp.service.UserService;

public class UserServiceImpl implements UserService {

private UserDAO userDAO;
    
    public void setUserDAO(UserDAO userDAO) {
    	this.userDAO = userDAO;
    }	
	
	public void createUser(String name, String type, String address, String phone, String email, String password, int enabled) {
		//if(user.getEnabled() == null) user.setEnabled(1);
		userDAO.createUser(name, type, address, phone, email, password, enabled);
	}

	public User getUser(int id) {
		return userDAO.getUser(id);
	}

	@Override
	public List<User> searchUsers(int id, String name, String email){
		return userDAO.searchUsers(id, name, email);
	}

	public void removeUser(int id) {
		userDAO.removeUser(id);
	}

	@Override
	public List<User> listUsers() {
		return userDAO.listUsers();
	}

	@Override
	public void addAssociation(int u_id, int c_id) {
		userDAO.addAssociation(u_id, c_id);	
	}

	@Override
	public boolean checkAssociation(int u_id, int c_id) {
		return userDAO.checkAssociation(u_id, c_id);
	}

	@Override
	public void removeAssociation(int u_id, int c_id) {
		userDAO.removeAssociation(u_id, c_id);
	}
	
	/*@Override
	public void delete(String username) {
		userDAO.delete(username);
	}*/

	/*@Override
	public void update(User user) {
		userDAO.update(user);
	}*/

	/*@Override
	public void batchUpdate(List<User> users) {
		userDAO.batchUpdate(users);
	}*/
	
}
