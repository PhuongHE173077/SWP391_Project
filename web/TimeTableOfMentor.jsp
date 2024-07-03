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

            // Utility function to get the day of the week from a date string
            function getDayOfWeek(dateString) {
                console.log(`Parsing date: ${dateString}`);
                const dateParts = dateString.split('-');
                const date = new Date(dateParts[0], dateParts[1] - 1, dateParts[2]); // Adjust month for 0-based index
                const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                const dayOfWeek = days[date.getDay()];
                console.log(`Day of week: ${dayOfWeek}`);
                return dayOfWeek;
            }

            // This function shows the selected slots and days of the week in the modal
            function showSelectedSlots() {
                const checkboxes = document.querySelectorAll('input[name="schedule"]:checked');
                const valuesList = document.getElementById('checkboxValuesList');
                valuesList.innerHTML = '';

                checkboxes.forEach(checkbox => {
                    const [slotId, date] = checkbox.value.split(',');
                    const dayOfWeek = getDayOfWeek(date);

                    const listItem = document.createElement('li');
                    listItem.textContent = `Slot: ${slotId}, Day: ${dayOfWeek}`;
                    valuesList.appendChild(listItem);
                });

                $('#checkboxModal').modal('show');
            }
        </script>
    </head>
    <body>
        <div class="container">
                           <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="container mt-5">
                                          
                                        <h2 class="mb-4">Schedule Table</h2>
                                        <a href="HomeMentor" style=" color: blue;">Home</a>
                                        <form id="f2" action="TimeTableOfMentor"/>
                                        <select class="form-select form-select-lg mb-3" aria-label="Large select example" name="key" onchange="change()">
                                            <c:forEach items="${requestScope.listw}" var="lw">
                                                <option value="${lw.id}">${lw.startDay} to ${lw.endDay}</option>
                                            </c:forEach>
                                        </select>
                                        </form>

                                       
                                            <table class="table table-bordered schedule-table">
                                                <thead>
                                                    <tr style="background-color: #6B90DA">
                                                        <th>WEEKDAY</th>
                                                        <th>MON</th>
                                                        <th>TUES</th>
                                                        <th>WEND</th>
                                                        <th>THUS</th>
                                                        <th>FRI</th>
                                                        <th>SAT</th>
                                                        <th>SUN</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${timeSlots}" var="slot">
                                                        <tr>
                                                            <td>${slot.name}</td>
                                                            <c:forEach items="${dates}" var="date">
                                                                <c:set var="hasSchedule" value="false" />
                                                                <c:forEach items="${requestScope.listsch}" var="lch">
                                                                    <c:if test="${lch.scd.day == date && slot.id == lch.scd.timeslot.id}">
                                                                        <c:set var="hasSchedule" value="true" />
                                                                        <td><p style="color: blueviolet">${lch.rq.skill.skill}</p>
                                                                            <p style="color: black">${lch.rq.mentee.name}</p>
                                                                           
                                                                                <div>
                                                                                <c:if test="${lch.status == null}">
                                                                                <p style="color: red">(Not yet)</p>
                                                                            </c:if>        </
                                                                            <c:if test="${lch.status == 'Attend'}">
                                                                                    <p style="color: green">(Attend)</p>
                                                                            </c:if>
                                                                                <c:if test="${lch.status == 'Absent'}">
                                                                                    <p style="color: red">(Absent)</p>
                                                                            </c:if>
                                                                                </div>
                                                                                <c:if test="${lch.scd.day == today}">
                                                                                     <a href="url"><button>Update</button></a>
                                                                                </c:if>
                                                                           
                                                                            
                                                                            
                                                                            
                                                                            
                                                                        </td>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${not hasSchedule}">
                                                                    <td>
                                                                       -
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
                                            <div>You can gender most 2 months from now </div>
                                            <div style="display: flex">
                                                <div class="col-md-6">
                                                    <label>Start Date</label></br>
                                                    <input type="date" id="start-date" name="start-date">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>End Date</label></br>
                                                    <input type="date" id="end-date" name="end-date">
                                                </div>
                                            </div>

                                            <ul id="checkboxValuesList"></ul>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <script>
                                const today = new Date().toISOString().split('T')[0];

                                // Lấy ngày 2 tháng sau
                                const twoMonthsLater = new Date();
                                twoMonthsLater.setMonth(twoMonthsLater.getMonth() + 2);
                                const maxEndDate = twoMonthsLater.toISOString().split('T')[0];

                                // Thiết lập giá trị min và max cho start-date và end-date
                                document.getElementById('start-date').setAttribute('min', today);
                                document.getElementById('end-date').setAttribute('min', today);
                                document.getElementById('end-date').setAttribute('max', maxEndDate);
                            </script>
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
