package com.mholmes.mediapp.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.mholmes.mediapp.dao.UserDAO;
import com.mholmes.mediapp.domain.User;

public class UserDAOImpl implements UserDAO {

	
	private DataSource dataSource;
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	private JdbcTemplate jdbcTemplate;
	private JdbcTemplate getJdbcTemplate() {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate;
	}
	
/*	@Override
	public void create(User user) {

			
			System.out.println("I MADE IT");
			
			String SQL = "insert into users (NAME, USER_TYPE, ADDRESS, PHONE, EMAIL, PASSWORD)" +
						" values (?, ?, ?, ?, ?, ?)";
			try{
			getJdbcTemplate().update(SQL, new Object[] {
							user.getName(),
							user.getType(), user.getAddress(), 
							user.getPhone(), user.getEmail(), 
							user.getPassword()});
			}
			catch(Exception e){
				e.printStackTrace();
			}
	}	*/
	
	@Override
	public void create(String name, String type, String address, String phone, String email, String password) {

			System.out.println("*~[Adding user to DB]~*");
			
			String SQL = "insert into users (NAME, USER_TYPE, ADDRESS, PHONE, EMAIL, PASSWORD)" +
						" values (?, ?, ?, ?, ?, ?)";
			try{
			getJdbcTemplate().update(SQL, new Object[] {
							name, type, address, phone, email, password});
			}
			catch(Exception e){
				e.printStackTrace();
			}
	}	

}


