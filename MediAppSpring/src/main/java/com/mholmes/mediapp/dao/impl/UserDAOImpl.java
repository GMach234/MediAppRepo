package com.mholmes.mediapp.dao.impl;

import java.util.List;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import com.mholmes.mediapp.dao.UserDAO;
import com.mholmes.mediapp.domain.User;
import com.mholmes.mediapp.mappers.UserMapper;

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
	
	@Override
	public void createUser(String name, String type, String address, String phone, String email, String password) {

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

	public User getUser(int id) {
		String SQL = "select * from users where user_id = ?";
		User user = (User) getJdbcTemplate().queryForObject(SQL, 
						new Object[]{id}, new UserMapper());
		return user;
	}
	
	public List<User> listUsers(int id, String name, String email) {
		
		String SQL = "select * from users where user_id = '"+id+"' or name = '"+name+"' or email = '"+email+"'";
		List<User> users = getJdbcTemplate().query(SQL,
						new UserMapper());
		
		return users;
	}
	
}


