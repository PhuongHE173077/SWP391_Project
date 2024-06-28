<%-- 
    Document   : index
    Created on : May 21, 2024, 4:09:43 PM
    Author     : TUF F15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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

        </style>
        <script>
                // This script will run when the page loads
                window.onload = function () {
                    // Get the error message from the JSP attribute
                    var erro = '<%= request.getAttribute("tbao") != null ? request.getAttribute("tbao") : "" %>';

                    // Check if there is an error message
                    if (erro.trim() !== "") {
                        // Display the error message
                        alert(erro);
                    }
                }
            </script>
        <script type="text/javascript">
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
                                        <option value="3">Payment history</option>
                                        <option value="4">Logout</option>
                                    </select>
                                </form>
                                <li><a href="wallet"><i class="fa fa-dollar"></i> 
                                         <fmt:formatNumber value="${c.balance}" type="currency"  groupingUsed="true"/> VND</li>
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
                                                <c:forEach items="${requestScope.reList}" var="re">
                                                <div class="product-widget">
                                                    
                                                        <div class="product-img">
                                                            <img src="${re.skill.images}" alt="">
                                                        </div>
                                                        <div class="product-body">
                                                            <h3 class="product-name"><a href="#">${re.skill.skill}</a></h3>
                                                            <h4 class="product-price">
                                                                <span class="qty">${re.status}</span>
                                                            </h4>
                                                        </div>
                                                    


                                                </div>
                                                </c:forEach>

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
                            <c:forEach items="${requestScope.listCs}" var="lsc">
                            <li><a href="Course?cid=${lsc.id}">${lsc.name}</a></li>
                            </c:forEach>


                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/fronEnd.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>FrontEnd<br>Courses</h3>
                                <a href="Course?cid=1" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/backEnd.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>BackEnd<br>Courses</h3>
                                <a href="Course?cid=2" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/devOps.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>DevOps<br>Course</h3>
                                <a href="Course?cid=3" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Popular Skill</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">

                                    <li>   </li>
                                </ul>
                                <a style="text-decoration: none" href="Course?cid=0">Load More</a>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <c:forEach items="${requestScope.listT}" var="listtop">
                                            <!-- product -->
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${listtop.images}" alt="">
                                                    <div class="product-label">
                                                        <span class="new">HOT</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <a href="url"><p class="product-category"> ${listtop.cs.name}</p></a>
                                                    <h3 class="product-name"><a href="ViewMentor?id=${listtop.id}">${listtop.skill}</a></h3><!--view file-->

                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <a href="ViewMentor?id=${listtop.id}" > <button class="add-to-cart-btn"><i class="fa fa-book"></i> View all Mentor</button> </a>

                                                </div>
                                            </div>
                                            <!-- /product -->

                                            <!-- product -->
                                        </c:forEach>


                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->


        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Course</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">

                                    <li>   </li>
                                </ul>
                                <a style="text-decoration: none" href="Course?cid=0">Load More</a>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <c:forEach items="${requestScope.listT}" var="listtop">
                                            <!-- product -->
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${listtop.images}" alt="">
                                                    <div class="product-label">
                                                        <span class="new">HOT</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <a href="url"><p class="product-category"> ${listtop.cs.name}</p></a>
                                                    <h3 class="product-name"><a href="ViewMentor?id=${listtop.id}">${listtop.skill}</a></h3><!--view file-->

                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <a href="ViewMentor?id=${listtop.id}" > <button class="add-to-cart-btn"><i class="fa fa-book"></i> View all Course</button> </a>

                                                </div>
                                            </div>
                                            <!-- /product -->

                                            <!-- product -->
                                        </c:forEach>
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
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
                            <p>Feed back for wed <strong>SWP391_Group6</strong></p>
                            <form>
                                <input class="input" type="text" placeholder="Enter your feedback">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Sent</button>
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
                                <p>Welcome you to Happy programming of SWP391_Group6</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>Fpt university</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>0123456789</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>phuongddhe173077@fpt.edu.vn</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <c:forEach items="${requestScope.listCs}" var="lsc">
                                        <li><a href="Course?cid=${lsc.id}">${lsc.name}</a></li>
                                        </c:forEach>
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
                                    <li><a href="#">View request</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My class</a></li>
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
