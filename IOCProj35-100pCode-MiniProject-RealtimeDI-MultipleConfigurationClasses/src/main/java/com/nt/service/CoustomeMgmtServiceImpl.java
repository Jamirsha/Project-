//CoustomeMgmtServiceImpl.java
package com.nt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nt.dao.ICustomerDAO;
import com.nt.model.Customer;
@Service("custService")
public class CoustomeMgmtServiceImpl implements ICoustomerMgmtService {

	@Autowired
	@Qualifier("db")
private ICustomerDAO custDAO;

	
	@Override
	public String registerCustomer(Customer cust) throws Exception {
		// Calculate discount and final amount
	
		double discountAmount=(cust.getBillAmount()*(cust.getDiscount()/100.0));
		double finalAmount=cust.getBillAmount()-discountAmount;
		cust.setFinalAmount(finalAmount);
		//use DAO
		
		int count= custDAO.insert(cust);
		return count==0?"Coustomer Registration failed ":"Customer Registered having BillAmount        "+cust.getBillAmount()+"Discount Amount"+ discountAmount+" Final Amount "+finalAmount;
	}

}
