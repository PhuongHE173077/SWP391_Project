<%-- 
    Document   : AllCourses
    Created on : May 21, 2024, 6:09:09 PM
    Author     : Dell
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Happy Programming</title>
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
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        /* Custom styles */
        .header-links form#f2 {
            display: inline-block;
            margin-right: 15px;
        }

        .header-links form#f2 select {
            font-size: 12px;
            padding: 5px;
            border: none;
            background-color: transparent;
            color: #FFF;
        }

        .header-links form#f2 select option {
            background-color: #333;
            color: #FFF;
        }

        .header-links form#f2 select:hover {
            cursor: pointer;
        }

        .header-links form#f2 select:focus {
            outline: none;
        }

        .header-links form#f2 i {
            color: #D10024;
            margin-right: 5px;
        }

        .aside .category a {
            border: 1px;
            padding: 10px;
        }

        .col-md-3 .aside a {
            display: block;
            border: 1px solid #000;
            padding: 10px;
            margin-bottom: 10px;
            text-decoration: none;
            color: #000;
        }

        .col-md-3 .aside a.active {
            text-decoration: underline;
            text-decoration-color: red;
            text-decoration-thickness: 3px;
            margin-top: 2px;
        }
    </style>
    <script type="text/javascript">
        // JavaScript function for form submission
        function change() {
            document.getElementById("f2").submit();
        }
    </script>
</head>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> 012346789</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> phuongddhe173077@fpt.edu.vn</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> FPT University</a></li>
            </ul>
            <ul class="header-links pull-right">
                <!-- Check sessionScope.mentee -->
                <c:set value="${sessionScope.mentee}" var="c"/>
                <c:choose>
                    <c:when test="${empty c}">
                        <li><a href="login" style="font-size: 16px;"><i class="fa fa-user-o"></i> Login</a></li>
                        <li><i style="font-size: 16px;" class="fa "> / </i></li>
                        <li><a href="login.jsp" style="font-size: 16px;"><i class="fa fa-user-o"></i> Sign up</a></li>
                    </c:when>
                    <c:otherwise>
                        <form id="f2" action="directional">
                            <li><i class="fa fa-user-o"></i></li>
                            <select name="key" onchange="change()">
                                <option value="0">${c.name}</option>
                                <option value="1">My Profile</option>
                                <option value="2">Change Password</option>
                                <option value="3">Logout</option>
                            </select>
                        </form>
                        <li><a href="#"><i class="fa fa-dollar"></i> USD: ${c.balance} $</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <div class="container">
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="home" class="logo">
                            <img src="./img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form action="${pageContext.request.contextPath}ViewMentor" method="get">
                            <select class="input-select" name="searchType">
                                <option value="course">Course Name</option>
                                <option value="mentor">Mentor Name</option>
                            </select>
                            <input class="input" type="text" name="searchTerm" placeholder="Search here">
                            <button type="submit" class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="#">
                                <i class="fa fa-heart-o"></i>
                                <span>Your Wishlist</span>
                                <div class="qty">2</div>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-vcard"></i>
                                <span>Your Request</span>
                                <div class="qty">${cnt}</div>
                            </a>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toggle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toggle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
        </div>
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
    <div class="container">
        <div id="responsive-nav">
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="home">Home</a></li>
                <li><a href="Course?cid=0">All course</a></li>
                <li><a href="AllMentor">All Mentor</a></li>
                <li><a href="Course?cid=0">Blogs</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- /NAVIGATION -->

<!-- MAIN CONTENT -->
<div id="main-content">
    <div class="section">
        <div class="container">
            <div class="row">
                <!-- MENTOR LIST -->
                <c:choose>
                    <c:when test="${not empty listM}">
                        <c:forEach var="mentor" items="${listM}">
                            <div class="col-md-4 col-sm-6">
                                <div class="product">
                                    <div class="product-img">
                                        <img src="${mentor.picture}" alt="Mentor Image" style="width: 100%; height: auto;">
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="MentorDetail?id=${mentor.id}">${mentor.name}</a></h3>
                                        <p class="product-category">${mentor.category}</p>
                                        <h4 class="product-price">${mentor.price}</h4>
                                        <p class="product-description">${mentor.description}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-md-12">
                            <h3>No mentors found.</h3>
                        </div>
                    </c:otherwise>
                </c:choose>
                <!-- /MENTOR LIST -->
            </div>
            <!-- Pagination -->
            <div class="store-filter clearfix">
                <span class="store-qty">${fn:length(listM)} results</span>
                <ul class="store-pagination">
                    <li class="active">1</li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                </ul>
            </div>
            <!-- /Pagination -->
        </div>
    </div>
</div>
<!-- /MAIN CONTENT -->


<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                    <form>
                        <input class="input" type="email" placeholder="Enter Your Email">
                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                    </form>
                    <ul class="newsletter-follow">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /NEWSLETTER -->

<!-- FOOTER -->
<footer id="footer">
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="bottom-footer" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <p>
                        <!-- Template by Colorlib (CC BY 3.0) -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                        All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
