package com.mholmes.mediapp.domain;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class UserSearch {

	@Digits(message="ID field must contain only numbers", fraction = 0, integer = 10)
	int id;
	@NotEmpty(message="Name cannot be blank") @Size(min=1, max=50, message="Name must be between 1-50 characters")
	String name;
	@NotEmpty(message="Email field must not be blank") @Email(message="Invalid email")
	String email;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
