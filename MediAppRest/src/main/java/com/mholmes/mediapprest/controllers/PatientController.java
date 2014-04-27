package com.mholmes.mediapprest.controllers;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mholmes.mediapprest.domain.Patient;
import com.mholmes.mediapprest.service.MobileService;

@Controller
public class PatientController {

	private static ApplicationContext services = new ClassPathXmlApplicationContext("dataAccess.xml");	
	private static MobileService mobileService = (MobileService)services.getBean("MobileService");
	
	//Take Clinic ID Path Variable and return a list of Patient Objects, belonging to that clinic, from the DB as JSON
	@RequestMapping(value = "/getPatients/{clinicId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Patient> getPatients(@PathVariable("clinicId") int id) {
				 
		List<Patient> patients= mobileService.getPatients(id);
		return patients;
	}
	
	//Take User ID Path Variable and return a list of Patient Objects, based on notes left by user, from the DB as JSON
	@RequestMapping(value = "/getUserPatients/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Patient> getUserPatients(@PathVariable("userId") int u_id) {
				 		
		List<Patient> patients= mobileService.getUserPatients(u_id);
		return patients;
	}
	
	//Take Patient ID Path Variable and return a Patient Object from the DB as JSON
	@RequestMapping(value = "/getPatient/{patientId}", method = RequestMethod.GET)
	@ResponseBody
	public Patient getPatient(@PathVariable("patientId") int id) {
				 
		Patient patient= mobileService.getPatient(id);
		
		return patient;
	}
	
	
}
