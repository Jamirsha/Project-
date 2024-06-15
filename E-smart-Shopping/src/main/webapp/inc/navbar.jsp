
<head>

<style >
 /* Navbar container */
.navbar {
    padding: 15px 0; /* Adjust top and bottom padding */
}

/* Navbar brand */
.navbar-brand {
    font-size: 24px;
    color: #007bff;
}

/* Navbar links */
.navbar-nav .nav-link {
    padding: 10px 20px;
    color: #555;
    transition: color 0.3s ease;
}

.navbar-nav .nav-link:hover {
    color: #007bff;
    text-decoration: none;
}

/* Active link */
.navbar-nav .nav-item.active .nav-link {
    color: #007bff;
}

/* Toggler button */
.navbar-toggler {
    border: none;
    background-color: transparent;
}

.navbar-toggler-icon {
    background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3e%3cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}

/* Collapsed menu */
.navbar-collapse {
    background-color: #f8f9fa;
    border-top: 1px solid #ddd;
    box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.1);
}

/* Navbar items */
.navbar-nav {
    margin: 0;
}

.navbar-nav .nav-item {
    margin-right: 15px;
}

/* Badge for cart */
.badge-danger {
    background-color: #dc3545;
    color: #fff;
    font-size: 14px;
    padding: 5px 10px;
    border-radius: 50%;
}
 
 
 </style>
</head><nav class="navbar navbar-expand-lg navbar-light bg-light ml-5 custom-navbar">
    <div class="container">
        <a class="navbar-brand ml-5" href="index.jsp">E-smart Shopping</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span></a></li>
                <%
                if (auth != null) {
                %>
                <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
                <%
                } else {
                %>
                <li class="nav-item"><a class="nav-link" href="loging.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                <%
                }
                %>
                
            </ul>
        </div>
    </div>
</nav>
