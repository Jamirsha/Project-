package com.nt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.nt.Db.UserDao;
import com.nt.dao.DbCon;
import com.nt.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user-login")
public class Loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("loging.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Here, you should validate the username and password
        // If valid, you can redirect the user to a welcome page
        // If invalid, you can redirect them back to the login page with an error message
        // For simplicity, let's just print the username and password for now
        try (PrintWriter out = response.getWriter()) {
            

        	String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");
           
            try {
				UserDao udao=new UserDao(DbCon.getConnection());
				User user =udao.userLogin(email, password);
				
				if(user !=null)
				{
					out.print("user-login");
					
					
					request.getSession().setAttribute("auth",user);
					
					response.sendRedirect("index.jsp");
					
				}
				else
				{
					response.sendRedirect("userfaild.jsp");

				}
				
			} catch (ClassNotFoundException | SQLException e) {
 
				e.printStackTrace();
			}
            
             
            
            
        }
    }
}
