<%-- 
    Document   : Manager
    Created on : Jun 20, 2024, 10:12:16 PM
    Author     : Admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
                    <div class="position-sticky">
                        <a class="navbar-brand d-flex align-items-center px-3 py-2" href="#">
                            <span class="fs-4">Admin Panel</span>
                        </a>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="loadcontroll">
                                    <span class="me-2"><i class="bi bi-person-plus-fill"></i></span>
                                    CV management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listmentor">
                                    <span class="me-2"><i class="bi bi-people-fill"></i></span>
                                    List of Mentor
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listmentee">
                                    <span class="me-2"><i class="bi bi-people-fill"></i></span>
                                    List of Mentee
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">List of User</h1>
                        <form action="search" method="post" class="form-inline my-2 my-lg-0">
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

                    <!-- List of Mentor Content -->
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${listS}">
                                    <tr>
                                        <td>${item.id}</td>
                                        <td>${item.name}</td>
                                        <td>${item.email}</td>
                                        <td>${item.phone}</td>
                                        <td>${item.status}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${item.status == 'Processing'}">
                                                    <button class="see-detail-button"
                                                            onclick="location.href = 'detailcontroller?id=${item.id}'">See Details
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- Handle other status cases, you can leave this empty or add alternative content -->
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <c:set var="page" value="${requestScope.page}" />
                    <div class="pagination">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a class="${i==page?"active":""}" href="loadcontroll?page=${i}">${i}</a>
                        </c:forEach>
                    </div>
                </main>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.js"></script>
    </body>

</html>
