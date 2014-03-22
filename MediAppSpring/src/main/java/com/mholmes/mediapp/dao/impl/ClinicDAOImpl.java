package com.mholmes.mediapp.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.mholmes.mediapp.dao.ClinicDAO;
import com.mholmes.mediapp.domain.Clinic;
import com.mholmes.mediapp.domain.User;
import com.mholmes.mediapp.mappers.ClinicMapper;
import com.mholmes.mediapp.mappers.UserMapper;

public class ClinicDAOImpl implements ClinicDAO {

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
	public void createClinic(String country, String province, String town, String name, String address, String phone, String email) {
		
		String SQL = "insert into clinics (COUNTRY, PROVINCE, TOWN, NAME, ADDRESS, PHONE, EMAIL)" +
					" values (?, ?, ?, ?, ?, ?, ?)";
		try{
			getJdbcTemplate().update(SQL, new Object[] {
					country, province, town, name, address, phone, email});
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public Clinic getClinic(int id) {
		String SQL = "select * from clinics where clinic_id = ?";
		Clinic clinic = (Clinic) getJdbcTemplate().queryForObject(SQL, 
						new Object[]{id}, new ClinicMapper());
		return clinic;
	}

	@Override
	public List<Clinic> searchClinics(int id, String name, String email) {
		
		String SQL = "select * from clinics where clinic_id = ? or name = ? or email = ?";
		List<Clinic> clinics = getJdbcTemplate().query(SQL, new Object[]{id, name, email},
						new ClinicMapper()); 
				
		return clinics;
	}

	@Override
	public void removeClinic(int id) {
		
		String SQL = "delete from clinics where clinic_id = ?";
		//Take Patients into account
		try{
			getJdbcTemplate().update(SQL, id);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Clinic> listClinics() {
		
		String SQL = "select * from clinics";
		List<Clinic> clinics = getJdbcTemplate().query(SQL,new Object[]{}, new ClinicMapper());
		
		return clinics;
	}
	
	
}
