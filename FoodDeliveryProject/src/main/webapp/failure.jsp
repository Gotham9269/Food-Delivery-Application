<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Failed</title>
      	 <link rel="icon" href="Images/Logo Icon.png">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            text-align: center;
            padding: 50px;
        }
        .container {
            margin: 0 auto;
            max-width: 600px;
            background-color: #f5c6cb;
            border: 1px solid #f5c6cb;
            padding: 20px;
            border-radius: 8px;
        }
        h1 {
            font-size: 2em;
            margin-bottom: 10px;
        }
        p {
            font-size: 1.2em;
            margin-top: 0;
        }
        a {
            color: #721c24;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    
</head>
<body>
    <div class="container">
        <h1>Login Failed</h1>
        <p>Unfortunately, we couldn't log you in with the provided credentials.</p>
        <p>Please double-check your email and password, and try again.</p>
        <a href="Login.jsp">Back to Login</a>
    </div>
</body>
</html>
