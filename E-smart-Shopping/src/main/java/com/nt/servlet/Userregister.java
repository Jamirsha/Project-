package com.nt.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.nt.Db.RegisterDao;
import com.nt.dao.DbCon;
import com.nt.model.Register;

/**
 * Servlet implementation class Userregister
 */
@WebServlet("/userregister")
public class Userregister extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract registration data from request parameters
        try {
			String email = request.getParameter("userregister-email");
			String password = request.getParameter("userregister-password");
			String mobnumber = request.getParameter("userregister-mobnumber");

			// Create a new Register object
			Register register = new Register();
			register.setEmail(email);
			register.setPassword(password);
			register.setMobnumber(mobnumber);

			// Create a RegisterDao object
			RegisterDao registerDao = new RegisterDao(DbCon.getConnection());

			// Call the RegisterUser method from RegisterDao to save the registration details
			boolean registered = registerDao.RegisterUser(register);

			if (registered) {
			    // Redirect to a success page
			    response.sendRedirect("loging.jsp");
			} else {
			    // Redirect to an error page or display an error message
			    response.sendRedirect("error.jsp");
			    // Alternatively, you can forward to an error page like this:
			    // request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
