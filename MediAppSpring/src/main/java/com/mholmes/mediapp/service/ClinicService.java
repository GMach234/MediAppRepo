package com.mholmes.mediapp.service;

import java.util.List;
import java.util.Map;

import com.mholmes.mediapp.domain.Clinic;

public interface ClinicService {

	public void createClinic(String country, String province, String town, String name, String address, String phone, String email);
	public Clinic getClinic(int id);
	public List<Clinic> searchClinics(int id, String name, String email);
	public List<Clinic> listClinics();
	public List<Clinic> getClinics(int id);
	public List<String> getProvinces(String country);
	public List<String> getTowns(String province);
	public List<Clinic> getNames(String town);
	public void removeClinic(int id);
	
}
