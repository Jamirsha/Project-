//CustomerDAOImpl.java (Doa Impl class)
package com.nt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
import com.nt.model.Customer;
@Repository("cusDAO-oracle")
public class CustomerOracaleDAOImpl implements ICustomerDAO {
	public static final String CUSTOMER_INFO_INSERT_QUERY="INSERT INTO SPRING_CUSTOMER_INFO VALUES(CNO_SEQ1.NEXTVAL,?,?,?,?,?)";

	@Autowired
	private DataSource ds;
	 
	
	
	@Override
	public int insert(Customer cust) throws Exception {
		
		int count=0;
 		try(Connection con=ds.getConnection();
 				PreparedStatement ps=con.prepareStatement(CUSTOMER_INFO_INSERT_QUERY)
 						){
 			//set values to query params
 			ps.setString(1, cust.getCanme());
 			ps.setString(2, cust.getCaddrs());
 			ps.setDouble(3, cust.getBillAmount());
 			ps.setDouble(4, cust.getDiscount());
 			ps.setDouble(5, cust.getFinalAmount());
 	 		//execute the SQL Querry
 			count=ps.executeUpdate();
 		
 		}//try
		catch(SQLException se)
 		{
			se.printStackTrace();//exception rethrowing for exception propagation 
			throw se;
  		}
 		catch(Exception e)
 		{
			e.printStackTrace();//exception rethrowing for exception propagation 
			throw e;
  		}
		return count;//method
	}

}
