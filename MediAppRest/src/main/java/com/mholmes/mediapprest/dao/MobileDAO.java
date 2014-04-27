package com.mholmes.mediapprest.dao;

import java.util.List;

import com.mholmes.mediapprest.domain.Clinic;
import com.mholmes.mediapprest.domain.Note;
import com.mholmes.mediapprest.domain.Patient;
import com.mholmes.mediapprest.domain.User;

public interface MobileDAO {

	public boolean verifyUser(String email, String password);
	public User getUser(int id, String email);
	
	public List<Clinic> getClinics(int id);
	
	public List<Patient> getPatients(int id);
	public List<Patient> getUserPatients(int u_id);
	public Patient getPatient(int id);
	
	public List<Note> getNotes(int p_id);
	public void submitNote(int p_id, String note, int u_id);
	
	public boolean submitImage(List<String> imageData);
	public List<String> getImages(int n_id);
	
	public void removeNote(int n_id);
		
}
