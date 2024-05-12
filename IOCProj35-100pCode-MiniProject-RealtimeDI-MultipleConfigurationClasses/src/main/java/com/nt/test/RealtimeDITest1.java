//RealtimeDITest1.java
package com.nt.test;

import java.sql.SQLException;
import java.util.Date;
import java.util.Scanner;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.nt.config.AppConfig;
import com.nt.controller.CustomerOperationController;
import com.nt.model.Customer;

public class RealtimeDITest1 {

	public static void main(String[] args) {
		//read input values from enduser
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter  customer name::");
		String name=sc.next();
		System.out.println("Enter customer  address::");
		String  addrs=sc.next();
		System.out.println("Enter Customer Bill Amount::");
		double billAmt=sc.nextDouble();
		System.out.println("Enter  discount percentage::");
		double discount=sc.nextDouble();
		
		//create Customer class object
		Customer cust=new Customer();
		cust.setCanme(name); cust.setCaddrs(addrs);
		cust.setBillAmount(billAmt); cust.setDiscount(discount);
		
		
		//create IOC container
	try(AnnotationConfigApplicationContext ctx=
				new AnnotationConfigApplicationContext(AppConfig.class);){
		
		//get Cotroller class object from  the IOC container  (dependency lookup)
		CustomerOperationController controller=
				  ctx.getBean("custController",CustomerOperationController.class);
		
		//invoke the b.method
		
			String resultMsg=controller.processCustomer(cust);
			System.out.println(resultMsg);
			
		}//try
		catch(SQLException se) {
			if(se.getErrorCode()==12899)  //SQLError code
			    System.out.println("Problem with colum size");
			else {
				System.out.println("One or another Db problem");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("non Db problem");
		}
		
	   

	}//main

}//class
