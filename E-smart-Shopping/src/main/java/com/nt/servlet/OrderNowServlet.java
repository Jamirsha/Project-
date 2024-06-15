package com.nt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.nt.Db.OrderDao;
import com.nt.dao.DbCon;
import com.nt.model.Cart;
import com.nt.model.Order;
import com.nt.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderNowServlet
 */				
@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            User auth = (User) request.getSession().getAttribute("auth");

            if (auth != null) {
                String productId = request.getParameter("id");
                int productQuantity = Integer.parseInt(request.getParameter("quantity"));
                if (productQuantity <= 0) {
                	productQuantity = 1;
                }
                Order orderModel = new Order();
                orderModel.setId(Integer.parseInt(productId));
                orderModel.setUid(auth.getId());
                orderModel.setQunatity(productQuantity);
                orderModel.setDate(formatter.format(date));
                
                OrderDao ordedao=new OrderDao(DbCon.getConnection());
                
               boolean result= ordedao.insertOrder(orderModel);
               
               if(result)
               {
            	   ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
   				if (cart_list != null) {
   					for (Cart c : cart_list) {
   						if (c.getId() == Integer.parseInt(productId)) {
   							cart_list.remove(cart_list.indexOf(c));
   							break;
   						}
   					}
   				}
            	   response.sendRedirect("orders.jsp");
               }
               else
               {
            	  out.print("order failed"); 
               }
            }
                else {
                	response.sendRedirect("loging.jsp");
                }
            } catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 

	}

	
 	
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	}
}
