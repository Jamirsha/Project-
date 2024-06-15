<%@page import="java.text.DecimalFormat"%>
<%@page import="com.nt.Db.ProductDao"%>
<%@page import="com.nt.model.*"%>
<%@page import="com.nt.dao.DbCon"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

 
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();



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

/* styles.css */

/* Container styles */
.container {
  margin-top: 20px;
  padding: 0 15px;
}

/* Card styles */
.card {
  margin-bottom: 20px;
  border: 1px solid #ddd;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s ease;
  background-color: #fff;
}

.card:hover {
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card-img-top {
  max-width: 100%;
  height: auto;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.card-body {
  padding: 20px;
}

.card-title {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
}

.price {
  color: #28a745;
  font-size: 18px;
  margin-bottom: 5px;
}

.category {
  color: #007bff;
  font-size: 16px;
}

/* Button styles */
.btn {
  margin-top: 10px;
  cursor: pointer;
  text-decoration: none;
  display: inline-block;
  font-weight: bold;
  padding: 10px 20px;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.btn-dark {
  background-color: #343a40;
  color: #fff;
  border: none;
}

.btn-dark:hover {
  background-color: #23272b;
}

.btn-primary {
  background-color: #007bff;
  color: #fff;
  border: none;
}

.btn-primary:hover {
  background-color: #0056b3;
}

/* Navbar styles */
.navbar {
  background-color: #343a40;
  padding: 10px 0;
}

.navbar-brand,
.navbar-nav .nav-link {
  color: #fff;
}

.navbar-brand:hover,
.navbar-nav .nav-link:hover {
  color: #f8f9fa;
}

/* Footer styles */
.footer {
  background-color: #343a40;
  color: #fff;
  padding: 20px 0;
  text-align: center;
}

.footer a {
  color: black;
}

.footer a:hover {
  color: blue;
}

</style>
</head>
<body>
	<%@include file="/inc/navbar.jsp"%>
 	<%@include file="/inc/side.jsp"%>
 

	<div class="container">

		<div class="card-header my-3">All Products</div>
		<div class="row">
		
		<%
		if(!products.isEmpty())
		{for(Product p:products){%>
 <div class="col-md-3 d-flex my-2 ml-5">
    <div class="card w-100" style="width: 18rem;">
        <img src="product-image/<%=p.getImage()%>" class="card-img-top" alt="...">
        <div class="card-body d-flex flex-column">
            <h5 class="card-title"> Product: <%=p.getName() %></h5>
            <h6 class="price">Price: <%=p.getPrice() %></h6>
            <h6 class="category">Category: <%=p.getCategory() %></h6>
            <div class="mt-auto">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a>
     <a href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-primary mt-2">Buy Now</a>
            </div>
        </div>
    </div>
</div>
 

			<%}
		}
		%>



	<%@include file="/inc/footer.jsp"%>

</body>
</html>