package com.mypackage.preslav;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mholmes.mediapp.domain.User;
import com.mholmes.mediapp.service.UserService;

public class tesamin {

	private static UserService userService;
	
	private static ApplicationContext services =
	         new ClassPathXmlApplicationContext("dataAccess.xml");
	
	public static void main(String[] args) {
		
		
		
		userService =  (UserService)services.getBean("UserService");
		User newUser = new User("123","GP","123",123,"123","123");
		userService.create(newUser);
		
	}

}
