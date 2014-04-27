package com.mholmes.mediapprest.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;

import com.mholmes.mediapprest.domain.User;
import com.mholmes.mediapprest.mappers.ClinicMapper;
import com.mholmes.mediapprest.mappers.NoteMapper;
import com.mholmes.mediapprest.mappers.PatientMapper;
import com.mholmes.mediapprest.mappers.UserMapper;
import com.mholmes.mediapprest.dao.MobileDAO;
import com.mholmes.mediapprest.domain.Patient;
import com.mholmes.mediapprest.domain.Clinic;
import com.mholmes.mediapprest.domain.Note;

public class MobileDAOImpl implements MobileDAO{

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
	
	//Query for user with email and hashed password. Return true if a row was found.
	@Override
	public boolean verifyUser(String email, String password) {
		
		String SQL = "select count(*) from users where email = ? and password = ?";
		int result = 0;
		
		try{
			result = getJdbcTemplate().queryForInt(SQL, new Object[]{email, password});
			if(result == 1) {return true;} else {return false;}
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	//Query for User based on Email or User ID from User table
	@Override
	public User getUser(int id, String email) {
		
		User user = new User();
		String SQL = "select * from users where user_id = ? or email = ?";
		
		try{
			user = (User) getJdbcTemplate().queryForObject(SQL, 
					new Object[]{id, email}, new UserMapper());
			
			return user;
			
		} catch(Exception e) {
			e.printStackTrace();
			return user;
		}	
	}

	//Query for List of Clinics based on ID from associations table
	@Override
	public List<Clinic> getClinics(int id) {
		
		List<Clinic> clinics = new ArrayList<Clinic>();
		String SQL = "select * from clinics where clinic_id = ANY (select clinic_id from associations where user_id =?);";
		
		try {
			clinics = getJdbcTemplate().query(SQL, new Object[]{id}, new ClinicMapper());
			return clinics;
		} catch(Exception e) {
			e.printStackTrace();
			return clinics;
		}
	}

	//Query for Patients based on Clinic ID from patients table
	@Override
	public List<Patient> getPatients(int id) {
		
		List<Patient> patients = new ArrayList<Patient>();
		String SQL = "select * from patients where clinic_id = ?";
		
		try {
			patients = getJdbcTemplate().query(SQL, new Object[]{id}, new PatientMapper());
			return patients;
		} catch(Exception e) {
			e.printStackTrace();
			return patients;
		}	
	}
	
	//Query for List of Patients based on User ID from Patients table, by checking notes from Notes table
	@Override
	public List<Patient> getUserPatients(int u_id) {
	
		List<Patient> patients = new ArrayList<Patient>();
		String SQL = "select * from patients where patient_id = ANY (select patient_id from notes where user_id = ?)";
		
		try {
			patients = getJdbcTemplate().query(SQL, new Object[]{u_id}, new PatientMapper());	
			return patients;
		} catch(Exception e) {
			e.printStackTrace();
			return patients;
		}
	}
	
	//Query for Patient based on Patient ID from Patients table
	@Override
	public Patient getPatient(int id) {

		Patient patient = new Patient();
		String SQL = "select * from patients where patient_id = ?";
		
		try {
			patient = (Patient) getJdbcTemplate().queryForObject(SQL, new Object[]{id}, new PatientMapper());
			return patient;
		} catch(Exception e) {
			e.printStackTrace();
			return patient;
		}
	}

	//Query for list of Notes based on Patient ID from Notes table
	@Override
	public List<Note> getNotes(int p_id) {

		List<Note> notes = new ArrayList<Note>();
		String SQL = "select * from notes where patient_id = ?";
		
		try {
			notes = getJdbcTemplate().query(SQL, new Object[]{p_id}, new NoteMapper());
			return notes;
		} catch(Exception e) {
			e.printStackTrace();
			return notes;
		}
	}
	
	//Create a new Note in Notes table with Patient ID, Note text and User ID
	@Override
	public void submitNote(int p_id, String note, int u_id) {
		
		String SQL = "insert into notes(PATIENT_ID, NOTE, USER_ID) values (?, ?, ?);";
		
		try {
			getJdbcTemplate().update(SQL, new Object[] {p_id, note, u_id});
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//Batch Update the Images table with latest Note ID and an Array of Strings containing image Data.
	@Override
	public boolean submitImage(final List<String> imageData) {
				
		String SQL = "insert into images(NOTE_ID, IMAGEDATA) values ((select MAX(note_id) from notes), ?);";
		
		try {
			getJdbcTemplate().batchUpdate(SQL, new BatchPreparedStatementSetter() {
				
				public void setValues(PreparedStatement ps, int i) throws SQLException {
					String image = imageData.get(i);
					ps.setString(1, image);
				}
				
				public int getBatchSize() {
					return imageData.size();
				}
				
			});
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	//Query for a List of Strings containing Image Data based on Note ID
	@Override
	public List<String> getImages(int n_id) {
		
		List<String> images = new ArrayList<String>();
		String SQL = "select imageData from images where note_id = " + n_id;
		
		try{
			images = getJdbcTemplate().queryForList(SQL, String.class);
			return images;
		} catch(Exception e) {
			e.printStackTrace();
			return images;
		}
	}
	
	//Delete form Images and Notes table based on Note ID
	@Override
	public void removeNote(int n_id) {
		
		String SQL = "delete from notes where note_id = ?;";
		String SQL1 = "delete from images where note_id = ?;";
		
		try{
			getJdbcTemplate().update(SQL, n_id);
			getJdbcTemplate().update(SQL1, n_id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	




}
