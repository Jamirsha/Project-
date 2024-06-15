package com.nt.Db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

 import com.nt.model.Register;

public class RegisterDao {

	
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    
	public RegisterDao(Connection con) {
		super();


	this.con=con;
	}
    
	public boolean RegisterUser(Register register) {
        boolean result = false;
        try {
            query = "insert into register (email, password,mobnumber) values(?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, register.getEmail());
            pst.setString(2, register.getPassword());
            pst.setString(3, register.getMobnumber());
             pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }


}
