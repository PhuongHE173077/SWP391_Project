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

            .schedule-table th, .schedule-table td {
                text-align: center;
                vertical-align: middle;
                font-size: 15px;
            }
            .schedule-table th {
                background-color: #f8f9fa;
            }
            .btn-save {
                margin-top: 20px;
            }

        </style>
        <script>
            // This script will run when the page loads
            window.onload = function () {
                // Get the error message from the JSP attribute
                var erro = '<%= request.getAttribute("thongbao") != null ? request.getAttribute("thongbao") : "" %>';

                // Check if there is an error message
                if (erro.trim() !== "") {
                    // Display the error message
                    alert(erro);
                }
            }
        </script>
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
                                    <div class="container mt-5">
                                        <h2 class="mb-4">Schedule Table</h2>
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

                                                <th>WEEK</th>
                                                <th>MON </th>
                                                <th>TUES</th>
                                                <th>THUR</th>
                                                <th>WEN</th>
                                                <th>FRI</th>
                                                <th>SAT</th>
                                                <th>SUN</th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${timeSlots}" var="slot">
                                                        <tr>
                                                            <td>${slot.name}</td>
                                                            <c:forEach items="${dates}" var="date">
                                                                <td>
                                                                    <input type="checkbox" class="form-check-input" name="schedule" value="${slot.id},${date}">
                                                                </td>
                                                            </c:forEach>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                           
                                        
                                    </div>
                                </div>

                            </div> 
                            <button type="submit" class="btn btn-primary btn-save">Send</button>
                            
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
                                <c:set value="${sessionScope.mentor}" var="me"/>
                                <div class="card-body">
                                    <h6 class="card-title font-weight-bold">Your schedule of Mentor </h6>
                                    <c:forEach items="${me.schedule}" var="mch">
                                        <h5 class="card-text">${mch.weeksday.name}</h5>
                                        <c:forEach items="${mch.listTime}" var="mt">
                                            <p>${mt.name}</p>
                                        </c:forEach>

                                    </c:forEach>


                                </div>
                            </div>
                             <div class="card">
                                <c:set value="${sessionScope.mentor}" var="me"/>
                                <div class="card-body">
                                    <h6 class="card-title font-weight-bold">Your schedule of Mentor </h6>
                                    <c:forEach items="${me.schedule}" var="mch">
                                        <h5 class="card-text">${mch.weeksday.name}</h5>
                                        <c:forEach items="${mch.listTime}" var="mt">
                                            <p>${mt.name}</p>
                                        </c:forEach>

                                    </c:forEach>


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

