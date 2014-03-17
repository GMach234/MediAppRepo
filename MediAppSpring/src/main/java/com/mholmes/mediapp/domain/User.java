package com.mholmes.mediapp.domain;

import java.io.Serializable;

public class User implements Serializable {

	int id = 0;
	String name;
	String type;
	String address;
	String phone;
	String email;
	String password;
	int clinic;
	
	/*public User(String name, String type, String address, int phone, String email, String password) {
		this.name = name; 
		this.type = type;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.password = password;
	}*/

	
	public int getClinic() {
		return clinic;
	}

	public void setClinic(int clinic) {
		this.clinic = clinic;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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
