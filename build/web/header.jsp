<%-- 
    Document   : index.jsp
    Created on : Jan 11, 2024, 6:33:40 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- Mirrored from mentoring.dreamstechnologies.com/html/template/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 08 Jan 2024 17:29:21 GMT -->
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mentoring</title>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css">

        <!-- Owl Carousel CSS -->
        <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="../assets/css/owl.theme.default.min.css">

        <!-- Aos CSS -->
        <link rel="stylesheet" href="../assets/plugins/aos/aos.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="../assets/css/style.css">

    </head>
    <body>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <header class="header">
                <div class="header-fixed">
                    <nav class="navbar navbar-expand-lg header-nav">
                        <div class="navbar-header">
                            <a id="mobile_btn" href="../javascript:void(0);">
                                <span class="bar-icon">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </span>
                            </a>
                            <a href="/Happy_Programming/home" class="navbar-brand logo">
                                <img src="/Happy_Programming/assets/img/logo.png" class="img-fluid" alt="Logo">
                            </a>
                        </div>
                        <div class="main-menu-wrapper">
                            <div class="menu-header">
                                <a href="../index.html" class="menu-logo">
                                    <img src="/Happy_Programming/assets/img/logo.png" class="img-fluid" alt="Logo">
                                </a>
                                <a id="menu_close" class="menu-close" href="../javascript:void(0);">
                                    <i class="fas fa-times"></i>
                                </a>
                            </div>
                            <ul class="main-nav">
                                <c:set var="users" value="${sessionScope.users}"/>
                                <li class="active has-submenu">
                                    <a href="../index.html">Home <i class="fas fa-chevron-down"></i></a>
                                    <ul class="submenu">
                                        <li class="active"><a href="../home">Home</a></li>
                                        <li><a href="../View/index-two.html">Home 2</a></li>
                                        <li><a href="../View/index-three.html">Home 3</a></li>
                                    </ul>

                                </li>
                                <c:if test="${sessionScope.users == null}">
                                    <li class="active has-submenu">
                                        <a href="../#">Mentor <i class="fas fa-chevron-down"></i></a>
                                    </li>
                                    <li class="active has-submenu">
                                        <a href="../#">Mentee <i class="fas fa-chevron-down"></i></a>
                                    </li>
                                    <li class="active has-submenu">
                                        <a href="../#">Pages <i class="fas fa-chevron-down"></i></a>
                                    </li>
                                    <li class="active has-submenu">
                                        <a href="../#">Blog <i class="fas fa-chevron-down"></i></a>
                                    </li>
                                </c:if>

                                <c:if test="${users.getRole().getId() == 2}">
                                    <li class="has-submenu">
                                        <a href="../#">Mentor <i class="fas fa-chevron-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="../dashboard.html">Mentor Dashboard</a></li>
                                            <li><a href="../bookings.html">Bookings</a></li>
                                            <li><a href="../schedule-timings.html">Schedule Timing</a></li>
                                            <li><a href="../mentee-list.html">Mentee List</a></li>
                                            <li><a href="../profile-mentee.html">Mentee Profile</a></li>
                                            <li class="has-submenu">
                                                <a href="../blog.html">Blog</a>
                                                <ul class="submenu">
                                                    <li><a href="../blog.html">Blog</a></li>
                                                    <li><a href="../blog-details.html">Blog View</a></li>
                                                    <li><a href="../add-blog.html">Add Blog</a></li>
                                                    <li><a href="../edit-blog.html">Edit Blog</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="../chat.html">Chat</a></li>
                                            <li><a href="../invoices.html">Invoices</a></li>
                                            <li><a href="/Happy_Programming/mentor/mentor-profile">Profile Settings</a></li>
                                            <li><a href="../reviews.html">Reviews</a></li>
                                            <li><a href="../mentor-register.html">Mentor Register</a></li>
                                        </ul>
                                    </li>	
                                    <li class="has-submenu">
                                        <a href="../#">Mentee <i class="fas fa-chevron-down"></i></a>
                                        <ul class="submenu">
                                            <li class="has-submenu">
                                                <a href="../#">Mentors</a>
                                                <ul class="submenu">
                                                    <li><a href="../map-grid.html">Map Grid</a></li>
                                                    <li><a href="../map-list.html">Map List</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="../search.html">Search Mentor</a></li>
                                            <li><a href="../profile.html">Mentor Profile</a></li>
                                            <li><a href="../bookings-mentee.html">Bookings</a></li>
                                            <li><a href="../checkout.html">Checkout</a></li>
                                            <li><a href="../booking-success.html">Booking Success</a></li>
                                            <li><a href="../dashboard-mentee.html">Mentee Dashboard</a></li>
                                            <li><a href="../favourites.html">Favourites</a></li>
                                            <li><a href="../chat-mentee.html">Chat</a></li>
                                            <li><a href="">Profile Settings</a></li>
                                            <li><a href="/Happy_Programming/change-password">Change Password</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="../#">Pages <i class="fas fa-chevron-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="../voice-call.html">Voice Call</a></li>
                                            <li><a href="../video-call.html">Video Call</a></li>
                                            <li><a href="../search.html">Search Mentors</a></li>
                                            <li><a href="../components.html">Components</a></li>
                                            <li class="has-submenu">
                                                <a href="../invoices.html">Invoices</a>
                                                <ul class="submenu">
                                                    <li><a href="../invoices.html">Invoices</a></li>
                                                    <li><a href="../invoice-view.html">Invoice View</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="../blank-page.html">Starter Page</a></li>
                                            <li><a href="../signin">Login</a></li>
                                            <li><a href="../register">Register</a></li>
                                            <li><a href="../forgot-password.html">Forgot Password</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="../#">Blog <i class="fas fa-chevron-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="../blog-list.html">Blog List</a></li>
                                            <li><a href="../blog-grid.html">Blog Grid</a></li>
                                            <li><a href="../blog-details.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${users.getRole().getId() == 3}">	
                                    <li class="has-submenu">
                                        <a href="../#">Mentee <i class="fas fa-chevron-down"></i></a>
                                        <ul class="submenu">
                                            <li class="has-submenu">
                                                <a href="../#">Mentors</a>
                                                <ul class="submenu">
                                                    <li><a href="../map-grid.html">Map Grid</a></li>
                                                    <li><a href="../map-list.html">Map List</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="../search.html">Search Mentor</a></li>
                                            <li><a href="../profile.html">Mentor Profile</a></li>
                                            <li><a href="../bookings-mentee.html">Bookings</a></li>
                                            <li><a href="../checkout.html">Checkout</a></li>
                                            <li><a href="../booking-success.html">Booking Success</a></li>
                                            <li><a href="../dashboard-mentee.html">Mentee Dashboard</a></li>
                                            <li><a href="../favourites.html">Favourites</a></li>
                                            <li><a href="../chat-mentee.html">Chat</a></li>
                                            <li><a href="../profile-settings-mentee.html">Profile Settings</a></li>
                                            <li><a href="/Happy_Programming/change-password">Change Password</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="../#">Pages <i class="fas fa-chevron-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="../voice-call.html">Voice Call</a></li>
                                            <li><a href="../video-call.html">Video Call</a></li>
                                            <li><a href="../search.html">Search Mentors</a></li>
                                            <li><a href="../components.html">Components</a></li>
                                            <li class="has-submenu">
                                                <a href="../invoices.html">Invoices</a>
                                                <ul class="submenu">
                                                    <li><a href="../invoices.html">Invoices</a></li>
                                                    <li><a href="../invoice-view.html">Invoice View</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="../blank-page.html">Starter Page</a></li>
                                            <li><a href="../login.html">Login</a></li>
                                            <li><a href="../register.html">Register</a></li>
                                            <li><a href="../forgot-password.html">Forgot Password</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="../#">Blog <i class="fas fa-chevron-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="../blog-list.html">Blog List</a></li>
                                            <li><a href="../blog-grid.html">Blog Grid</a></li>
                                            <li><a href="../blog-details.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                </c:if>

                                <li style="display: ${users.getRole().getId()  == 1 ? 'block' : 'none' };">
                                    <a href="../admin/index.html" target="_blank">Admin</a>
                                </li>    

                                <li class="login-link">
                                    <a href="../signin">Login / Signup</a>
                                </li>
                            </ul>		 
                        </div>		 
                        <ul class="nav header-navbar-rht">
                            <c:if test="${sessionScope.users == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="signin">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link header-login" href="register">Register</a>
                                </li>
                            </c:if>

                            <c:if test="${sessionScope.users != null}">
                                <li class="nav-item dropdown has-arrow logged-item">
                                    <a href="../#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                                        <span class="user-img">
                                            <!--<img class="rounded-circle" src="/Happy_Programming/assets/img/user/user.jpg" width="31" alt="Darren Elder">-->
                                            <img class="rounded-circle" src="${users.getUser().getAvatar()}" width="31" alt="${sessionScope.users.getUser().getFirstname()} ${sessionScope.users.getUser().getLastname()}">
                                        </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end">
                                        <div class="user-header">
                                            <div class="avatar avatar-sm">
                                                <img src="${users.getUser().getAvatar()}" alt="User Image" class="avatar-img rounded-circle">
                                            </div>
                                            <div class="user-text">
                                                <h6>${sessionScope.users.getUser().getFirstname()} ${sessionScope.users.getUser().getLastname()}</h6>
                                                <p class="text-muted mb-0">
                                                    <c:if test="${users.getRole().getId()  == 3}">
                                                        Mentee
                                                    </c:if>
                                                    <c:if test="${users.getRole().getId()  == 2}">
                                                        Mentor
                                                    </c:if>
                                                </p>
                                            </div>
                                        </div>
                                        <a class="dropdown-item" href="../dashboard.html">Dashboard</a>
                                        <a class="dropdown-item" href="../profile-settings.html">Profile Settings</a>
                                        <a class="dropdown-item" href="/Happy_Programming/logout">Logout</a>
                                    </div>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </header>
            <!-- /Header -->



        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="../assets/js/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!-- Owl Carousel -->
        <script src="assets/js/owl.carousel.min.js"></script>		

        <!-- Aos -->
        <script src="assets/plugins/aos/aos.js"></script>

        <!-- Custom JS -->
        <script src="../assets/js/script.js"></script>

    </body>

    <!-- Mirrored from mentoring.dreamstechnologies.com/html/template/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 08 Jan 2024 17:29:49 GMT -->
</html>
