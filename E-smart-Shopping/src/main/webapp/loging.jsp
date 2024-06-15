<%@page import="java.util.List"%>
<%@page import="com.nt.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nt.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>

<%@include file="/inc/head.jsp"%>
<style >
/* Custom styling for the login page */
body {
    background-color:  /* Light background color */
    font-family: Arial, sans-serif; /* Choose a readable font */
}


.card {
    background-color: #ffffff; /* White background */
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1); /* Soft shadow */
    border-radius: 10px; /* Rounded corners */
    width: 400px; /* Set a fixed width */
}

.card-header {
    background-color: #007bff; /* Primary color for header */
    color: #ffffff; /* Text color for header */
    padding: 20px; /* Padding for header */
    border-top-left-radius: 10px; /* Rounded corners for header */
    border-top-right-radius: 10px;
}

.card-body {
    padding: 40px; /* Padding for body */
}

.form-group {
    margin-bottom: 20px; /* Add space between form groups */
}

.form-control {
    border: 1px solid #ced4da; /* Light border */
    border-radius: 5px; /* Rounded corners for input fields */
    padding: 10px; /* Padding for input fields */
}

.form-control:focus {
    border-color: #007bff; /* Border color on focus */
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); /* Soft focus effect */
}

.btn-primary {
    background-color: #007bff; /* Primary color for button */
    border-color: #007bff;
    border-radius: 5px; /* Rounded corners for button */
    padding: 10px 20px; /* Padding for button */
    transition: background-color 0.3s ease, border-color 0.3s ease; /* Smooth transition */
}

.btn-primary:hover {
    background-color: #0056b3; /* Darker color on hover */
    border-color: #0056b3;
}

.text-center {
    text-align: center; /* Center align text */
}

</style>
</head>
<body>


<%@include file="/inc/navbar.jsp"%>


	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login <i class="fas fa-user"></i>
			
			</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email address</label> 
						<input type="email" name="login-email" class="form-control" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label>Password</label> 
						<input type="password" name="login-password" class="form-control" placeholder="**********">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login<i class="fas fa-sign-in-alt"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<%@include file="/inc/footer.jsp"%>


</body>
</html>