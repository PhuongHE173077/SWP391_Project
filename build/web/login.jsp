<%-- 
    Document   : login
    Created on : May 11, 2024, 4:06:16 PM
    Author     : TUF F15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Happy Programming</title>
        <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="shortcut icon" href="images/favicon.png" />
        <style>
            .id {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 10px;

            }

            .id::before,
            .id::after {
                content: "";
                flex: 1;
                border-bottom: 1px solid grey;
                margin: 0 10px;

            </style>
            <script>
                // This script will run when the page loads
                window.onload = function () {
                    // Get the error message from the JSP attribute
                    var erro = '<%= request.getAttribute("erro") != null ? request.getAttribute("erro") : "" %>';

                    // Check if there is an error message
                    if (erro.trim() !== "") {
                        // Display the error message
                        alert(erro);
                    }
                }
            </script>
        </head>
        <body>
            <div class="container-scroller">
                <div class="container-fluid page-body-wrapper full-page-wrapper">
                    <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
                        <div class="row flex-grow">
                            <div class="col-lg-6 d-flex align-items-center justify-content-center">
                                <div class="auth-form-transparent text-left p-3">
                                    <div style="text-align: center;
                                         font-size: 40px;
                                         font-family:Arial, Helvetica, sans-serif; ">LOG IN</div>
                                    <form action="login" method="post" class="pt-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail">Email</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="mdi mdi-account-outline text-primary"></i>
                                                    </span>
                                                </div>
                                                <input type="text" name="email" class="form-control form-control-lg border-left-0" id="exampleInputEmail" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword">Password</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="mdi mdi-lock-outline text-primary"></i>
                                                    </span>
                                                </div>
                                                <input type="password" name="password" class="form-control form-control-lg border-left-0" id="exampleInputPassword" placeholder="Password">                        
                                            </div>
                                        </div>
                                        <div class="my-2 d-flex justify-content-between align-items-center">
                                            <div class="form-check">
                                                <label class="form-check-label text-muted">
                                                    <input type="checkbox" value="ON" name="rem" class="form-check-input">
                                                    Keep me signed in
                                                </label>
                                            </div>
                                            <a href="#" class="auth-link text-black">Forgot password?</a>
                                        </div>
                                        <div class="my-3">
                                            <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">LOGIN</button>
                                        </div>
                                        <div class="id"">
                                            or sign in with
                                        </div>
                                        <a style="text-decoration: none" href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/SWP391_Project/loginServlet&response_type=code
                                           &client_id=your code&approval_prompt=force">
                                                <div class="mb-2 d-flex">
                                                    <button type="button" class="btn btn-google auth-form-btn flex-grow ms-1">
                                                        <i class="mdi mdi-google me-2"></i>Login with google
                                                    </button>
                                                </div></a>
                                            <div class="text-center mt-4 font-weight-light">
                                                Don't have an account? <a href="Roles_Register" class="text-primary">Create</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-6 login-half-bg d-flex flex-row">
                                    <p class="text-white font-weight-medium text-center flex-grow align-self-end">SWP391 &copy; Happy Programming.</p>
                                </div>
                            </div>
                        </div>
                        <!-- content-wrapper ends -->
                    </div>
                    <!-- page-body-wrapper ends -->
                </div>
                <!-- container-scroller -->
                <!-- plugins:js -->
                <script src="vendors/base/vendor.bundle.base.js"></script>
                <!-- endinject -->
                <!-- inject:js -->
                <script src="js/off-canvas.js"></script>
                <script src="js/hoverable-collapse.js"></script>
                <script src="js/template.js"></script>
                <!-- endinject -->

            </body>
        </html>
