<%-- 
    Document   : loadAllSkill
    Created on : Jun 22, 2024, 3:23:40 PM
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
                                <a class="nav-link active" href="viewListSkill">
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
                        <h1 class="h2">List Skill</h1>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-primary me-2" data-toggle="modal" data-target="#addSkillModal">Add skill</button>
                            <div class="search-bar d-flex align-items-center">
                                <form action="seachAllSkill" method="post" class="d-flex align-items-center">
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
                                            <th>Image Skill</th>
                                            <th>Skill Name</th>
                                            <th>Category</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="count" value="0" />
                                        <c:forEach items="${requestScope.listS}" var="l">
                                            <c:set var="count" value="${count + 1}" />
                                            <tr>
                                                <td>${count}</td>
                                                <td>${l.id}</td>
                                                <td class="py-1"><img style="width: 50px" src="${l.images}" alt="image" /></td>
                                                <td>${l.skill}</td>
                                                <td>${l.cs.name}</td>
                                                <td>
<!--                                                    <button type="button" class="view btn btn-primary" title="View" data-toggle="tooltip" onclick="window.location.href = 'view?id=${l.id}'">
                                                        <i class="mdi mdi-eye"></i> View
                                                    </button>-->
                                                    <button type="button" class="view btn btn-primary" title="View">
                                                        <a href="ViewSkill?id=${l.id}" class="view" title="View" ><i></i> View</a>

                                                    </button>

                                                    <button type="button" class="edit btn btn-secondary" title="Edit" >
                                                        <a href="EditSkill?id=${l.id}" class="edit" title="Edit" ><i></i> Edit</a>
                                                    </button>

                                                    <button type="button" class="delete btn btn-danger" title="Delete" data-toggle="tooltip" onclick="window.location.href = 'DeleteSkill?id=${l.id}'">
                                                        <i class="mdi mdi-delete"></i> Delete
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Add Skill Modal -->
                    <div class="modal fade" id="addSkillModal" tabindex="-1" role="dialog" aria-labelledby="addSkillModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addSkillModalLabel">Add New Skill</h5>
                                    <!--                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>-->
                                </div>
                                <div class="modal-body">
                                    <form action="add" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="skillImage">Upload Image</label>
                                            <input type="file" class="form-control" id="skillImage" name="skillImage" accept="image/*" onchange="previewImage(event)" required>
                                            <img id="imagePreview" src="" alt="Image Preview" style="display:none; margin-top: 10px; max-height: 200px;">
                                        </div>
                                        <div class="form-group">
                                            <label for="skillName">Skill Name</label>
                                            <input type="text" class="form-control" id="skillName" name="skillName" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="skillDescription">Description</label>
                                            <textarea class="form-control" id="skillDescription" name="skillDescription" rows="3" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="skillCategory">Category</label>
                                            <select class="form-control" id="skillCategory" name="skillCategory" required>
                                                <!-- Loop through categories and populate options -->
                                                <c:forEach items="${requestScope.listC}" var="c">
                                                    <option value="${c.id}">${c.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="modal-footer">
                                            <button  type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-primary">Save</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- View Skill Modal -->
                    <div class="modal fade" id="viewSkillModal" tabindex="-1" role="dialog" aria-labelledby="viewSkillModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="viewSkillModalLabel">View Skill</h5>
                                </div>
                                <div class="modal-body">
                                    <form action="ViewSkill" method="post">
                                        <input type="hidden" id="viewSkillId" name="id">
                                        <div class="form-group">
                                            <label for="viewSkillImage">Image</label>
                                            <div>
                                                <img id="viewImagePreview" src="" alt="Image Preview" style="margin-top: 10px; max-height: 200px;">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="viewSkillName">Skill Name</label>
                                            <input  type="text" class="form-control" id="viewSkillName" name="skillName" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="viewSkillDescription">Description</label>
                                            <textarea class="form-control" id="viewSkillDescription" name="skillDescription" rows="3" readonly></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="viewSkillCategory">Category</label>
                                            <select class="form-control" id="viewSkillCategory" name="skillCategory" disabled>
                                                <!-- Loop through categories and populate options -->
                                                <c:forEach items="${requestScope.listC}" var="c">
                                                    <option value="${c.id}">${c.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>




                    <!-- Edit Skill Modal -->
                    <div class="modal fade" id="editSkillModal" tabindex="-1" role="dialog" aria-labelledby="editSkillModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editSkillModalLabel">Edit Skill</h5>
                                    <!--                                    <button type="button" class="close ml-auto" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>-->
                                </div>
                                <div class="modal-body">
                                    <form action="EditSkill" method="post">
                                        <input type="hidden" id="editSkillId" name="id">
                                        <div class="form-group">
                                            <label for="skillImage">Upload Image</label>
                                            <input type="file" class="form-control" id="skillImage" name="skillImage" accept="image/*" onchange="previewImage(event)" required>
                                            <img id="imagePreview" src="" alt="Image Preview" style="display:none; margin-top: 10px; max-height: 200px;">
                                        </div>
                                        <div class="form-group">
                                            <label for="editSkillName">Skill Name</label>
                                            <input type="text" class="form-control" id="editSkillName" name="skillName" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="editSkillDescription">Description</label>
                                            <textarea class="form-control" id="editSkillDescription" name="skillDescription" rows="3" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="editSkillCategory">Category</label>
                                            <select class="form-control" id="editSkillCategory" name="skillCategory" required>
                                                <!-- Loop through categories and populate options -->
                                                <c:forEach items="${requestScope.listC}" var="c">
                                                    <option value="${c.id}">${c.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-primary">Save Changes</button>
                                        </div>
                                    </form>
                                </div>
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
