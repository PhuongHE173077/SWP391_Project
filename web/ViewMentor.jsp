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

        </style>
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
                                <li><a href="login.jsp" style="font-size: 16px;"><i class="fa fa-user-o"> Login </i></a></li>
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
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div class="qty">3</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/product01.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>

                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/product02.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>
                                        </div>
                                        <div class="cart-summary">
                                            <small>3 Item(s) selected</small>
                                            <h5>SUBTOTAL: $2940.00</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="#">View Cart</a>
                                            <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
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
                <ul class="main-nav nav navbar-nav">
                    <li ><a href="home">Home</a></li>
                        <c:if test="${cid ==0}">
                        <li class="active"><a  href="Course?cid=0">All course</a></li>
                        </c:if>
                        <c:if test="${cid !=0}">
                        <li><a href="Course?cid=0">All course</a></li>
                        </c:if>
                        <c:set value="${requestScope.cid}" var="cid"/>
                        <c:forEach items="${requestScope.listCs}" var="lsc">
                            <c:if test="${lsc.id == cid}">
                            <li class="active"><a  href="Course?cid=${lsc.id}">${lsc.name}</a></li>
                            </c:if>
                            <c:if test="${lsc.id != cid}">
                            <li><a href="Course?cid=${lsc.id}">${lsc.name}</a></li>
                            </c:if>
                        </c:forEach>


                </ul>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <li><a href="home">Home</a></li>
                            <li><a href="#">Course ${skill.skill}</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <c:set value="${requestScope.skill}" var="sk"/>
                        <div class="aside">
                            <h3 class="aside-title">${sk.skill}</h3>
                            
                        </div>
                        
                            <img style="width: 100%; object-fit: cover"src="${sk.images}" alt="alt"/>
                        
                            <h5 class="aside-title"> Descprition course ${sk.skill}</h5>
                            <p class="aside-title">${sk.descpition}
                            </p>
                        
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <label>
                                    Sort By:
                                    <select class="input-select">
                                        <option value="0">Popular</option>
                                        <option value="1">Position</option>
                                    </select>
                                </label>

                                <label>
                                    Show:
                                    <select class="input-select">
                                        <option value="0">20</option>
                                        <option value="1">50</option>
                                    </select>
                                </label>
                            </div>
                            <ul class="store-grid">
                                <li class="active"><i class="fa fa-th"></i></li>
                                <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                            </ul>
                        </div>
                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="row">
                            <!-- product -->



                            <c:forEach items="${requestScope.listM}" var="lm">

                                <div class="col-md-4 col-xs-6">
                                    <div class="product">
                                        <div class="product-img">

                                            <c:if test="${empty lm.picture}">
                                                <img src="data:image/jpeg;base64,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" alt="">
                                            </c:if>
                                            <c:if test="${!empty lm.picture}">
                                                <img  src="${lm.picture}" alt="">
                                            </c:if>


                                            <div class="product-label">
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <c:forEach var="skl" items="${lm.getSkillList()}" varStatus="status">
                                                <span class="product-category">${skl.skill}<c:if test="${!status.last}">/</c:if></span>
                                            </c:forEach>


                                            <h3 class="product-name"><a href="#"> ${lm.name}</a></h3>


                                            <div class="product-btns">
                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                            </div>
                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn"><i class="fa fa-send"></i> create request</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /product -->
                            </c:forEach>


                        </div>
                        <!-- /store products -->

<!--                         store bottom filter 
                        <div class="store-filter clearfix">
                            <span class="store-qty">Showing 20-100 products</span>
                            <ul class="store-pagination">
                                <li class="active">1</li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                         /store bottom filter -->
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

