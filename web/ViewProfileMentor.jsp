<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="./css/profileMentor.css"/>
        <title>View Profile Mentor</title>
    </head>
    <body>
        <c:set value="${sessionScope.mentee}" var="mentee"/>
        <c:set value="${sessionScope.mentor}" var="mentor"/>
        <div class="container emp-profile">
            <form action="viewCVMentor" method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="${detail.picture}" alt=""/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                            <h5>${detail.name}</h5>
                            <h6>${detail.email}</h6>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="timeline-tab" data-toggle="tab" href="#timeline" role="tab" aria-controls="timeline" aria-selected="false">Timeline</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <c:if test="${mentor == null}">
                        <div class="col-md-2">
                            <a  class="profile-edit-btn" href="ViewMentor?${sid}">Back</a>
                        </div>
                    </c:if>
                    <c:if test="${mentor != null}">
                        <div class="col-md-2">
                            <a  class="profile-edit-btn" href="HomeMentor">Home</a>
                        </div>
                    </c:if>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>SKILLS</p>
                            <c:forEach items="${detail.skillList}" var="cv">
                                <a href="#">${cv.skill}</a><br/>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                    <div class="col-md-6"><label>Name</label></div>
                                    <div class="col-md-6"><p>${detail.name}</p></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><label>Email</label></div>
                                    <div class="col-md-6"><p>${detail.email}</p></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><label>Date Of Birth</label></div>
                                    <div class="col-md-6"><p>${detail.dob}</p></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><label>Phone</label></div>
                                    <div class="col-md-6"><p>${detail.phone}</p></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><label>Address</label></div>
                                    <div class="col-md-6"><p>${detail.address}</p></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><label>Education</label></div>
                                    <div class="col-md-6"><p>${detail.cv.education}</p></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><label>Work experience</label></div>
                                    <div class="col-md-6"><p>${detail.cv.wordexpereice}</p></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><label>Achievement</label></div>
                                    <div class="col-md-6"><p>${detail.cv.achievements}</p></div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="timeline" role="tabpanel" aria-labelledby="timeline-tab">
                                <div class="row">
                                    <div class="col-md-6"><label>Schedule</label></div>
                                    <div class="col-md-6">
                                        <c:forEach items="${detail.schedule}" var="lsch">
                                            <div class="row" style="border: 1px solid gainsboro; margin-bottom: 10px; border-radius: 10px;">
                                                <div class="col">${lsch.weeksday.name}</div>
                                                <div class="col">
                                                    <c:forEach items="${lsch.listTime}" var="ltss">
                                                        <div class="form-check">
                                                            <label class="form-check-label" for="checkbox${ltss.id}">${ltss.name}</label>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${mentor == null}">
                    <div class="col-md-2">
                        <a  class="profile-edit-btn" href="request?id=${detail.id}&sid=${sid}">Book</a>
                    </div>
                </c:if>
                <c:if test="${mentor != null}">
                    <div class="col-md-2">
                        <a  class="profile-edit-btn" href="updateCvMentor">Edit your profile</a>
                    </div>
                </c:if>

            </form>
        </div>
    </body>
</html>
