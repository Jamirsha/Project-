<%@page import="com.nt.Db.OrderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.nt.model.*"%>
<%@page import="com.nt.dao.DbCon"%>
<%@page import="java.util.*"%>		

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	
    	User auth=(User) request.getSession().getAttribute("auth");
    	List<Order> orders=null;
    if(auth!=null)
    {
    	request.setAttribute("auth",auth);
    	 orders=new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
    }
    else{
		response.sendRedirect("loging.jsp");
	}
    
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
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

</head>
<body>
<%@include file="/inc/navbar.jsp"%>


<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
				<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
				</table>
			</div>


						<td><a class="btn btn-sm btn-primary" href="">Payment</a></td>


<%@include file="/inc/footer.jsp"%>



</body>
</html>