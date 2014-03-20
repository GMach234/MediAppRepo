package com.mholmes.mediapp.controllers;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
/**
 * Handles and retrieves the login or denied page depending on the URI template
 */
@Controller
@RequestMapping("/auth")
public class LoginLogoutController {
         
 protected static Logger logger = Logger.getLogger("controller");
 

 @RequestMapping(value = "/login", method = RequestMethod.GET)
 public String getLoginPage(@RequestParam(value="error", required=false) boolean error, 
   ModelMap model) {
  logger.debug("Received request to show login page");
 
  if (error == true) {
   // Assign an error message
   model.put("error", "You have entered an invalid username or password!");
  } else {
   model.put("error", "");
  }
   
  return "loginpage";
 }

 @RequestMapping(value = "/failure", method = RequestMethod.GET)
  public String getFailureError(ModelMap model) {
  logger.debug("Received request to show denied page");
   
  model.addAttribute("error", "Invalid Credentials");
  
  return "loginpage";
 }
 @RequestMapping(value = "/denied", method = RequestMethod.GET)
 public String getDeniedError(ModelMap model) {
 logger.debug("Received request to show denied page");
  
 model.addAttribute("error", "Access Denied for User ID");
 
 return "loginpage";
}
 
 @RequestMapping(value = "/logout", method = RequestMethod.GET)
 public String logout() {
	 
  return "loginpage";
 }
}
