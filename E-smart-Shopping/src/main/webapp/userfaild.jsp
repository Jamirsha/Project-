<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login Status</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"> <!-- Font Awesome for icons -->
<style >

body {
    font-family: Arial, sans-serif;
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background color */
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-size: cover;
    background-position: center;
}

.container {
    background-color: rgba(255, 255, 255, 0.9);
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    text-align: center;
    max-width: 400px;
    width: 90%;
    opacity: 0; /* Initially hidden */
    animation: fadeIn 0.5s ease forwards; /* Animation to fade in */
}

@keyframes fadeIn {
    to {
        opacity: 1;
    }
}

h2 {
    color: #333;
}

.message {
    margin-bottom: 20px;
}

.login-link {
    margin-top: 10px;
}

.login-link a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
}

.login-link a:hover {
    background-color: #0056b3;
}

</style>
</head>
<body style="background-image: url('https://source.unsplash.com/random/1600x900');"> <!-- Online image URL -->
    <div class="container text-center">
        <h2>User Login Status</h2>
        <div class="message">
            <p>You are not logged in.</p>
            <p>Please log in to access this page.</p>
        </div>
        <div class="login-link">
            <a href="loging.jsp" class="btn btn-primary"><i class="fas fa-sign-in-alt mr-2"></i>Login</a> <!-- Font Awesome icon -->
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
