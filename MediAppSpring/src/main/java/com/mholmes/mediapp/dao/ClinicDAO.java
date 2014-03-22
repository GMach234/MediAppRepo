package com.mholmes.mediapp.dao;

import java.util.List;

import com.mholmes.mediapp.domain.Clinic;

public interface ClinicDAO {

	public void createClinic(String country, String province, String town, String name, String address, String phone, String email);
	public Clinic getClinic(int id);
	public List<Clinic> searchClinics(int id, String name, String email);
	public List<Clinic> listClinics();
	public void removeClinic(int id);

}
