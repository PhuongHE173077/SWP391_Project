<%-- 
    Document   : AllCourses
    Created on : May 21, 2024, 6:09:09 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Time Table</title>

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
            function change() {
                document.getElementById("f2").submit();
            }
            function changess() {
                document.getElementById("f3").submit();
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

                        <c:set value="${sessionScope.mentee}" var="c"/>
                        <c:choose>
                            <c:when test="${empty c}">
                                <li><a href="login" style="font-size: 16px;"><i class="fa fa-user-o"> Login</i></a></li>
                                <li><i style="font-size: 16px;" class="fa "> / </i></li>
                                <li><a href="login.jsp" style="font-size: 16px;"><i class="fa "> Sing up </i></a></li>
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
                <!-- container -->
                <div class="container">
                    <!-- row -->
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
                                <form>
                                    <select class="input-select">
                                        <option value="0">Course Name</option>
                                        <option value="1">Mentor Name</option>

                                    </select>
                                    <input class="input" placeholder="Search here">
                                    <button class="search-btn">Search</button>
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
                                    <c:if test="${cnt > 0}">
                                        <div class="cart-dropdown">
                                            <div class="cart-list">
                                                <div class="product-widget">
                                                    <c:forEach items="${requestScope.reList}" var="re">
                                                        <div class="product-img">
                                                            <img src="${re.skill.images}" alt="">
                                                        </div>
                                                        <div class="product-body">
                                                            <h3 class="product-name"><a href="#">${re.skill.skill}</a></h3>
                                                            <h4 class="product-price">
                                                                <span class="qty">${re.status} </span>
                                                            </h4>
                                                        </div>
                                                    </c:forEach>


                                                </div>


                                            </div>
                                            <div class="cart-summary">
                                                <small>${cnt} Item(s) selected</small>
                                            </div>
                                            <div class="cart-summary">

                                                <a href="ViewRequest">View Request  <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                    </c:if>

                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->
        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li class="active"><a href="home">Home</a></li>
                        <li><a href="Course?cid=0">All course</a></li>
                         <li><a href="AllMentor">All Mentor</a></li>   
                         <li><a href="Course?cid=0">Blogs</a></li>

                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->
        <!-- BREADCRUMB -->
        <!--        <div id="breadcrumb" class="section">
                     container 
                    <div class="container">
                         row 
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="breadcrumb-tree">
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">All Categories</a></li>
                                    <li><a href="#">Accessories</a></li>
                                    <li class="active">Headphones (227,490 Results)</li>
                                </ul>
                            </div>
                        </div>
                         /row 
                    </div>
                     /container 
                </div>
                 /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-12">
                        <!-- store top filter -->
                       
                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="row">
                            <!-- product -->
                            <div class="container mt-5">
                                        <h2 class="mb-4">Schedule Table</h2>
                                        <form id="f3" action="TimeTableOfMentee"/>
                                        <select class="form-select form-select-lg mb-3" aria-label="Large select example" name="key" onchange="changess()">
                                            <c:forEach items="${requestScope.listw}" var="lw">
                                                <option value="${lw.id}">${lw.startDay} to ${lw.endDay}</option>
                                            </c:forEach>
                                        </select>
                                        </form>

                                       
                                            <table class="table table-bordered schedule-table">
                                                <thead>
                                                    <tr style="background-color: #6B90DA">
                                                        <th>WEEKDAY</th>
                                                        <th>MON</th>
                                                        <th>TUES</th>
                                                        <th>WEND</th>
                                                        <th>THUS</th>
                                                        <th>FRI</th>
                                                        <th>SAT</th>
                                                        <th>SUN</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${timeSlots}" var="slot">
                                                        <tr>
                                                            <td>${slot.name}</td>
                                                            <c:forEach items="${dates}" var="date">
                                                                <c:set var="hasSchedule" value="false" />
                                                                <c:forEach items="${requestScope.listsch}" var="lch">
                                                                    <c:if test="${lch.scd.day == date && slot.id == lch.scd.timeslot.id}">
                                                                        <c:set var="hasSchedule" value="true" />
                                                                        <td><p style="color: blueviolet">${lch.rq.skill.skill}</p>
                                                                            <p style="color: black">${lch.rq.mentor.name}</p>
                                                                            <c:if test="${lch.status == null}">
                                                                                <p style="color: red">(Not yet)</p>
                                                                            </c:if>
                                                                            <c:if test="${lch.status == 'Attend'}">
                                                                                <div style="display: flex">
                                                                                    <p style="color: green">(Attend)</p>
                                                                                    <a href="url"><button>Report</button></a>
                                                                                </div>
                                                                                
                                                                                
                                                                            </c:if>
                                                                                <c:if test="${lch.status == 'Absent'}">
                                                                                <div style="display: flex">
                                                                                    <p style="color: red">(Absent)</p>
                                                                                    <a href="url"><button>Report</button></a>
                                                                                </div>
                                                                            </c:if>
                                                                            
                                                                        </td>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${not hasSchedule}">
                                                                    <td>
                                                                       -
                                                                    </td>
                                                                </c:if>
                                                            </c:forEach>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                    </div>
                        </div>
                        <!-- /store products -->

                        
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
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
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
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
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
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

