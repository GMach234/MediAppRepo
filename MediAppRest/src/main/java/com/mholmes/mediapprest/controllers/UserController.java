package com.mholmes.mediapprest.controllers;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mholmes.mediapprest.domain.Clinic;
import com.mholmes.mediapprest.domain.User;
import com.mholmes.mediapprest.service.MobileService;

@Controller
public class UserController {

	public ShaPasswordEncoder sha = new ShaPasswordEncoder(256);
	private static ApplicationContext services = new ClassPathXmlApplicationContext("dataAccess.xml");	
	private static MobileService mobileService = (MobileService)services.getBean("MobileService");
	
	//Take User Email and Password Path Variables and verify then against the database, return User if details are valid.
	@RequestMapping(value = "/login/{userEmail}/{userPassword}", method = RequestMethod.GET)
	@ResponseBody
	public User login(@PathVariable("userEmail") String email, @PathVariable("userPassword") String password) {
				 
		//Hash password with email value and user to Verify on DB
		String hash = sha.encodePassword(password, email);
		
		if((mobileService.verifyUser(email, hash)) == true) {
			return mobileService.getUser(0, email);
		}

		return new User();
	}
	
	//Take User ID Path Variable and return a list of Clinic Objects, based on users associations, from the DB as JSON
	@RequestMapping(value = "/getClinics/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Clinic> getClinics(@PathVariable("userId") int id) {
				 
		List<Clinic> clinics = mobileService.getClinics(id);
		return clinics;
	}
	
}
