package com.nt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nt.model.Customer;
import com.nt.service.ICoustomerMgmtService;

@Controller("custController")
public class CustomerOperationController {

	 public CustomerOperationController()
	 {
		 System.out.println("CustomerOperationController -0pram");
	 }
	@Autowired
	private ICoustomerMgmtService custService;
	
	public String processCustomer(Customer customer )throws Exception
	{
		String result=custService.registerCustomer(customer);
		
		return result;
	}
	
}
