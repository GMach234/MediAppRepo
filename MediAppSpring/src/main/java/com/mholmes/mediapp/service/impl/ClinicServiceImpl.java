package com.mholmes.mediapp.service.impl;

import java.util.List;

import com.mholmes.mediapp.dao.ClinicDAO;
import com.mholmes.mediapp.domain.Clinic;
import com.mholmes.mediapp.service.ClinicService;

public class ClinicServiceImpl implements ClinicService {

	private ClinicDAO clinicDAO;
	
	public void setClinicDAO(ClinicDAO clinicDAO) {
		this.clinicDAO = clinicDAO;
	}

	@Override
	public void createClinic(String country, String province, String town, String name, String address, String email) {
		
		clinicDAO.createClinic(country, province, town, name, address, email);
	}

	@Override
	public Clinic getClinic(int id) {
		return clinicDAO.getClinic(id);
	}

	@Override
	public List<Clinic> listClinics(int id, String country, String province, String town, String name, String email) {
		return clinicDAO.listClinics(id, country, province, town, name, email);
	}
	
}
