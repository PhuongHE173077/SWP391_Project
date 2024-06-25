<%-- 
    Document   : updateSkill
    Created on : Jun 24, 2024, 12:06:02 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
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

                                <input src="${skil.images}" type="file" class="form-control" id="skillImage" name="skillImage" accept="image/*" onchange="previewImage(event)">

                                <img id="imagePreview" src="${skil.images}" alt="Image Preview" style="margin-top: 10px; max-height: 200px; display: ${skil.images ? 'block' : 'none'};">
                            </div>
                            <div class="form-group">
                                <label for="editSkillName">Skill Name</label>
                                <input value="${skill.skill}" type="text" class="form-control" id="editSkillName" name="skillName" required>
                            </div>
                            <div class="form-group">
                                <label for="editSkillDescription">Description</label>
                                <input value="${skill.decription}" class="form-control" id="editSkillDescription" name="skillDescription" rows="3" required>
                            </div>
                            <div class="form-group">
                                <label for="editSkillCategory">Category</label>
                                <select class="form-control" id="editSkillCategory" name="skillCategory" required>
                                    <!-- Loop through categories and populate options -->
                                    <c:forEach items="${list}" var="c">
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
    </body>
</html>
