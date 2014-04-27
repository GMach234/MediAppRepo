package com.mholmes.mediapprest.service.impl;

import java.util.List;

import com.mholmes.mediapprest.dao.MobileDAO;
import com.mholmes.mediapprest.domain.Clinic;
import com.mholmes.mediapprest.domain.Note;
import com.mholmes.mediapprest.domain.Patient;
import com.mholmes.mediapprest.domain.User;
import com.mholmes.mediapprest.service.MobileService;

public class MobileServiceImpl implements MobileService {

	private MobileDAO mobileDAO;
	
	public void setMobileDAO(MobileDAO mobileDAO) {
		this.mobileDAO = mobileDAO;
	}
	
	@Override
	public boolean verifyUser(String email, String password) {
		return mobileDAO.verifyUser(email, password);		
	}

	@Override
	public User getUser(int id, String email) {
		return mobileDAO.getUser(id, email);
	}

	@Override
	public List<Clinic> getClinics(int id) {
		return mobileDAO.getClinics(id);
	}

	@Override
	public List<Patient> getPatients(int id) {
		return mobileDAO.getPatients(id);
	}

	@Override
	public List<Patient> getUserPatients(int u_id) {
		return mobileDAO.getUserPatients(u_id);
	}

	@Override
	public Patient getPatient(int id) {
		return mobileDAO.getPatient(id);
	}

	@Override
	public List<Note> getNotes(int p_id) {
		return mobileDAO.getNotes(p_id);
	}

	@Override
	public void submitNote(int p_id, String note, int u_id) {
		mobileDAO.submitNote(p_id, note, u_id);		
	}
	
	@Override
	public boolean submitImage(List<String> imageData) {
		return mobileDAO.submitImage(imageData);
	}

	@Override
	public List<String> getImages(int n_id) {
		return mobileDAO.getImages(n_id);
	}

	@Override
	public void removeNote(int n_id) {
		mobileDAO.removeNote(n_id);		
	}

}
