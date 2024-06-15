package com.nt.model;

 
public class Register {
	
	private  String email;
	private  String password;
	private String mobnumber;
	
	
	
	
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Register(String email, String password, String mobnumber) {
		super();
		this.email = email;
		this.password = password;
		this.mobnumber = mobnumber;
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
	public String getMobnumber() {
		return mobnumber;
	}
	public void setMobnumber(String mobnumber) {
		this.mobnumber = mobnumber;
	}
	@Override
	public String toString() {
		return "Register [email=" + email + ", password=" + password + ", mobnumber=" + mobnumber + "]";
	}
	
	
	
	
	 
	
	
	
	 }
