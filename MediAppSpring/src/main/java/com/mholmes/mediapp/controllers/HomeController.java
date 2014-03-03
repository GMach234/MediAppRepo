package com.mholmes.mediapp.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mholmes.mediapp.dao.impl.UserDAOImpl;
import com.mholmes.mediapp.domain.Clinic;
import com.mholmes.mediapp.domain.User;
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
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/controlPanel", method = RequestMethod.GET)
	public String controlPanel(Locale locale, Model model) {		
		return "controlPanel";
	}
	
	@RequestMapping(value = "/usersPanel", method = RequestMethod.GET)
	public ModelAndView usersPanel() {
		
		return new ModelAndView("usersPanel", "command", new User());
	}
	
	@RequestMapping(value = "/usersPanel/addUser", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute User user, ModelMap model) {
		
		System.out.println(user.getName());
		System.out.println(user.getAddress());
		System.out.println(user.getPhone());
		System.out.println(user.getEmail());
		System.out.println(user.getType());
		System.out.println(user.getPassword());
		
		userService = (UserService)services.getBean("UserService");
		userService.createUser(user.getName(), user.getType(), user.getAddress(), user.getPhone(), user.getEmail(), user.getPassword());
		
		return new ModelAndView("usersPanel", "command", new User());
	}
	
	@RequestMapping(value = "/usersPanel/searchResults", method = RequestMethod.POST)
	public String searchResultsRs(@ModelAttribute User user, ModelMap model) {
		
		userService = (UserService)services.getBean("UserService");
		List<User> users = userService.listUsers(user.getId(), user.getName(), user.getEmail()); 

		for(int i = 0; i<users.size(); i++) {
			System.out.println(users.get(i).getId());
			System.out.println(users.get(i).getName());
			System.out.println(users.get(i).getAddress());
			System.out.println(users.get(i).getPhone());
			System.out.println(users.get(i).getEmail());
			System.out.println(users.get(i).getPassword());
			System.out.println(users.get(i).getType());
		}
		
		model.addAttribute("users", users);
		
		return "listUsers";
	}
	
	@RequestMapping(value = "/usersPanel/showUser/{user.id}", method = RequestMethod.GET)
	public String showUser(@PathVariable("user.id") int id, ModelMap model) {
		
		userService = (UserService)services.getBean("UserService");
		User user = userService.getUser(id);
		
		model.addAttribute("user", user);
		
		return "user";
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
	
}
