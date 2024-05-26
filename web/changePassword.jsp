<%-- 
    Document   : changePassword
    Created on : May 18, 2024, 8:59:45 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy Programing</title>
        <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
        <link rel="stylesheet" href="css/style.css">

        <style>
            .divider:after,
            .divider:before {
                content: "";
                flex: 1;
                height: 1px;
                background: #eee;
            }
        </style>
    </head>
    <body>
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row d-flex align-items-center justify-content-center h-100">
                    <div class="col-md-8 col-lg-7 col-xl-6">
                        <img src="https://as1.ftcdn.net/v2/jpg/02/29/69/36/1000_F_229693672_pvPJTOxTQM6qo7I6mYQFJCZ11Yc7Z42E.jpg"
                             class="img-fluid" alt="Phone image">
                    </div>
                    <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                        <form action="change-password" method="POST">
                            <!<!-- Account name method -->
                            <div class="d-flex flex-row align-items-center mb-4">
                                <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                <input name="email" type="email" id="form1Example23" class="form-control form-control-lg" placeholder="Email"/>
                            </div>
                            <!-- Password input -->
                            <div class="d-flex flex-row align-items-center mb-4">
                                <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                <input name="oldPass" type="password" id="form1Example23" class="form-control form-control-lg" placeholder="Old Password"/>
                            </div>
                            <div class="d-flex flex-row align-items-center mb-4">
                                <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                <input name="newPass" type="password" id="form1Example23" class="form-control form-control-lg" placeholder="New Password"/>
                            </div>
                            <div class="d-flex flex-row align-items-center mb-4">
                                <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                <input name="passConfirm" type="password" id="form1Example23" class="form-control form-control-lg" placeholder="Confirm Password"/>
                            </div>
                            <!-- Submit button -->
                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                <input type="submit" value="Enter" class="btn btn-primary btn-lg">
                                <!--<button type="button" class="btn btn-primary btn-lg">Register</button>-->
                            </div>
                            <p class="text-center" style="color: red">${requestScope.mess}</p> 
                            <p class="big fw-bold mt-1 pt-1 mb-0 text-center" > <a href="index.jsp" class="link-primary">Home</a></p>

                        </form>
                    </div>
                </div>
            </div>
        </section>

    </section>    
</body>
</html>

