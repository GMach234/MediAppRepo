package com.mholmes.mediapp.dao;

import java.util.List;
import java.util.Map;

import com.mholmes.mediapp.domain.Clinic;

public interface ClinicDAO {

	public void createClinic(String country, String province, String town, String name, String address, String phone, String email);
	public void removeClinic(int id);
	
	public Clinic getClinic(int id, String name);
	public List<Clinic> getUserClinics(int id);
	
	public List<Clinic> searchClinics(int id, String name, String email);
	public List<Clinic> listClinics();
	
	public List<String> getProvinces(String country);
	public List<String> getTowns(String province);
	public List<Clinic> getNames(String town);
	

}
