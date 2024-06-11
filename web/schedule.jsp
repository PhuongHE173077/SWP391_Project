<%-- 
    Document   : request
    Created on : May 23, 2024, 3:47:27 PM
    Author     : TUF F15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bootstrap Layout</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <style>
            /* CSS */
            .button-container {
                display: flex;
                justify-content: center; /* Căn giữa theo chiều ngang */
                align-items: center;     /* Căn giữa theo chiều dọc nếu container có chiều cao */
                height: 100px;           /* Chiều cao container, bạn có thể điều chỉnh */
            }

            .save-button {
                background-color: #4CAF50; /* Nền màu xanh lá */
                border: none;             /* Xóa viền */
                color: white;             /* Màu chữ trắng */
                padding: 10px 20px;       /* Padding nhỏ hơn */
                text-align: center;       /* Căn giữa chữ */
                text-decoration: none;    /* Xóa gạch dưới */
                display: inline-block;    /* Hiển thị inline-block */
                font-size: 14px;          /* Kích thước chữ nhỏ hơn */
                margin: 4px 2px;          /* Một chút margin */
                cursor: pointer;          /* Con trỏ chỉ tay khi hover */
                border-radius: 8px;       /* Góc bo tròn */
                transition: background-color 0.3s ease; /* Hiệu ứng chuyển màu khi hover */
            }

            .save-button:hover {
                background-color: #45a049; /* Màu xanh lá đậm hơn khi hover */
            }


        </style>
        <script type="text/javascript">
            function change() {
                document.getElementById("f2").submit();
            }
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#"><i class="fa fa-fw fa-bar-chart mr-1"></i> Schedule</a>
                                </li>
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
                                        <form id="f2" action="schedule">
                                            <div class="form-group">
                                                <select class="form-control" name="key" onchange="change()">

                                                    <c:forEach items="${requestScope.listW}" var="lw">
                                                        <c:if test="${lw.id == week.id}">
                                                            <option value="${lw.id}">${lw.name}</option>
                                                        </c:if>
                                                    </c:forEach>

                                                    <!-- Vòng lặp thứ hai: hiển thị các tùy chọn khác -->
                                                    <c:forEach items="${requestScope.listW}" var="lw">
                                                        <c:if test="${lw.id != week.id}">
                                                            <option value="${lw.id}">${lw.name}</option>
                                                        </c:if>
                                                    </c:forEach>



                                                </select>
                                            </div>
                                        </form>
                                        <ul class="nav nav-tabs"></ul>
                                        <form action="schedule" method="post">
                                            <div class="form-group row">
                                                <label class="col-sm-6 col-form-label">${week.name}</label>
                                                <input  type="hidden" name="week" value="${week.id}" />
                                                <div class="col-sm-5">
                                                    <c:forEach items="${requestScope.list}" var="listItem">
                                                        <div class="form-check">
                                                            <c:set var="isChecked" value="false" />
                                                            <c:forEach items="${requestScope.listS}" var="ls">
                                                                <c:if test="${listItem.id == ls.id}">
                                                                    <c:set var="isChecked" value="true" />
                                                                </c:if>
                                                            </c:forEach>
                                                            <input class="form-check-input" type="checkbox" name="skill" id="checkbox${listItem.id}" value="${listItem.id}" ${isChecked ? 'checked' : ''} />
                                                            <label class="form-check-label" for="checkbox${listItem.id}">${listItem.name}</label>
                                                        </div>
                                                    </c:forEach>


                                                </div>
                                            </div>


                                    </div>
                                </div>
                                
                            </div>
                                                <div class="button-container">
                                    <button class="save-button">Save</button>
                                </div>
</form>

                        </div>
                        <div class="col-12 col-md-3 mb-3">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="px-xl-3">
                                        <button class="btn btn-block btn-secondary">
                                            <i class="fa fa-sign-out-alt"></i>
                                            <a href="HomeMentor" style="text-decoration: none; color: white;">Home</a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title font-weight-bold">Mentor </h6>
                                    <p class="card-text">${mentor.skill}</p>
                                    <p class="card-text">${skill.skill}</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

