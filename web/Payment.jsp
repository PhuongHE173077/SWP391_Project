<%-- 
    Document   : Payment
    Created on : Jun 9, 2024, 2:21:45 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entity.Request" %>
<%@ page import="entity.Payment" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Happy programming</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style_1.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            h1, h2 {
                color: #D10024;
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #e6e6e6;
            }
        </style>
    </head>
    <body>
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- home button row -->
                <div class="px-xl-3">
                    <button class="btn btn-block btn-secondary">
                        <i class="fa fa-home"></i>
                        <a href="home"style="text-decoration: none; color: black"><span>Home
                            </span></a>
                    </button>
                </div>
                <h1>Payment History</h1>
                <!-- row -->
                <div class="row">
                    <table>
                        <tr>
                            <th>Payment ID</th>
                            <th>Request ID</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                        <%
                            List<Payment> paymentList = (List<Payment>) request.getAttribute("paymentList");
                            if (paymentList != null) {
                                for (Payment payment : paymentList) {
                        %>
                        <tr>
                            <td><%= payment.getId() %></td>
                            <td><%= payment.getRequest_id().getId() %></td>
                            <td><%= payment.getAmount() %></td>
                            <td><%= payment.getDate_payment() %></td>
                            <td><%= payment.getStatus() %></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5">No payments found.</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <!-- SECTION -->
    </body>
</html>
