<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Confirm CV</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .schedule-container {
            width: 80%;
            max-width: 1200px;
            margin: 40px auto;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
        }
        .schedule-title {
            font-size: 2.5em;
            font-weight: 700;
            margin-bottom: 30px;
            color: #66bb6a;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
            vertical-align: middle;
        }
        th {
            background-color: #66bb6a;
            color: #fff;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .see-detail-button, .back-button {
            background-color: #66bb6a;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-bottom: 30px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .see-detail-button:hover, .back-button:hover {
            background-color: #3700b3;
        }
        .back-button {
            margin-top: 20px;
            display: block;
            width: 200px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        /* Header Styles */
        .header {
            background: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .header .container {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .header .logo {
            max-height: 50px;
            margin-right: 20px;
        }

        .header-title {
            font-size: 1.8em;
            font-weight: bold;
        }

        /* General footer styles */
        #footer {
            background: #000;
            color: #fff;
            padding: 20px 0;
            padding-top: 20px;
            font-size: 14px;
            text-align: center;
        }

        .top-footer {
            padding-bottom: 20px;
        }

        .footer-logo h1 {
            font-size: 2em;
            color: #fff;
            margin: 0;
            font-weight: bold;
        }

        .footer-menu,
        .social-links {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .footer-menu li,
        .social-links li {
            display: inline-block;
        }

        .footer-menu a,
        .social-links a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-menu a:hover,
        .social-links a:hover {
            color: #a5d6a7;
        }

        .social-links a {
            font-size: 1.5em;
        }

        .bottom-footer {
            border-top: 1px solid #333;
            padding-top: 10px;
            margin-top: 20px;
        }

        .bottom-footer p {
            margin: 0;
            color: #bbb;
            font-size: 0.9em;
        }

        .bottom-footer a {
            color: #a5d6a7;
            text-decoration: none;
        }

        .bottom-footer a:hover {
            color: #66bb6a;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .footer-menu,
            .social-links {
                flex-direction: column;
            }

            .footer-menu li,
            .social-links li {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
<header class="header">
    <div class="container">
        <img src="./img/logo.png" alt="Logo" class="logo">
        <div class="header-title">Confirm CV of Mentor</div>
    </div>
</header>

<!-- Your main content here -->
<div class="schedule-container">
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${listS}">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.email}</td>
                    <td>${item.phone}</td>
                    <td><button class="see-detail-button" onclick="location.href = 'detailcontroller?id=${item.id}'">See Details</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<button class="back-button" onclick="location.href = 'index.jsp'">Back to Home</button>

<!-- Your footer content here -->

<footer id="footer">
    <div class="top-footer">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="footer-logo">
                        <h1>SWP391 - Group 6</h1>
                    </div>
                </div>
                <div class="col">
                    <ul class="footer-menu">
                        <li><a href="#">HOME</a></li>
                        <li><a href="#">ABOUT</a></li>
                        <li><a href="#">CATEGORIES</a></li>
                        <li><a href="#">SERVICE</a></li>
                        <li><a href="#">CONTACT</a></li>
                    </ul>
                </div>
                    <div class="col">
                        <ul class="social-links">
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-footer">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p>
                           Happy Programming
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Load FontAwesome for social media icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
