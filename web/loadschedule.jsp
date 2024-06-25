<%-- 
    Document   : loadschedule
    Created on : Jun 24, 2024, 5:29:10 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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

    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('imagePreview');
                output.src = reader.result;
                output.style.display = 'block';
            };
            reader.readAsDataURL(event.target.files[0]);
        }


    </script>

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
                                <a class="nav-link" href="loadcontroll">
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
                            <li class="nav-item">
                                <a class="nav-link " href="viewListSkill">
                                    <span class="me-2"><i class="bi bi-people-fill"></i></span>
                                    List Skill
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active " href="listScheduleMg">
                                    <span class="me-2"><i class="bi bi-people-fill"></i></span>
                                    List Schedule
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                </nav>

                <!-- Main Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">List Schedule</h1>
                        <div class="d-flex align-items-center">
                            
                            <div class="search-bar d-flex align-items-center">
                                <form action="listScheduleMg" method="post" class="d-flex align-items-center">
                                    <input value="${txtS}" type="text" class="form-control me-2" placeholder="Search Skill now" aria-label="search" aria-describedby="search" name="txt">
                                    <!--                                    <button type="submit" class="btn btn-outline-secondary"><img src="images/search.jpg" width="35px" height="35px"/></button>-->
                                    <button class="btn btn-primary me-2" data-toggle="modal">Search</button>
                                </form>
                            </div>
                        </div>
                        <c:set var="k" value="${requestScope.key}"/>
                    </div>

                    <!-- List of Mentee Content -->
                    <div class="card">
                        <div class="card-body">



                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>ID</th>
                                            <th>Mentor</th>
                                            <th>Start Day</th>
                                            <th>End Day</th>
                                            <th>Status</th>
                                            <th>action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="count" value="0" />
                                        <c:forEach items="${requestScope.listS}" var="ls">
                                            <c:set var="count" value="${count + 1}" />
                                            <tr>
                                                <td>${count}</td>
                                                <td>${ls.id}</td>
                                                <td />${ls.mementor.name}</td>
                                                <td>${ls.startDay}</td>
                                                <td>${ls.endDay}</td>
                                                <td>${ls.status}</td>
                                                <td>

                                                    <button type="button" class="view btn btn-primary" title="View">
                                                        <a href="aprrove?id=${ls.id}" style="color: white"class="view" title="View" ><i></i> View</a>

                                                    </button>

                                                    <button type="button" class="edit btn btn-secondary" title="Edit" >
                                                        <a href="aprrove?id=${ls.id}" style="color: white" class="edit" title="Edit" ><i></i> Approve</a>
                                                    </button>

                                                    <button type="button" class="delete btn btn-danger" title="Reject" data-toggle="tooltip" onclick="window.location.href = 'aprrove?id=${ls.id}'">
                                                        <i class="mdi mdi-delete"></i> Reject
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    

                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>



                    <!-- Pagination -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1">Previous</a>
                            </li>
                            <c:set var="page" value="${requestScope.page}"/>
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                <li class="page-item ${page == i ? 'active' : ''}">

                                    <a class="page-link" href="viewListSkill?page=${i}&key=${key}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </main>
            </div>
        </div>