package com.mholmes.mediapprest.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mholmes.mediapprest.domain.User;

public class UserMapper implements RowMapper<User> {

	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		user.setId(rs.getString("user_id"));
		user.setName(rs.getString("name"));
		user.setAddress(rs.getString("address"));
		user.setPhone(rs.getString("phone"));
		user.setEmail(rs.getString("email"));
		user.setPassword(rs.getString("password"));
		user.setType(rs.getString("user_type"));
		user.setClinic(rs.getInt("clinic_id"));
		return user;
	}
	
}
