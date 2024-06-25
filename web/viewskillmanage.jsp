<%-- 
    Document   : viewskillmanage
    Created on : Jun 23, 2024, 11:23:40 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .modal-header {
                background-color: #007bff;
                color: white;
            }

            .modal-title {
                font-weight: bold;
            }

            .form-group label {
                font-weight: bold;
            }

            .form-group p {
                padding: 10px;
                border: 1px solid #ced4da;
                border-radius: 5px;
                background-color: #f8f9fa;
            }

            .form-group img {
                border: 1px solid #ced4da;
                border-radius: 5px;
                padding: 5px;
                background-color: #f8f9fa;
            }

            .modal-footer {
                border-top: 1px solid #ced4da;
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

        // Function to load skill details into the modal
        $('#editSkillModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var skillId = button.data('id'); // Extract info from data-* attributes

            // Use AJAX to get the skill details
            $.ajax({
                url: 'GetSkillDetails', // URL to get the skill details
                type: 'GET',
                data: {id: skillId},
                success: function (data) {
                    // Populate the form with the skill details
                    $('#editSkillId').val(data.id);
                    $('#editSkillName').val(data.skillName);
                    $('#editSkillDescription').val(data.skillDescription);
                    $('#editSkillCategory').val(data.skillCategory);
                }
            });
        });

        // Function to handle form submission via AJAX
        $('#editSkillForm').submit(function (event) {
            event.preventDefault(); // Prevent the form from submitting via the browser

            $.ajax({
                url: 'EditSkill', // URL to submit the form data
                type: 'POST',
                data: $(this).serialize(),
                success: function (response) {
                    // Handle the response
                    $('#editSkillModal').modal('hide');
                    // Optionally refresh the page or update the table row with new data
                }
            });
        });
    </script>
    <body>
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
                                    <img id="viewImagePreview" src="${detail.images}" alt="Image Preview" style="margin-top: 10px; max-height: 200px;">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="viewSkillName">Skill Name</label>
                                <p>${detail.skill}</p>
                            </div>
                            <div class="form-group">
                                <label for="viewSkillDescription">Description</label>
                                <p class="form-control" id="viewSkillDescription" name="skillDescription" rows="3" readonly>${detail.decription}</p>
                            </div>
                            <div class="form-group">
                                <label for="viewSkillCategory">Category</label>
                                <p>${detail.cs.name}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                <a href="viewListSkill" ></a>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    </body>

</html>
