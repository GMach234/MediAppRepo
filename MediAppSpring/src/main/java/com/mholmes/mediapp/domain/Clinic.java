package com.mholmes.mediapp.domain;

import java.io.Serializable;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Clinic implements Serializable {

	int id;
	String country;
	String province;
	String town;
	@NotEmpty(message="Name cannot be blank") @Size(min=1, max=50, message="Name must be between 1-50 characters")
	String name;
	@NotEmpty(message = "Address field must not be blank") @Size(min=1, max=100, message="Address must be between 1-100 characters")
	String address;
	@Digits(message="Phone field must contain a maximum of 20 digits", fraction = 0, integer = 20)
	String phone;
	@NotEmpty(message="Email field must not be blank") @Email(message="Invalid email")
	String email;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
