<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create request</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css'>
        <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js'></script>
        <style>
            .schedule-table td {
                vertical-align: middle; /* Vertically center align the content */
                text-align: center;     /* Horizontally center align the content */
            }
            .schedule-table .form-check-input {
                position: relative;    /* Ensure the checkbox is properly positioned */
                top: 0;                /* Reset top positioning */
                margin: 0;             /* Remove default margin */
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="#"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="e-profile">
                                        <form action="request" method="post">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <c:if test="${not empty error}">
                                                            <div style="color: red;">
                                                                <strong>Error:</strong> ${error}
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-auto mb-3">
                                                    <div class="mx-auto" style="width: 140px;">
                                                        <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                            <img style="width: 140px;height: 140px;" src="${mentor.picture}" alt="alt"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                    <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                        <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${mentor.name}</h4>
                                                        <p class="mb-0">${mentor.email}</p>
                                                        <div class="text-muted"><small></small></div>
                                                    </div>
                                                    <div class="text-center text-sm-right">
                                                        <span class="badge badge-secondary">${mentor.price}00 VND/Day</span>
                                                        <div class="text-muted"><small> </small></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <ul class="nav nav-tabs"></ul>
                                            <div class="tab-content pt-3">
                                                <div class="tab-pane active">
                                                    <form class="form" novalidate="">
                                                        <div class="row">
                                                            <div class="col">
                                                                <input type="hidden" name="id" value="${mentor.id}"/>
                                                                <input type="hidden" name="sid" value="${skill.id}"/>
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="form-group">
                                                                            <label>Subject</label>
                                                                            <input name="subject" class="form-control" required>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row"></div>
                                                                <div class="row">
                                                                    <div class="col mb-3">
                                                                        <div class="form-group">
                                                                            <label>Content</label>
                                                                            <textarea name="content" class="form-control" rows="5" required></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col mb-3">
                                                                        <div class="card">
                                                                            <div class="card-body">
                                                                                <div class="container mt-5">
                                                                                    <form id="f2" action="schedule"/>
                                                                                    <select class="form-select form-select-lg mb-3" aria-label="Large select example" name="key" onchange="change()">
                                                                                        <c:forEach items="${requestScope.listw}" var="lw">
                                                                                            <option value="${lw.id}">${lw.startDay} to ${lw.endDay}</option>
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                    </form>
                                                                                    <form action="schedule" method="post">
                                                                                        <input type="hidden" name="week" value="${de.id}"/>
                                                                                        <table class="table table-bordered schedule-table">
                                                                                            <thead>
                                                                                            <th></th>
                                                                                            <th>MON</th>
                                                                                            <th>TUES</th>
                                                                                            <th>WEND</th>
                                                                                            <th>THUS</th>
                                                                                            <th>FRI</th>
                                                                                            <th>SAT</th>
                                                                                            <th>SUN</th>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <c:forEach items="${timeSlots}" var="slot">
                                                                                                    <tr>
                                                                                                        <td>${slot.name}</td>
                                                                                                        <c:forEach items="${dates}" var="date">
                                                                                                            <c:set var="hasSchedule" value="false" />
                                                                                                            <c:forEach items="${requestScope.listsch}" var="lch">
                                                                                                                <c:if test="${lch.weeksDay.name == date && slot.id == lch.timeSlot.id}">
                                                                                                                    <c:set var="hasSchedule" value="true" />
                                                                                                                    <td>
                                                                                                                        <input type="checkbox" class="form-check-input" name="schedule" value="${lch.id}">
                                                                                                                    </td>
                                                                                                                </c:if>
                                                                                                            </c:forEach>
                                                                                                            <c:if test="${not hasSchedule}">
                                                                                                                <td></td>
                                                                                                            </c:if>
                                                                                                        </c:forEach>
                                                                                                    </tr>
                                                                                                </c:forEach>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col d-flex justify-content-end">
                                                                <button class="btn btn-primary" type="submit">Create request</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-3 mb-3">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="px-xl-3">
                                        <button class="btn btn-block btn-secondary">
                                            <i class="fa fa-sign-out"></i>
                                            <a href="home"style="text-decoration: none; color: white"><span>Home</span></a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title font-weight-bold">Skill request</h6>
                                    <img style="width:140px" src="${skill.images}" alt="alt"/>
                                    <p class="card-text">${skill.skill}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
