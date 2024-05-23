<%-- 
    Document   : RgisterRoles
    Created on : May 22, 2024, 11:39:44 PM
    Author     : TUF F15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body, html {
                height: 100%;
                margin: 0;
                font-family: Arial, sans-serif;
                background: url('img/backgrond.jpg') no-repeat center center fixed;
                background-size: cover;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .container {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background: rgba(255, 255, 255, 0.8);
                padding: 20px;
                border-radius: 10px;
            }

            .role-link {
                display: block;
                width: 200px;
                padding: 15px;
                margin: 10px 0;
                text-align: center;
                text-decoration: none;
                color: #007bff;
                font-size: 20px;
                border: 2px solid #007bff;
                border-radius: 5px;
                background: white;
                transition: background-color 0.3s, color 0.3s;
            }

            .role-link:hover {
                background-color: #007bff;
                color: white;
            }



        </style>
    </head>
    <body>
        <div class="container">
            <a href="register?role=mentee" class="role-link">Mentee</a>
            <a href="register?role=mentor" class="role-link">Mentor</a>
        </div>
    </body>
</html>
