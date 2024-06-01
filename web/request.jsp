<%-- 
    Document   : request
    Created on : May 23, 2024, 3:47:27 PM
    Author     : TUF F15
--%>

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

    </head>
    <body>
        <div class="container">
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
                                                <div class="col-12 col-sm-auto mb-3">
                                                    <div class="mx-auto" style="width: 140px;">
                                                        <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                            <img style="width: 140px;height: 140px;" src="${skill.images}" alt="alt"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                    <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                        <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${skill.skill}</h4>
    <!--                                                    <p class="mb-0">${mentor.email}</p>-->
                                                        <div class="text-muted"><small></small></div>

                                                    </div>
                                                    <div class="text-center text-sm-right">
                                                        <span class="badge badge-secondary">${skill.cs.name}</span>
                                                        <div class="text-muted"><small> </small></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <ul class="nav nav-tabs">

                                            </ul>
                                            <div class="tab-content pt-3">
                                                <div class="tab-pane active">
                                                    <form class="form" novalidate="">
                                                        <div class="row">
                                                            <div class="col">
                                                                <input type="hidden" name="skill" value="${skill.id}"/>
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="form-group">
                                                                            <label>Subject</label>
                                                                            
                                                                            <input name="subject" class="form-control" required>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="form-group">
                                                                            <label>Deadline Day</label>
                                                                            <input type="number" name="deadlineDate" class="form-control" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col">
                                                                        <div  class="form-group">
                                                                            <label>Deadline Hourse</label>
                                                                            <input  name="deadlineTime" type="number" class="form-control" required>
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                                <div class="row">
                                                                    <div class="col mb-3">
                                                                        <div class="form-group">
                                                                            <label>Content</label>
                                                                            <textarea name="content" class="form-control" rows="5" required></textarea>
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
                                            <a href="home"style="text-decoration: none; color: white"><span>Home

                                                </span></a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title font-weight-bold">Request to Mentor</h6>
                                    <p class="card-text">${mentor.name}
                                        ${mentor.email}

                                    </p>

                                    <a href="ViewMentor?id=${skill.id}"><button type="button" class="btn btn-primary">Change mentor</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
</body>
</html>
