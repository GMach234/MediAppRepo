package com.mholmes.mediapp.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mholmes.mediapp.dao.impl.UserDAOImpl;
import com.mholmes.mediapp.domain.Clinic;
import com.mholmes.mediapp.domain.User;
import com.mholmes.mediapp.domain.UserSearch;
import com.mholmes.mediapp.service.ClinicService;
import com.mholmes.mediapp.service.UserService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	private static UserService userService;
	private static ClinicService clinicService;
	private static ApplicationContext services =
	         new ClassPathXmlApplicationContext("dataAccess.xml");
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		
		return new ModelAndView("usersPanel", map);
	}
	
	@RequestMapping(value = "/controlPanel", method = RequestMethod.GET)
	public ModelAndView controlPanel(Locale locale, Model model) {	
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		
		return new ModelAndView("usersPanel", map);
	}
	
	@RequestMapping(value = "/usersPanel", method = RequestMethod.GET)
	public ModelAndView usersPanel(ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		
		return new ModelAndView("usersPanel", map);
	}
	
	@RequestMapping(value = "/usersPanel/addUser", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("User") @Valid User user, BindingResult result, ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		
		if(result.hasErrors()) {
			return new ModelAndView("usersPanel", map);
		}
		
		userService = (UserService)services.getBean("UserService");
		userService.createUser(user.getName(), user.getType(), user.getAddress(), user.getPhone(), user.getEmail(), user.getPassword(), 1);
		
		return new ModelAndView("usersPanel", map);
	}
	
	@RequestMapping(value = "/usersPanel/userSearchResults", method = RequestMethod.POST)
	public ModelAndView searchResultsRs(@ModelAttribute("Userh") User user, BindingResult result, ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		
		if(result.hasErrors()) {
			return new ModelAndView("usersPanel", map);
		}
		
		try  
		  {  
		    Integer.parseInt(user.getId());  
		  }  
		  catch(NumberFormatException nfe)  
		  {  
		    user.setId("0");  
		  }   
		
		userService = (UserService)services.getBean("UserService");
		List<User> users = userService.listUsers(Integer.parseInt(user.getId()), user.getName(), user.getEmail()); 
		
		model.addAttribute("users", users);
		
		return new ModelAndView("listUsers");
	}
	
	@RequestMapping(value = "/usersPanel/showUser/{user.id}", method = RequestMethod.GET)
	public ModelAndView showUser(@PathVariable("user.id") int id, ModelMap model) {
		
		userService = (UserService)services.getBean("UserService");
		User user = userService.getUser(id);
		
		model.addAttribute("user", user);
		
		return new ModelAndView("user", "command", new User());
	}
	
	@RequestMapping(value = "/usersPanel/removeUser", method = RequestMethod.POST)
	public ModelAndView removeUser(@ModelAttribute User user, ModelMap model) {
		
		userService = (UserService)services.getBean("UserService");
		userService.removeUser(Integer.parseInt(user.getId()));
		
		return new ModelAndView("usersPanel", "command", new User());
	}
	
	
	@RequestMapping(value = "/clinicsPanel", method = RequestMethod.GET)
	public ModelAndView clinicsPanel() {
		
		return new ModelAndView("clinicsPanel", "command", new Clinic());
	}
	
	@RequestMapping(value = "/clinicsPanel/addClinic", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute Clinic clinic, ModelMap model) {
		
		System.out.println(clinic.getCountry());
		System.out.println(clinic.getProvince());
		System.out.println(clinic.getTown());
		System.out.println(clinic.getName());
		System.out.println(clinic.getAddress());
		System.out.println(clinic.getPhone());
		System.out.println(clinic.getEmail());
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		clinicService.createClinic(clinic.getCountry(), clinic.getProvince(), clinic.getTown(), 
				clinic.getName(), clinic.getAddress(), clinic.getPhone(), clinic.getEmail());

		return new ModelAndView("clinicsPanel", "command", new Clinic());
	}
	
	@RequestMapping(value = "/clinicsPanel/clinicSearchResults", method = RequestMethod.POST)
	public String clinicSearchResultsRs(@ModelAttribute Clinic clinic, ModelMap model) {
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		List<Clinic> clinics = clinicService.listClinics(clinic.getId(), clinic.getName(), clinic.getEmail()); 

		for(int i = 0; i<clinics.size(); i++) {
			System.out.println(clinics.get(i).getId());
			System.out.println(clinics.get(i).getName());
			System.out.println(clinics.get(i).getCountry());
			System.out.println(clinics.get(i).getProvince());
			System.out.println(clinics.get(i).getTown());
			System.out.println(clinics.get(i).getPhone());
			System.out.println(clinics.get(i).getEmail());
		}
		
		model.addAttribute("clinics", clinics);
		
		return "listClinics";
	}
	
	@RequestMapping(value = "/clinicsPanel/showClinic/{clinic.id}", method = RequestMethod.GET)
	public ModelAndView showClinic(@PathVariable("clinic.id") int id, ModelMap model) {
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		Clinic clinic = clinicService.getClinic(id);
		
		model.addAttribute("clinic", clinic);
		
		return new ModelAndView("clinic", "command", new Clinic());
	}
	
	@RequestMapping(value = "/clinicsPanel/removeClinic", method = RequestMethod.POST)
	public ModelAndView removeClinic(@ModelAttribute Clinic clinic, ModelMap model) {
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		clinicService.removeClinic(clinic.getId());
		
		return new ModelAndView("clinicsPanel", "command", new Clinic());
	}
	
}
