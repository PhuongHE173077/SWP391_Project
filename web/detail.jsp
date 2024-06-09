<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Detail CV</title>
        <style>

            /* Reset CSS */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f9f9f9;
                color: #333;
                margin: 0;
                padding: 0;
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

            /* Detail Container */
            .detail-container {
                width: 80%;
                max-width: 1200px;
                margin: 40px auto;
                border: 1px solid #ddd;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                border-radius: 8px;
                text-align: center;
            }

            .detail-title {
                font-size: 2.5em;
                font-weight: 700;
                margin-bottom: 30px;
                color: #388e3c;
            }

            /* Profile Picture */
            .profile-picture {
                max-width: 150px;
                border-radius: 50%;
                margin-bottom: 20px;
            }

            /* Detail Table */
            .detail-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .detail-table th,
            .detail-table td {
                border: 1px solid #ddd;
                padding: 12px 15px;
                text-align: left;
            }

            .detail-table th {
                background-color: #388e3c;
                color: #fff;
                font-weight: bold;
                width: 30%;
            }

            .detail-table td {
                width: 70%;
            }

            .detail-table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .detail-table tr:hover {
                background-color: #f1f1f1;
            }

            /* Action Buttons */
            .action-buttons {
                margin-top: 30px;
            }

            .action-button {
                background-color: #388e3c;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s ease;
                margin: 0 10px;
            }

            .action-button:hover {
                background-color: #2e7d32;
            }

            .reject-button {
                background-color: #d32f2f;
            }

            .reject-button:hover {
                background-color: #c62828;
            }

            /* Back Button Container */
            .back-button-container {
                display: flex;
                justify-content: center;
                margin-top: 30px;
            }

            .back-button {
                background-color: #388e3c;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s ease;
                margin-left: 665px;
                text-align: center;
                margin-bottom: 20px;
            }

            .back-button:hover {
                background-color: #2e7d32;
            }

            /* Footer Styles */
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

            /* Responsive Styles */
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

        <script>
            function confirmAction(action, mid) {
                let message = action === 'approve' ? 'Do you want to approve?' : 'Do you want to reject?';
                if (confirm(message)) {
                    window.location.href = 'confirmcv?status=' + action + '&mid=' + mid;
                }
            }
        </script>
    </head>
    <body>
        <header class="header">
            <div class="container">
                <img src="./img/logo.png" alt="Logo" class="logo">
                <div class="header-title">Detail CV</div>
            </div>
        </header>

        <div class="detail-container">
            <img src="${cv.img}" alt="Profile Picture" class="profile-picture">
            <table class="detail-table">
                <tr>
                    <th>ID</th>
                    <td>${cv.id}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${cv.fullName}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${cv.email}</td>
                </tr>
                <tr>
                    <th>Work Experience</th>
                    <td>${cv.wordexpereice}</td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td>${cv.dob}</td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>${cv.gender == 1 ? 'Male' : cv.gender == 2 ? 'Female' : ''}</td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>${cv.phone}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>${cv.address}</td>
                </tr>
                <tr>
                    <th>Education</th>
                    <td>${cv.education}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>${cv.status}</td>
                </tr>
            </table>
            <div class="action-buttons">
                <button class="action-button approve-button" onclick="confirmAction('approve', '${mid}')">Approve</button>
                <button class="action-button reject-button" onclick="confirmAction('reject', '${mid}')">Reject</button>
            </div>
        </div>

        <button class="back-button" onclick="location.href = 'loadcontroll'">Back to CV Mentor</button>

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

    </body>
</html>
