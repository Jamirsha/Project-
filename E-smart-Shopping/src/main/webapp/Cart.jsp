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

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
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
   
 /* Cart Summary Card */
.cart-summary {
    background-color: #f8f9fa;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    padding: 15px;
}

.cart-summary h5 {
    margin-bottom: 10px;
    color: #343a40;
}

.cart-summary p {
    margin-bottom: 5px;
    font-size: 16px;
}

.cart-summary .btn-checkout {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    margin-top: 10px;
}

.cart-summary .btn-checkout:hover {
    background-color: #0056b3;
}

/* Cart Items Table */
.cart-table {
    margin-top: 20px;
}

.cart-table th {
    background-color: #007bff;
    color: #fff;
}

.cart-table th,
.cart-table td {
    vertical-align: middle !important;
}

.cart-table .btn {
    padding: 5px 10px;
    font-size: 14px;
}

.cart-table .btn-remove {
    background-color: #dc3545;
    border-color: #dc3545;
}

.cart-table .btn-remove:hover {
    background-color: #c82333;
    border-color: #bd2130;
}
 
   </style>
</head>
<body>


	<%@include file="/inc/navbar.jsp"%>
 

	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="d-flex py-3">
					<h3>Total Price: $ ${total}</h3>
					<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out <i class="fas fa-shopping-cart"></i>
					</a>
				</div>

				<table class="table">
					<thead>
						<tr>
							<th>Name</th>
							<th>Category</th>
							<th>Price</th>
							<th>Buy Now</th>
							<th>Cancel</th>
							<th></th>
							<!-- Empty column for Buy Now button -->
						</tr>
					</thead>
					<%
					if (cart_list != null) {
						for (Cart c : cartProduct) {
					%>

					<tbody id="cart-items">
						<tr>
							<td><%=c.getName()%></td>
							<td><%=c.getCategory()%></td>
							<td><%=c.getPrice()%></td>
							<td>

 <form action="order-now" method="get" class="form-inline">
    <input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
    <div class="form-group d-flex justify-content-between w-50">
        <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">
            <i class="fas fa-plus-square"></i>
        </a>
        <input type="text" name="quantity" class="form-control w-50" value="<%=c.getQuantity()%>" readonly>
        
    </div>
    <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">
            <i class="fas fa-minus-square"></i>
        </a>
    <button type="submit" class="btn btn-primary btn-sm ml-5">Buy</button>
</form>
 
<td>
    <a href="remove-from-cart?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Remove</a>
</td>
 
								 
						</tr>

						<%
						}
						}
						%>

					</tbody>
				</table>
			</div>

		</div>

		<div class="col-md-4">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Cart Summary</h5>
					<p class="card-text">
						Total items: <span>${cart_list.size()}</span>
					</p>
					<p class="card-text">
						Total price: $ ${total}</span>
					</p>
					<button class="btn btn-primary btn-block" id="checkout-btn"href="cart-check-out">
 										<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out <i class="fas fa-shopping-cart"></i>
 										</a>
 					
					</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/inc/footer.jsp"%>

	<script>
		
	</script>
</body>
</html>