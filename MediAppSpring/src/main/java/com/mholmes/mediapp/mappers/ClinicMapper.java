package com.mholmes.mediapp.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mholmes.mediapp.domain.Clinic;

public class ClinicMapper implements RowMapper<Clinic> {

	public Clinic mapRow(ResultSet rs, int rowNum) throws SQLException {
		Clinic clinic = new Clinic();
		clinic.setId(rs.getString("clinic_id"));
		clinic.setName(rs.getString("name"));
		clinic.setCountry(rs.getString("country"));
		clinic.setProvince(rs.getString("province"));
		clinic.setTown(rs.getString("town"));
		clinic.setAddress(rs.getString("address"));
		clinic.setPhone(rs.getString("phone"));
		clinic.setEmail(rs.getString("email"));
		return clinic;
	}
	
}
