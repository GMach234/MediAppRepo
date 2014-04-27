package com.mholmes.mediapprest.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mholmes.mediapprest.domain.Patient;

public class PatientMapper implements RowMapper<Patient> {

	public Patient mapRow(ResultSet rs, int rowNum) throws SQLException {
		Patient patient= new Patient();
		patient.setId(rs.getString("patient_id"));
		patient.setName(rs.getString("name"));
		patient.setAge(rs.getInt("age"));
		patient.setAddress(rs.getString("address"));
		patient.setPhone(rs.getString("phone"));
		patient.setClinic(rs.getInt("clinic_id"));
		return patient;
	}

}
