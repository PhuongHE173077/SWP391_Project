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
        <title>JSP Page</title>
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
                                        
                                        <div class="row">
                                            <div class="col-12 col-sm-auto mb-3">
                                                <div class="mx-auto" style="width: 140px;">
                                                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                        <img style="width: 140px;height: 140px;" src="img/profile1.jpg" alt="alt"/>
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
                                                    <span class="badge badge-secondary">Mentor</span>
                                                    <div class="text-muted"><small></small></div>
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
                                                            
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Subject</label>
                                                                        
                                                                        <input class="form-control" required>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Deadline date</label>
                                                                        <input class="form-control" required>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div  class="form-group">
                                                                        <label>Deadline time</label>
                                                                        <input class="form-control" required>
                                                                    </div>
                                                                </div>
                                                                
                                                            </div>
                                                           
                                                            <div class="row">
                                                                <div class="col mb-3">
                                                                    <div class="form-group">
                                                                        <label>Content</label>
                                                                        <textarea class="form-control" rows="5" required></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 col-sm-6 mb-3">
                                                            <div class="mb-2"><b>Time slot</b></div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <Select class="form-control" name="time">
                                                                            <option value="value">text</option>
                                                                            <option value="value">text</option>
                                                                        </Select>
                                                                       
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Day number</label>
                                                                        <input class="form-control" >
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                                                            <div class="mb-2"><b>Skills</b></div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    
                                                                    <div class="custom-controls-stacked px-2">
                                                                        <c:forEach items="${mentor.getSkillList()}" var="list">
                                                                            <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox"   checked="">
                                                                            <label >${list.skill}</label>
                                                                        </div>
                                                                        </c:forEach>
                                                                        
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col d-flex justify-content-end">
                                                            <button class="btn btn-primary" type="submit">Save Changes</button>
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
                                            <span>Logout</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title font-weight-bold">Support</h6>
                                    <p class="card-text">Get fast, free help from our friendly assistants.</p>
                                    <button type="button" class="btn btn-primary">Contact Us</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
