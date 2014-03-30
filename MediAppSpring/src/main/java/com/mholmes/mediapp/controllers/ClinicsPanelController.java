package com.mholmes.mediapp.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.Valid;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mholmes.mediapp.domain.Clinic;
import com.mholmes.mediapp.domain.User;
import com.mholmes.mediapp.service.ClinicService;
import com.mholmes.mediapp.service.UserService;

@Controller
@RequestMapping("/clinicsPanel")
public class ClinicsPanelController {

	private static UserService userService;
	private static ClinicService clinicService;
	private static ApplicationContext services = new ClassPathXmlApplicationContext("dataAccess.xml");
	
	
	@RequestMapping(value = "/clinicsPanel", method = RequestMethod.GET)
	public ModelAndView clinicsPanel(ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("Clinic", new Clinic());
		
		return new ModelAndView("clinicsPanel", map);
	}
	
	
	@RequestMapping(value = "/addClinic", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("Clinic") @Valid Clinic clinic, BindingResult result, ModelMap model) {
			
		ModelMap map = new ModelMap();
		
		if(result.hasErrors()) {
			map.addAttribute("Clinic", new Clinic());
			return new ModelAndView("clinicsPanel", map);
		}
	
		clinicService = (ClinicService)services.getBean("ClinicService");
		clinicService.createClinic(clinic.getCountry(), clinic.getProvince(), clinic.getTown(), 
				clinic.getName(), clinic.getAddress(), clinic.getPhone(), clinic.getEmail());

		Clinic c = clinicService.getClinic(0, clinic.getName());
		map.addAttribute("clinic", c);
		
		return new ModelAndView("clinic", map);
	}
	
	
	@RequestMapping(value = "/clinicSearchResults", method = RequestMethod.POST)
	public ModelAndView clinicSearchResultsRs(@ModelAttribute Clinic clinic, ModelMap model) {
		
		System.out.println("HELLO " + clinic.getName());
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		map.addAttribute("Clinic", new Clinic());
		
		try  
		  {  
		    Integer.parseInt(clinic.getId());  
		  }  
		  catch(NumberFormatException nfe)  
		  {  
		    clinic.setId("0");  
		  } 
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		List<Clinic> clinics = clinicService.searchClinics(Integer.parseInt(clinic.getId()), clinic.getName(), clinic.getEmail()); 

		model.addAttribute("clinics", clinics);
		
		return new ModelAndView("listClinics", map);
	}
	
	
	@RequestMapping(value = "/showAllClinics", method = RequestMethod.POST)
	public ModelAndView showAllClinics(@ModelAttribute Clinic clinic, ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		map.addAttribute("Clinic", new Clinic());
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		List<Clinic> clinics = clinicService.listClinics(); 

		model.addAttribute("clinics", clinics);
		
		return new ModelAndView("listClinics", map);
	}
	
	
	@RequestMapping(value = "/showClinic/{clinic.id}", method = RequestMethod.GET)
	public ModelAndView showClinic(@PathVariable("clinic.id") int id, ModelMap model) {
		
		ModelMap map = new ModelMap();
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		Clinic clinic = clinicService.getClinic(id, "");
		
		model.addAttribute("clinic", clinic);
		
		return new ModelAndView("clinic", map);
	}
	
	
	@RequestMapping(value = "/removeClinic/{clinic.id}", method = RequestMethod.POST)
	public ModelAndView removeClinic(@PathVariable("clinic.id") int id, @ModelAttribute Clinic clinic, ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("Clinic", new Clinic());
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		clinicService.removeClinic(id);
		
		return new ModelAndView("clinicsPanel", map);
	}
	
	@RequestMapping(value = "/countries", method = RequestMethod.GET)
	public @ResponseBody List<String> getCountries(){
		System.out.println("hit controller - countries");
		
		List<String> countries = new ArrayList<String>();
		countries.add("Ireland");
		countries.add("England");
		countries.add("France");
		
		return countries;
	}
	
	@RequestMapping(value = "/pdata/{country}", method = RequestMethod.GET)
	public @ResponseBody List<String> getProvinces(@PathVariable String country){
		System.out.println("hit controller");
		System.out.println("has country " + country);
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		List<String> provinces = clinicService.getProvinces(country);

		return provinces;
	}
	@RequestMapping(value = "/tdata/{province}", method = RequestMethod.GET)
	public @ResponseBody List<String> getTowns(@PathVariable String province){
		System.out.println("hit controller");
		System.out.println("has country " + province);
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		List<String> towns = clinicService.getTowns(province);
		
		return towns;
	}
	@RequestMapping(value = "/ndata/{town}", method = RequestMethod.GET)
	public @ResponseBody List<String> getNames(@PathVariable String town){
		System.out.println("hit controller");
		System.out.println("has country " + town);
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		List<Clinic> clinics = clinicService.getNames(town);
		
		List<String> names = new ArrayList<String>();
		for(int i=0; i<clinics.size(); i++) {
			Clinic clinic = clinics.get(i);
			names.add(clinic.getName());
		}		
		return names;
	}
	
}
