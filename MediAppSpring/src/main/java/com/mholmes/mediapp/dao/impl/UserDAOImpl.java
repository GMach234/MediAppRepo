package com.mholmes.mediapp.dao.impl;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.mholmes.mediapp.dao.UserDAO;
import com.mholmes.mediapp.domain.User;

@Repository("userDao")
public class UserDAOImpl implements UserDAO {

	private JdbcTemplate jdbcTemplate;
	private JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	@Override
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public boolean create(User user) {
		boolean created = false;
		if(!userAlreadyExists(user.getId())) {
			created = true;
			
			String SQL = "insert into users (USER_ID, USER_TYPE, ADDRESS, PHONE, EMAIL, PASSWORD)" +
						" values (?, ?, ?, ?, ?, ?)";
			getJdbcTemplate().update(SQL, new Object[] {
							user.getId(), user.getType(),
							user.getAddress(), user.getPhone(),
							user.getEmail(), user.getPassword()});			
		}
		return created;
	}
	private boolean userAlreadyExists(String id) {
		boolean userAlreadyExists = false;
		String SQL = "select count(user.id) from users user where id = ?";
		Integer result = (Integer) getJdbcTemplate().queryForObject(SQL,
														new Object[]{id},
														Integer.class);
		if(result != null && result > 0) {
			userAlreadyExists = true;
		}
		return userAlreadyExists;
	}
	
}


