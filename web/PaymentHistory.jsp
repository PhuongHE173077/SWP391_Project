<%-- 
    Document   : Payment
    Created on : Jun 18, 2024, 11:10:15 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            .pagination {
                display: inline-block;
            }
            .pagination a {
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background-color: orange;
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
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <th>Request Id</th>
                                <th>Amount</th>
                                <th>Detail</th>
                                <th>Payment date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="payment" items="${listP}">
                                <c:if test="${payment.status == 0}">
                                    <tr>
                                        <td style="color: blue">${payment.requestId}</td>
                                        <td style="color: blue">${payment.amount}</td>
                                        <td style="color: blue">${payment.detail}</td>
                                        <td style="color: blue">${payment.paymentDate}</td>
                                        <td style="color: blue">${payment.status}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br />
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <th>Payment Id</th>
                                <th>Amount</th>
                                <th>Detail</th>
                                <th>Payment date</th>
                                <th>Txn Ref</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="payment" items="${listP}">
                                <c:if test="${payment.status != 0}">
                                    <tr>
                                        <td style="color: blue">${payment.id}</td>
                                        <td style="color: blue">${payment.amount}</td>
                                        <td style="color: blue">${payment.detail}</td>
                                        <td style="color: blue">${payment.paymentDate}</td>
                                        <td style="color: blue">${payment.txnRef}</td>
                                        <td style="color: blue">Deposited</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <c:set var="page" value="${requestScope.page}" />
                <div class="pagination">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                        <a class="${i==page?"active":""}" href="payment-history?page=${i}">${i}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- SECTION -->
    </body>
</html>