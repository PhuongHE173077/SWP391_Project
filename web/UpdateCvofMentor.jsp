<%-- 
    Document   : MentorProfile
    Created on : Jun 6, 2024, 10:21:06 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/profile.css"/>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
        }
        .profile-picture-container {
            text-align: center;
            margin-bottom: 15px;
        }
        .profile-picture {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
        }
        .change-photo-button {
            margin-top: 10px;
        }
        .nav-tabs .nav-link {
            border: none;
            border-bottom: 2px solid transparent;
        }
        .nav-tabs .nav-link.active {
            border-color: #007bff;
        }
        .form-section {
            margin-top: 20px;
        }
        .form-section label {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container rounded bg-white mt-5 mb-5 p-4 shadow-sm">
    <c:set value="" var="mentor"/>
    <form action="updateProfile" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-4 text-center">
                <div class="profile-picture-container">
                    <img id="profile-picture" class="profile-picture rounded-circle mb-2"
                         src=""
                         alt="Profile Picture">
                    <button type="button" class="btn btn-primary btn-sm change-photo-button" 
                            onclick="document.getElementById('file-input').click();">
                        Change Photo
                    </button>
                </div>
                <input type="file" id="file-input" name="profilePicture" style="display: none;" 
                       accept="image/*" onchange="loadFile(event)">
                <input type="hidden" name="picture" />
                <input type="hidden" name="userId" />
            </div>
            <div class="col-md-8">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="#" class="nav-link active">Personal Info</a>
                    </li>
                </ul>
                <div class="tab-content pt-3">
                    <div class="tab-pane active">
                        <div class="form-section">
                            <div class="mb-3">
                                <label for="name">Full Name</label>
                                <input class="form-control" type="text" id="name" name="name" 
                                       placeholder="Full name" >
                            </div>
                            <div class="mb-3">
                                <label for="dob">Day of Birth</label>
                                <input class="form-control" type="date" id="dob" name="dob" 
                                       placeholder="yyyy-mm-dd" >
                            </div>
                            <div class="mb-3">
                                <label for="email">Email</label>
                                <input class="form-control" type="text" id="email" name="email" 
                                       placeholder="user@example.com" >
                            </div>
                            <div class="mb-3">
                                <label>Gender</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="genderMale" 
                                          value="1">
                                    <label class="form-check-label" for="genderMale">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="genderFemale" 
                                           value="2">
                                    <label class="form-check-label" for="genderFemale">Female</label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="address">Address</label>
                                <input class="form-control" type="text" id="address" name="address" 
                                       placeholder="Address" >
                            </div>
                            <div class="mb-3">
                                <label for="profession">Profession</label>
                                <input class="form-control" type="text" id="profession" name="profession" 
                                       placeholder="Profession">
                            </div>
                            <div class="mb-3">
                                <label for="professionIntroduction">Profession Introduction</label>
                                <textarea class="form-control" id="professionIntroduction" name="profession_introduction" 
                                          rows="4" placeholder="Introduce your profession"></textarea>
                            </div>
                            <div class="mb-3">
                                <label>Skills</label><br>
                                
                                <c:forEach items="${requestScope.sk}" var="skill">
                                      <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="skillHtml" name="skills" value="${skill.id}" checked>
                                    <label class="form-check-label" for="skill${skill.id}">${skill.skill}</label>
                                </div>
                              
                                </c:forEach>
                              
                            </div>
                            <div class="mb-3">
                                <label for="achievement">Achievements</label>
                                <textarea class="form-control" id="achievement" name="achievement" 
                                          rows="4" placeholder="Describe your achievements"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-primary" type="submit">OK</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    // Preview the uploaded image
    function loadFile(event) {
        const profilePicture = document.getElementById('profile-picture');
        profilePicture.src = URL.createObjectURL(event.target.files[0]);
        profilePicture.onload = () => {
            URL.revokeObjectURL(profilePicture.src); // Free up memory
        }
    }
</script>

</body>
</html>
