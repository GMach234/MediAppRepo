package com.mholmes.mediapp.controllers;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mholmes.mediapp.domain.User;

@Controller
public class HomeController {
	
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
}
