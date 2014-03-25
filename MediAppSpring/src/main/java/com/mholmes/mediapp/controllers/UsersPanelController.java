package com.mholmes.mediapp.controllers;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mholmes.mediapp.domain.Clinic;
import com.mholmes.mediapp.domain.User;
import com.mholmes.mediapp.service.ClinicService;
import com.mholmes.mediapp.service.UserService;

@Controller
@RequestMapping("/usersPanel")
public class UsersPanelController {

	private static UserService userService;
	private static ClinicService clinicService;
	private static ApplicationContext services = new ClassPathXmlApplicationContext("dataAccess.xml");
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/usersPanel", method = RequestMethod.GET)
	public ModelAndView usersPanel(ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		
		return new ModelAndView("usersPanel", map);
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/userSearchResults", method = RequestMethod.POST)
	public ModelAndView searchResultsRs(@ModelAttribute("User") User user, BindingResult result, ModelMap model) {

		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		map.addAttribute("Clinic", new Clinic());
		
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
		List<User> users = userService.searchUsers(Integer.parseInt(user.getId()), user.getName(), user.getEmail()); 
		
		model.addAttribute("users", users);
		
		return new ModelAndView("listUsers");
	}
	
	@RequestMapping(value = "/showAllUsers", method = RequestMethod.POST)
	public ModelAndView showAllUsers(@ModelAttribute User user, ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		map.addAttribute("Clinic", new Clinic());
		
		userService = (UserService)services.getBean("UserService");
		List<User> users = userService.listUsers(); 

		model.addAttribute("users", users);
		
		return new ModelAndView("listUsers", map);
	}
	
	@RequestMapping(value = "/showUser/{user.id}", method = RequestMethod.GET)
	public ModelAndView showUser(@PathVariable("user.id") int id, @ModelAttribute Clinic clinic, ModelMap model) {
		
		System.out.println("Controller HIT");
		
		ModelMap map = new ModelMap();
		map.addAttribute("Clinic", new Clinic());
		map.addAttribute("User", new User());
		
		userService = (UserService)services.getBean("UserService");
		User user = userService.getUser(id);
		
		clinicService = (ClinicService)services.getBean("ClinicService");
		List<Clinic> clinics = clinicService.getUserClinics(id);

		model.addAttribute("user", user);
		model.addAttribute("clinics", clinics);
		
		return new ModelAndView("user", map);
	}
	
	@RequestMapping(value = "/showUser/{user.id}/addAssociation", method = RequestMethod.GET)
	public ModelAndView addAssociation(@PathVariable("user.id") int id, @ModelAttribute Clinic clinic, ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("Clinic", new Clinic());
		map.addAttribute("User", new User());
		
		userService = (UserService)services.getBean("UserService");
		clinicService = (ClinicService)services.getBean("ClinicService");
		
		Clinic c = clinicService.getClinic(0, clinic.getName()); //Get clinic via the name
		if(userService.checkAssociation(id, Integer.parseInt(c.getId())) == false) {
			userService.addAssociation(id, Integer.parseInt(c.getId())); //Add association between user and clinic
		} else {
			System.out.println("Association already exists");
		}
		List<Clinic> clinics = clinicService.getUserClinics(id); //Get new list of clinics based on user
		User user = userService.getUser(id); //Pass user to new jsp
		
		model.addAttribute("user", user);
		model.addAttribute("clinics", clinics);
		
		return new ModelAndView("user", map);
	}
	
	@RequestMapping(value = "/removeUser/{user.id}", method = RequestMethod.POST)
	public ModelAndView removeUser(@ModelAttribute User user, ModelMap model) {
		
		ModelMap map = new ModelMap();
		map.addAttribute("User", new User());
		
		userService = (UserService)services.getBean("UserService");
		userService.removeUser(Integer.parseInt(user.getId()));
		
		return new ModelAndView("usersPanel", map);
	}
	
}
