<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login | Foodie App</title>
  <link rel="stylesheet" href="Login.css">
    	 <link rel="icon" href="Images/Logo Icon.png">
  
</head>
<body>
  <div class="login-box">
    <h2>Welcome Back, Foodie!</h2>
    <form action="LoginValidationServlet" method="post">
      <div class="form-group">
        <label for="email">Email</label>
        <input type="text" id="email" name="email" placeholder="e.g. user@example.com" required />
      </div>
      <div class="form-group" >
        <label for="password">Enter Password</label>
        <input type="password" id="password" name="password" placeholder="••••••••" required />
      </div>
      <button class="login-btn" type="submit">Login</button>
    </form>
    <div class="footer-links">
      <p>New here? <a href="registration.html">Create an account</a></p>
    </div>
  </div>

</body>
</html>
