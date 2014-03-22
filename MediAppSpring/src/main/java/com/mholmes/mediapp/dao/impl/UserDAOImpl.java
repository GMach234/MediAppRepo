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
	public void createUser(String name, String type, String address, String phone, String email, String password, int enabled) {

			System.out.println("*~[Adding user to DB]~*");
			
			String role;
			if(type.equals("Admin")) {
				role = "ROLE_ADMIN";
			} else {
				role = "ROLE_USER";
			}
			
			/*String SQL = "insert into users (NAME, USER_TYPE, ADDRESS, PHONE, EMAIL, PASSWORD, ENABLED)" +
						" values (?, ?, ?, ?, ?, ?, ?);"
						+ "insert into authorities (USER_ID, AUTHORITY)" +
						" values (select user_id from users where user_id = (select MAX(user_id) from users), 'ROLE_ADMIN')";
			*/
			String SQL = "insert into users (NAME, USER_TYPE, ADDRESS, PHONE, EMAIL, PASSWORD, ENABLED)" 
			+ "values (?, ?, ?, ?, ?, ?, ?);";
			String SQL1 = "insert into authorities (USER_ID) SELECT user_id from users "
			+ "where user_id = (select MAX(user_id) from users);";
			String SQL2 = "update authorities set authority = '"+role+"'"
					+ " where user_id = (select MAX(user_id) from users)";
			
			try{
			getJdbcTemplate().update(SQL, new Object[] {
							name, type, address, phone, email, password, enabled});
			getJdbcTemplate().execute(SQL1);
			getJdbcTemplate().execute(SQL2);
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
	
	public List<User> searchUsers(int id, String name, String email) {
		
		String SQL = "select * from users where user_id = ? or name = ? or email = ?";
		List<User> users = getJdbcTemplate().query(SQL,new Object[]{id, name, email}, new UserMapper());
		
		return users;
	}

	public void removeUser(int id) {
		
		String SQL = "delete from users where user_id = ?";
		
		try{
			getJdbcTemplate().update(SQL, id);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public List<User> listUsers() {
		
		String SQL = "select * from users";
		List<User> users = getJdbcTemplate().query(SQL,new Object[]{}, new UserMapper());
		
		return users;
	}
	
}


