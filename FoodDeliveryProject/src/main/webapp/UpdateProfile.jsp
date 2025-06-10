<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.FoodApp.Model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");

    if (user != null) {
        String username = user.getUsername();
        String email = user.getEmail();
        String password = user.getPassword();
        String address = user.getAddress();
        String phone = user.getPhone();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile | FoodieHub</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
      	 <link rel="icon" href="Images/Logo Icon.png">
    
    <style>
        :root {
            --primary: #FF6B6B;
            --primary-light: #FF8E8E;
            --secondary: #4ECDC4;
            --dark: #292F36;
            --light: #F7FFF7;
            --gray: #6C757D;
            --light-gray: #E9ECEF;
            --lighter-gray: #F8F9FA;
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            --shadow-hover: 0 8px 25px rgba(0, 0, 0, 0.12);
            --radius: 12px;
            --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--lighter-gray);
            color: var(--dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            line-height: 1.6;
        }

        header {
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: white;
            padding: 1.5rem 0;
            box-shadow: var(--shadow);
            position: relative;
            z-index: 10;
        }

        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .header-container h1 {
            font-size: 2rem;
            margin-bottom: 1rem;
            font-weight: 600;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .nav-links {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap;
            justify-content: center;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
            padding: 0.5rem 0;
            position: relative;
        }

        .nav-links a:hover {
            color: #FFE66D;
            transform: translateY(-2px);
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #FFE66D;
            transition: var(--transition);
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .main-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            width: 100%;
        }

        .profile-card {
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 2.5rem;
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
            transition: var(--transition);
            border: 1px solid rgba(0,0,0,0.05);
        }

        .profile-card:hover {
            box-shadow: var(--shadow-hover);
            transform: translateY(-3px);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .profile-header h2 {
            font-size: 1.8rem;
            color: var(--primary);
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .profile-header p {
            color: var(--gray);
            font-size: 0.95rem;
        }

        .user-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            margin: 0 auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2.5rem;
            font-weight: bold;
            box-shadow: var(--shadow);
            transition: var(--transition);
        }

        .user-avatar:hover {
            transform: scale(1.05) rotate(5deg);
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark);
            font-size: 0.95rem;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem 1.2rem;
            border: 1px solid var(--light-gray);
            border-radius: var(--radius);
            font-size: 0.95rem;
            transition: var(--transition);
            background-color: var(--lighter-gray);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.15);
            background-color: white;
        }

        .btn {
            display: inline-block;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 0.9rem 1.8rem;
            border: none;
            border-radius: var(--radius);
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            width: 100%;
            text-align: center;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(78, 205, 196, 0.3);
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--primary-light), var(--primary));
            opacity: 0;
            z-index: -1;
            transition: var(--transition);
        }

        .btn:hover::before {
            opacity: 1;
        }

        .btn i {
            margin-left: 0.5rem;
            transition: var(--transition);
        }

        .btn:hover i {
            transform: translateX(3px);
        }

        footer {
            background: var(--dark);
            color: white;
            text-align: center;
            padding: 1.5rem;
            margin-top: auto;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .profile-card {
                padding: 1.8rem;
            }
            
            .nav-links {
                gap: 1rem;
                font-size: 0.9rem;
            }
            
            .header-container h1 {
                font-size: 1.7rem;
            }
        }

        @media (max-width: 480px) {
            .profile-card {
                padding: 1.5rem;
            }
            
            .user-avatar {
                width: 80px;
                height: 80px;
                font-size: 2rem;
            }
            
            .form-control {
                padding: 0.7rem 1rem;
            }
        }
    </style>
   <script>
function confirmLogout() {
    if (confirm("Are you sure you want to logout?")) {
        window.location.href = "LogoutServlet";
        return true;
    }
    return false;
}
</script>
</head>
<body>
    <header>
        <div class="header-container">
            <h1>Update Your Profile</h1>
            <div class="nav-links">
                <a href="RestaurantServlet"><i class='bx bx-home'></i> Home</a>
                <a href="Cart.jsp"><i class='bx bx-cart'></i> Cart</a>
                <a href="OrderHistory"><i class='bx bx-history'></i> Order History</a>
                <a href="UpdateProfile.jsp"><i class='bx bx-user'></i> Profile</a>
                <a href="LogoutServlet"><i class='bx bx-log-out'></i> Log Out</a>
            </div>
        </div>
    </header>

    <div class="main-container">
        <div class="profile-card">
            <div class="profile-header">
                <div class="user-avatar">
                    <%= username.substring(0, 1).toUpperCase() %>
                </div>
                <h2>Profile Settings</h2>
                <p>Update your personal information below</p>
            </div>
            
            <form action="UpdateProfileServlet" method="post">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= username %>" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" value="<%= password %>" required>
                </div>
                
                <div class="form-group">
                    <label for="address">Delivery Address</label>
                    <input type="text" class="form-control" id="address" name="address" value="<%= address %>" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="<%= phone %>" required>
                </div>
                
                <button type="submit" class="btn">
                    Update Profile <i class='bx bx-edit-alt'></i>
                </button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 FoodieHub. All rights reserved.</p>
    </footer>
</body>
</html>
<%
    } else {
        response.sendRedirect("Login.jsp");
    }
%>