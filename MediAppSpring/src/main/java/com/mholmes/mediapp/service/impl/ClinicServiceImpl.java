package com.mholmes.mediapp.service.impl;

import java.util.List;
import java.util.Map;

import com.mholmes.mediapp.dao.ClinicDAO;
import com.mholmes.mediapp.domain.Clinic;
import com.mholmes.mediapp.service.ClinicService;

public class ClinicServiceImpl implements ClinicService {

	private ClinicDAO clinicDAO;
	
	public void setClinicDAO(ClinicDAO clinicDAO) {
		this.clinicDAO = clinicDAO;
	}

	@Override
	public void createClinic(String country, String province, String town, String name, String address, String phone, String email) {
		
		clinicDAO.createClinic(country, province, town, name, address, phone, email);
	}

	@Override
	public Clinic getClinic(int id) {
		return clinicDAO.getClinic(id);
	}

	@Override
	public List<Clinic> searchClinics(int id, String name, String email) {
		return clinicDAO.searchClinics(id, name, email);
	}

	@Override
	public void removeClinic(int id) {
		clinicDAO.removeClinic(id);
	}

	@Override
	public List<Clinic> listClinics() {
		
		return clinicDAO.listClinics();
	}

	@Override
	public List<Clinic> getClinics(int id) {
		return clinicDAO.getClinics(id);
	}

	@Override
	public List<String> getProvinces(String country) {
		return clinicDAO.getProvinces(country);
	}

	@Override
	public List<String> getTowns(String province) {
		return clinicDAO.getTowns(province);
	}

	@Override
	public List<Clinic> getNames(String town) {
		return clinicDAO.getNames(town);
	}
	
}
