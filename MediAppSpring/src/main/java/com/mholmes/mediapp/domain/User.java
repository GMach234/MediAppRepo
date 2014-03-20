package com.mholmes.mediapp.domain;

import java.io.Serializable;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User implements Serializable {

	@Digits(message="ID field must contain only numbers", fraction = 0, integer = 10)
	String id;
	@NotEmpty(message="Name cannot be blank") @Size(min=1, max=50, message="Name must be between 1-50 characters")
	String name;
	@NotNull(message="A User Type must be selected")
	String type;
	@NotEmpty(message = "Address field must not be blank") @Size(min=1, max=100, message="Address must be between 1-100 characters")
	String address;
	@Digits(message="Phone field must contain a maximum of 20 digits", fraction = 0, integer = 20)
	String phone;
	@NotEmpty(message="Email field must not be blank") @Email(message="Invalid email")
	String email;
	@Size(min=8, max=50, message="Password must be between 8-30 characters")
	String password;
	int clinic;
	
	
	public int getClinic() {
		return clinic;
	}

	public void setClinic(int clinic) {
		this.clinic = clinic;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
