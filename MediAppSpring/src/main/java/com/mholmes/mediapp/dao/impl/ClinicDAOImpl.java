package com.mholmes.mediapp.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.mholmes.mediapp.dao.ClinicDAO;
import com.mholmes.mediapp.domain.Clinic;

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
	public void createClinic(String country, String province, String town, String name, String address, String email) {
		
		String SQL = "";
		try{
			getJdbcTemplate
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public Clinic getClinic(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Clinic> listClinics(int id, String country, String province, String town, String name, String email) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
