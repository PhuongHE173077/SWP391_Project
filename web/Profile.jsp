<%-- 
    Document   : Profile
    Created on : May 22, 2024, 8:35:51 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./css/profile.css"/>
    </head>
    <body>
        <div class="container rounded bg-white mt-5 mb-5">
            <c:set value="${sessionScope.mentee}" var="mentee"/>
            <form action="updateProfile" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-4 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <div style="margin-bottom: 10px;">Profile Picture</div>
                            <img id="profile-picture" class="img-account-profile rounded-circle mb-2"
                                 src="${mentee.picture}?${System.currentTimeMillis()}"
                                 alt="Profile Picture"
                                 style="width: 150px; height: 150px; object-fit: cover;">
                            <div class="small font-italic text-muted mb-4" style="margin-top: 10px;">JPG or PNG no larger than 5 MB</div>
                            <button class="btn btn-primary profile-button" type="button" onclick="document.getElementById('file-input').click();" style="margin-top: 10px;">Upload new image</button>
                            <input type="file" id="file-input" name="profilePicture" style="display: none;" accept="image/*" onchange="loadFile(event)">
                            <input type="hidden" name="picture" value="${mentee.picture}"/>
                            <input type="hidden" name="userId" value="${mentee.id}"/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="p-3 py-5">
                            <h4 class="text-right">My Profile</h4>
                            <div class="row mt-3">
                                <input type="hidden" name="id" value="${mentee.id}"/>
                                <input type="hidden" name="pass" value="${mentee.pass}"/>
                                <input type="hidden" name="balance" value="${mentee.balance}"/>
                                <div class="col-md-12"><label class="labels">Name</label><input name="name" type="text" class="form-control" value="${mentee.name}"></div>
                                <div class="col-md-12"><label class="labels">Email</label><input name="email" type="text" class="form-control" value="${mentee.email}" readonly></div>
                                <div class="col-md-12"><label class="labels">Phone number</label><input name="phone" type="text" class="form-control" value="${mentee.phone}"></div>
                                <div class="col-md-12"><label class="labels">Address</label><input name="address" type="text" class="form-control" value="${mentee.address}"></div>
                                <div class="col-md-12">
                                    <label class="labels">Gender</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" name="gender" type="radio" value="1" ${mentee.gender == 1 ? 'checked' : ''}>
                                        <label class="form-check-label">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" name="gender" type="radio" value="2" ${mentee.gender == 2 ? 'checked' : ''}>
                                        <label class="form-check-label">Female</label>
                                    </div>
                                </div>
                                <div class="col-md-12"><label class="labels">Day of birth</label><input name="dob" type="text" class="form-control" value="${mentee.dob}"></div>
                            </div>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script>
            function loadFile(event) {
                const output = document.getElementById('profile-picture');
                output.src = URL.createObjectURL(event.target.files[0]);
                output.onload = function () {
                    URL.revokeObjectURL(output.src); // Free memory
                }
            }
        </script>
    </body>
</html>
