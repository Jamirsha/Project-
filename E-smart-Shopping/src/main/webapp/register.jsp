 <%@page import="com.nt.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.nt.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
     <%
    	User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null)
    {
response.sendRedirect("index.jsp");
    }

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
 	 	request.setAttribute("cart_list", cart_list);
}
    %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <%@include file="/inc/head.jsp"%>
    
   <style>
   
   body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    padding: 20px;
}

form {
    max-width: 400px;
    margin: 0 auto;
    background: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

h2 {
    text-align: center;
    color: #333;
}

label {
    display: block;
    margin-bottom: 8px;
}

input[type="text"],
input[type="password"],
input[type="date"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    margin-bottom: 10px;
}

input[type="submit"]:hover {
    background-color: #45a049;
}
   
   
   
   
   
   
   </style>
</head>
<body>
	<%@include file="/inc/navbar.jsp"%>

  	<%@include file="/inc/side.jsp"%>
 
    <h2 >Registration <i class="fas fa-user-plus"></i>
    </h2>
    <form action="userregister" method=post>
        <label for="username">Email Id:</label>
        <input type="text" id="username" name="userregister-email" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="userregister-password" required><br><br>
        
        <label for="mobnumber">Mobile number :</label>
        <input type="text" id="mob" name="userregister-mobnumber" required><br><br>
        
        <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="#" required>
        
        <input type="submit" value="Register">
    </form>
    
    	<%@include file="/inc/footer.jsp"%>
    
</body>
</html>
 