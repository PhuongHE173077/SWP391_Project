<%-- 
    Document   : register
    Created on : May 16, 2024, 9:15:44 AM
    Author     : TUF F15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Majestic Admin</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png" />
    </head>

    <body>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
                    <div class="row flex-grow">
                        <div class="col-lg-6 d-flex align-items-center justify-content-center">
                            
                            <div class="auth-form-transparent text-left p-3">

                                <h3 style="text-align: center">Register Mentor</h3>
                                <h5>${error}</h5>
                                <h6 class="font-weight-light"></h6>
                                <form class="pt-3" action="register" method="post">

                                    <div class="form-group">
                                        <input type="hidden" name="role" value="1"/>
                                        <label>Account Name</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-account-outline text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="text" name="accname" class="form-control form-control-lg border-left-0" placeholder="Account name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-account-outline text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="text" name="name" class="form-control form-control-lg border-left-0" placeholder="Full name" required>
                                        </div>
                                    </div>
                                    <div style="display: flex">
                                        <div class="form-group">
                                            <label>Date Of Birth</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="mdi mdi-calendar text-primary"></i>
                                                    </span>
                                            </div>
                                                <input type="date" name="dob" class="form-control form-control-lg border-left-0" placeholder="Date Of Birth" required> 
                                               

                                            </div>
                                        </div>
                                        <div style="margin-left: 20px; border-radius: 5px"class="form-group">
                                            <label>Gender</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="mdi mdi-gender-male-female text-primary"></i>
                                                    </span>
                                            </div>
                                                <select name="gender" class="form-control form-control-lg border-left-0">
                                                    <option value="1">Male</option>
                                                    <option value="2">Female</option>
                                                </select>
                                               
                                            </div>
                                        </div>


                                    </div>  

                                    <div class="form-group">
                                        <label>Email</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-email-outline text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="email" name="email" class="form-control form-control-lg border-left-0" placeholder="Email" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Password</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-lock-outline text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="password" name="pass" class="form-control form-control-lg border-left-0" id="exampleInputPassword" placeholder="Password" required>                        
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm Password</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-lock-outline text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="password" name="confirmPass" class="form-control form-control-lg border-left-0" id="exampleInputPassword" placeholder="Password Confirm" required>                        
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-phone text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="number" name="phoneNumber" class="form-control form-control-lg border-left-0" id="exampleInputPassword" placeholder="Phone Number" required>                        
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-text text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="text" name="address" class="form-control form-control-lg border-left-0" id="exampleInputPassword" placeholder="Address" required>                       
                                        </div>
                                    </div>

                                    <div class="mt-3">
                                        <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">SIGN UP</button>


                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 register-half-bg d-flex flex-row">
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

