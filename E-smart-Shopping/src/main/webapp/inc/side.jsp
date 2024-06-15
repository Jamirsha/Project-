 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Advanced Bootstrap Sidebar Example</title>
 
 <style >
 
/* Sidebar */
#sidebar {
    position: fixed;
    top: 10;
    left: 0;
    height: 100%;
    width: 105px;
    background: #343a40;
    color: #fff;
    transition: all 0.3s;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #495057;
}

#sidebar ul.components {
    padding: 20px 0;
}

#sidebar ul p {
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px 15px;
    display: block;
    color: #fff;
}

#sidebar ul li a:hover {
    background-color: #495057;
}

#sidebar ul li.active > a {
    background-color: #495057;
}

/* Main Content */
#content {
    margin-left: 21px;
    padding: 10px;
    transition: margin-left 0.3s;
}

/* Toggle Button */
#sidebarCollapse {
    position: fixed;
    top: 10px;
    left: 10px;
    z-index: 9999;
    display: block;
    background: #343a40;
    color: #fff;
    border: none;
}

 </style>
 </head>
<body>

<div class="wrapper">
    <!-- Sidebar -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Shop</h3>
        </div>

        <ul class="list-unstyled components">
            <li class="active">
                <a href="index.jsp"><i class="fas fa-home"></i>
                </a>
            </li>
            <li>
                <a href="Cart.jsp"><i class="fas fa-shopping-cart"></i>
                </a>
            </li>
            <li>
                <a href="#services"><i class="fas fa-support"></i>
                </i>
                </a>
            </li>
            <li>
                <a href="#contact"><i class="fas fa-phone"></i>
                </a>
            </li>
        </ul>
    </nav>

    <!-- Page Content -->
    <div id="content">
        <button type="button" id="sidebarCollapse" class="btn btn-info">
            <i class="fas fa-align-left"></i>
         </button>
     </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script>
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
            $('#content').toggleClass('active');
        });
    });
</script>
</body>
</html>
 