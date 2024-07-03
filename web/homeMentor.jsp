<%-- 
    Document   : homeMentor
    Created on : Jun 4, 2024, 10:47:37 PM
    Author     : TUF F15
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Mentor Homepage</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png" />
        <style>
            .accept{
                color: black;
                text-decoration: none;
                margin-right: 10px;
                background-color: greenyellow;
                padding: 10px;
                border-radius: 5px;
            }
            .reject{
                color: black;
                text-decoration: none;

                background-color: red;
                padding: 10px;
                border-radius: 5px;
            }

        </style>
    </head>
    <body>
        <c:set value="${sessionScope.mentor}" var="mentor"/>
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="navbar-brand-wrapper d-flex justify-content-center">
                    <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">  
                        <a class="navbar-brand brand-logo" href="index.html"><img src="images/logo.svg" alt="logo"/></a>
                        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="images/logo-mini.svg" alt="logo"/></a>
                        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                            <span class="mdi mdi-sort-variant"></span>
                        </button>
                    </div>  
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                    <ul class="navbar-nav mr-lg-4 w-100">
                        <li class="nav-item nav-search d-none d-lg-block w-100">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="search">
                                        <i class="mdi mdi-magnify"></i>
                                    </span>
                                </div>
                                <input type="text" class="form-control" placeholder="Search now" aria-label="search" aria-describedby="search">
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item dropdown me-1">
                            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-bs-toggle="dropdown">
                                <i class="mdi mdi-message-text mx-0"></i>
                                <span class="count"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="messageDropdown">
                                <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
                                <a class="dropdown-item">
                                    <div class="item-thumbnail">
                                        <img src="images/faces/face4.jpg" alt="image" class="profile-pic">
                                    </div>
                                    <div class="item-content flex-grow">
                                        <h6 class="ellipsis font-weight-normal">David Grey
                                        </h6>
                                        <p class="font-weight-light small-text text-muted mb-0">
                                            The meeting is cancelled
                                        </p>
                                    </div>
                                </a>
                                <a class="dropdown-item">
                                    <div class="item-thumbnail">
                                        <img src="images/faces/face2.jpg" alt="image" class="profile-pic">
                                    </div>
                                    <div class="item-content flex-grow">
                                        <h6 class="ellipsis font-weight-normal">Tim Cook
                                        </h6>
                                        <p class="font-weight-light small-text text-muted mb-0">
                                            New product launch
                                        </p>
                                    </div>
                                </a>
                                <a class="dropdown-item">
                                    <div class="item-thumbnail">
                                        <img src="images/faces/face3.jpg" alt="image" class="profile-pic">
                                    </div>
                                    <div class="item-content flex-grow">
                                        <h6 class="ellipsis font-weight-normal"> Johnson
                                        </h6>
                                        <p class="font-weight-light small-text text-muted mb-0">
                                            Upcoming board meeting
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item dropdown me-4">
                            <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                                <i class="mdi mdi-bell mx-0"></i>
                                <span class="count"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
                                <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                                <a class="dropdown-item">
                                    <div class="item-thumbnail">
                                        <div class="item-icon bg-success">
                                            <i class="mdi mdi-information mx-0"></i>
                                        </div>
                                    </div>
                                    <div class="item-content">
                                        <h6 class="font-weight-normal">Application Error</h6>
                                        <p class="font-weight-light small-text mb-0 text-muted">
                                            Just now
                                        </p>
                                    </div>
                                </a>
                                <a class="dropdown-item">
                                    <div class="item-thumbnail">
                                        <div class="item-icon bg-warning">
                                            <i class="mdi mdi-settings mx-0"></i>
                                        </div>
                                    </div>
                                    <div class="item-content">
                                        <h6 class="font-weight-normal">Settings</h6>
                                        <p class="font-weight-light small-text mb-0 text-muted">
                                            Private message
                                        </p>
                                    </div>
                                </a>
                                <a class="dropdown-item">
                                    <div class="item-thumbnail">
                                        <div class="item-icon bg-info">
                                            <i class="mdi mdi-account-box mx-0"></i>
                                        </div>
                                    </div>
                                    <div class="item-content">
                                        <h6 class="font-weight-normal">New user registration</h6>
                                        <p class="font-weight-light small-text mb-0 text-muted">
                                            2 days ago
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </li>

                        <li class="nav-item nav-profile dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
                                <img src="${mentor.picture}" alt="profile"/>
                                <span class="nav-profile-name">${mentor.name}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                                <a href="viewCVMentor?id=${mentor.id}" class="dropdown-item">
                                    <i class="mdi mdi-account text-primary"></i>
                                    My Cv
                                </a>
                                <a class="dropdown-item">
                                    <i class="mdi mdi-settings text-primary"></i>
                                    change password
                                </a>
                                <a href="logout" class="dropdown-item">
                                    <i class="mdi mdi-logout text-primary"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </div>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_sidebar.html -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="HomeMentor">
                                <i class="mdi mdi-home menu-icon"></i>
                                <span class="menu-title">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                                <i class="mdi mdi-send menu-icon"></i>
                                <span class="menu-title">Reuest</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="auth">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="requestFromMentee"> request from mentee</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="pages/forms/basic_elements.html">
                                <i class="mdi mdi-school menu-icon"></i>
                                <span class="menu-title">My Class</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="pages/charts/chartjs.html">
                                <i class="mdi mdi-flag menu-icon"></i>
                                <span class="menu-title">Feedback</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="pages/tables/basic-table.html">
                                <i class="mdi mdi-grid-large menu-icon"></i>
                                <span class="menu-title">Blogs</span>
                            </a>
                        </li>


                    </ul>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">

                        <div class="row">
                            <div class="col-md-12 grid-margin">
                                <div class="d-flex justify-content-between flex-wrap">
                                    <div class="d-flex align-items-end flex-wrap">
                                        <div class="me-md-3 me-xl-5">
                                            <h2>Welcome to Happy Programming,</h2>
                                            <p class="mb-md-0">Happy Programming bring the best experience to users.</p>
                                        </div>

                                    </div>
                                    <div class="d-flex justify-content-between align-items-end flex-wrap">
                                        <button type="button" class="btn btn-light bg-white btn-icon me-3 d-none d-md-block ">
                                            <i class="mdi mdi-download text-muted"></i>
                                        </button>
                                        <button type="button" class="btn btn-light bg-white btn-icon me-3 mt-2 mt-xl-0">
                                            <i class="mdi mdi-clock-outline text-muted"></i>
                                        </button>
                                        <button type="button" class="btn btn-light bg-white btn-icon me-3 mt-2 mt-xl-0">
                                            <i class="mdi mdi-plus text-muted"></i>
                                        </button>

                                        <button class="btn btn-primary mt-2 mt-xl-0"><a href="ViewSchedule" style="text-decoration: none; color: black">Update Schedule</a></button
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body dashboard-tabs p-0">
                                        <ul class="nav nav-tabs px-4" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="overview-tab" data-bs-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="true">Overview</a>
                                            </li>


                                        </ul>
                                        <div class="tab-content py-0 px-0">
                                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                                                <div class="d-flex flex-wrap justify-content-xl-between">
                                                    <div class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                                        <i class="mdi mdi-calendar-heart icon-lg me-3 text-primary"></i>
                                                        <div class="d-flex flex-column justify-content-around">
                                                            <a href="schedule" style="text-decoration: none"><small class="mb-1 text-muted">Schedule</small></a>

                                                        </div>
                                                    </div>
                                                    <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                                        <i class="mdi mdi-book-lock-open me-3 icon-lg text-danger"></i>
                                                        <div class="d-flex flex-column justify-content-around">
                                                            <a href="url" style="text-decoration: none"><small class="mb-1 text-muted">Course</small></a>
                                                            <h5 class="me-2 mb-0"></h5>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                                        <i class="mdi mdi-send-circle me-3 icon-lg text-success"></i>
                                                        <div class="d-flex flex-column justify-content-around">
                                                            <a href="url" style="text-decoration: none"><small class="mb-1 text-muted">Total Request</small></a>
                                                            <h5 class="me-2 mb-0"></h5>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                                        <i class="mdi mdi-school me-3 icon-lg text-warning"></i>
                                                        <div class="d-flex flex-column justify-content-around">
                                                            <a href="" style="text-decoration: none"><small class="mb-1 text-muted">My Class</small></a>
                                                            <h5 class="me-2 mb-0"></h5>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                                        <i class="mdi mdi-flag me-3 icon-lg text-danger"></i>
                                                        <div class="d-flex flex-column justify-content-around">
                                                            <a href="url" style="text-decoration: none"><small class="mb-1 text-muted">Report</small></a>
                                                            <h5 class="me-2 mb-0"></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title">All Request to me </p>
                                        <div class="table-responsive">
                                            <table id="recent-purchases-listing" class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Mentee Name</th>
                                                        <th>Course name</th>
                                                        <th>Subject</th>
                                                        <th>content</th>
                                                        <th>Dealine Day</th>
                                                        <th>Action</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.listR}" var="lc">
                                                        <tr>
                                                            <td>${lc.mentee.name}</td>
                                                            <td>${lc.course.courseName}</td>
                                                            <td>${lc.subject}</td>
                                                            <td>${lc.content}</td>
                                                            <td>${lc.deadlineday}</td>
                                                            <td><a href="url" class="accept">Accept</a> 
                                                                <a href="url" class="reject">Reject</a></td>
                                                        </tr> 
                                                    </c:forEach>


                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © <a href="https://www.bootstrapdash.com/" target="_blank">bootstrapdash.com </a>2021</span>
                            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Only the best <a href="https://www.bootstrapdash.com/" target="_blank"> Bootstrap dashboard  </a> templates</span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->

        <!-- plugins:js -->
        <script src="vendors/base/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page-->
        <script src="vendors/chart.js/Chart.min.js"></script>
        <script src="vendors/datatables.net/jquery.dataTables.js"></script>
        <script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
        <!-- End plugin js for this page-->
        <!-- inject:js -->
        <script src="js/off-canvas.js"></script>
        <script src="js/hoverable-collapse.js"></script>
        <script src="js/template.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="js/dashboard.js"></script>
        <script src="js/data-table.js"></script>
        <script src="js/jquery.dataTables.js"></script>
        <script src="js/dataTables.bootstrap4.js"></script>
        <!-- End custom js for this page-->

        <script src="js/jquery.cookie.js" type="text/javascript"></script>
    </body>

</html>

