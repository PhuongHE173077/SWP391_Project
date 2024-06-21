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
        <title>Schedule Mentor</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <style>
            .button-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100px;
            }

            .save-button {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 8px;
                transition: background-color 0.3s ease;
            }

            .save-button:hover {
                background-color: #45a049;
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

            }

            .modal-footer {
                display: flex;
                justify-content: flex-end; /* Align buttons to the right */
                gap: 10px; /* Space between buttons */
            }

            .modal-footer .btn {
                flex: none; /* Prevent buttons from stretching */
                margin: 0; /* Remove default margin */
            }
            .button-container {
                display: flex;
                justify-content: right; /* Center align the buttons horizontally */
                align-items: center; /* Center align the buttons vertically if needed */
                gap: 10px; /* Space between buttons */
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

                                                <th>WEEKDAY</th>
                                                <th>MON </th>
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
                                                                            <input type="checkbox" class="form-check-input" name="schedule" value="${slot.id},${date}" checked>
                                                                        </td>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${not hasSchedule}">
                                                                    <td>
                                                                        <input type="checkbox" class="form-check-input" name="schedule" value="${slot.id},${date}">
                                                                    </td>
                                                                </c:if>
                                                            </c:forEach>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>

                                            </table>
                                    </div>
                                </div>

                            </div> 
                            <div class="button-container">
                                <a id="showDiv" href="#"><button type="button" class="btn btn-primary">gender</button></a>           
                                <button type="submit" class="btn btn-primary btn-save">Send</button>
                            </div>
                            <div class="modal fade" id="checkboxModal" tabindex="-1" role="dialog" aria-labelledby="checkboxModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">

                                            <h5 class="modal-title" id="checkboxModalLabel">Week gender</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div>You can gender most 8 months from now </div>
                                            <div>
                                                <c:forEach items="${requestScope.listDe}" var="ld">
                                                    <input type="checkbox" name="weeks" value="${ld.id}" id="modalInput"/>${ld.startDay} to ${ld.endDay}</br>
                                                </c:forEach>

                                            </div>
                                            <ul id="checkboxValuesList"></ul>
                                        </div>
                                        <div class="modal-footer" style="display: flex">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary" id="submitModal">Send</button>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>

                            <script>
                                document.getElementById('showDiv').addEventListener('click', function (event) {
                                    event.preventDefault();

                                    var checkboxes = document.querySelectorAll('input[name="schedule"]:checked');
                                    var values = [];

                                    checkboxes.forEach(function (checkbox) {
                                        values.push(checkbox.value);
                                    });

                                    var valuesList = document.getElementById('checkboxValuesList');
                                    valuesList.innerHTML = '';

                                    values.forEach(function (value) {
                                        var listItem = document.createElement('li');
                                        listItem.textContent = value;
                                        valuesList.appendChild(listItem);
                                    });

                                    $('#checkboxModal').modal('show');
                                });

                                document.getElementById('submitModal').addEventListener('click', function () {
                                    var modalInput = document.getElementById('modalInput').value;
                                    var checkboxes = document.querySelectorAll('input[name="schedule"]:checked');
                                    var mainForm = document.getElementById('mainForm');

                                    // Clear previous hidden inputs
                                    var hiddenInputs = document.querySelectorAll('.hiddenInput');
                                    hiddenInputs.forEach(function (input) {
                                        input.remove();
                                    });

                                    // Add hidden input for modal input
                                    var hiddenModalInput = document.createElement('input');
                                    hiddenModalInput.type = 'hidden';
                                    hiddenModalInput.name = 'input';
                                    hiddenModalInput.value = modalInput;
                                    hiddenModalInput.classList.add('hiddenInput');
                                    mainForm.appendChild(hiddenModalInput);

                                    // Add hidden inputs for checked checkboxes
                                    checkboxes.forEach(function (checkbox) {
                                        var hiddenCheckboxInput = document.createElement('input');
                                        hiddenCheckboxInput.type = 'hidden';
                                        hiddenCheckboxInput.name = 'schedule';
                                        hiddenCheckboxInput.value = checkbox.value;
                                        hiddenCheckboxInput.classList.add('hiddenInput');
                                        mainForm.appendChild(hiddenCheckboxInput);
                                    });

                                    // Submit the main form
                                    mainForm.submit();
                                });
                            </script>

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
                                        <h6 class="card-text">${mch.weeksday.name}</h6>
                                    </c:forEach>


                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

