<%-- 
    Document   : Manager
    Created on : Jun 20, 2024, 9:03:53 PM
    Author     : Acer
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                font-family: 'Arial', sans-serif;
            }

            #sidebar {
                min-height: 100vh;
                background: #343a40;
                color: #fff;
            }

            #sidebar .nav-link {
                color: #fff;
            }

            #sidebar .nav-link.active {
                background-color: #495057;
            }

            #sidebar .nav-link:hover {
                background-color: #495057;
            }

            .navbar-brand {
                color: #fff;
            }

            .search-bar {
                max-width: 400px;
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
                        body {
                font-family: 'Arial', sans-serif;
            }

            #sidebar {
                min-height: 100vh;
                background: #343a40;
                color: #fff;
            }

            #sidebar .nav-link {
                color: #fff;
            }

            #sidebar .nav-link.active {
                background-color: #495057;
            }

            #sidebar .nav-link:hover {
                background-color: #495057;
            }

            .navbar-brand {
                color: #fff;
            }

            .search-bar {
                max-width: 400px;
            }
            .pagination {
                display: flex;
                justify-content: center;
                list-style: none;
                padding: 0;
            }

            .page-item {
                margin: 0 5px;
            }

            .page-item a {
                color: blue;
                text-decoration: none;
                padding: 10px 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
            }

            .page-item a:hover {
                background-color: #f0f0f0;
            }

            .page-item.active a {
                background-color: blue;
                color: white;
                border-color: blue;
            }
            .d-flex.align-items-center {
                display: flex;
                align-items: center;
            }

            .me-2 {
                margin-right: 8px;
            }

            .form-control.me-2 {
                margin-right: 8px;
            }

            .search-bar {
                display: flex;
                align-items: center;
            }

            .btn-outline-secondary {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0;
                border: none;
                background: none;
            }


        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
                    <div class="position-sticky">
                        <a class="navbar-brand d-flex align-items-center px-3 py-2" href="#">
                            <span class="fs-4">Manager</span>
                        </a>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="loadcontroll">
                                    <span class="me-2"><i class="bi bi-person-plus-fill"></i></span>
                                    CV Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listmentor">
                                    <span class="me-2"><i class="bi bi-people-fill"></i></span>
                                    List of Mentor
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="listmentee">
                                    <span class="me-2"><i class="bi bi-people-fill"></i></span>
                                    List of Mentee
                                </a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link " href="viewListSkill">
                                    <span class="me-2"><i class="bi bi-people-fill"></i></span>
                                    List Skill
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">List of Mentee</h1>.
                        <form action="searchmentee" method="post" class="form-inline my-2 my-lg-0">
                            <div class="input-group input-group-sm">
                                <input name="txt" type="text" class="form-control" placeholder="Search for users...">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-secondary btn-number">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- List of Mentee Content -->
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Day of Birth</th>
                                    <th>Gender</th>
                                    <th>Address</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${lm}">
                                    <tr>
                                        <td>${item.id}</td>
                                        <td>${item.name}</td>
                                        <td>${item.email}</td>
                                        <td>${item.phone}</td>
                                        <td>${item.dob}</td>
                                        <td>
                                            ${item.gender == 1 ? 'Male' : item.gender == 2 ? 'Female' : ''}
                                        </td>                                       
                                        <td>${item.address}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1">Previous</a>
                            </li>
                            <c:set var="page" value="${requestScope.page}" />
                    <div class="pagination">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a class="${i==page?"active":""}" href="listmentee?page=${i}">${i}</a>
                        </c:forEach>
                    </div>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </main>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.js"></script>
    </body>

</html>
