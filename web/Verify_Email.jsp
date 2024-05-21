<%-- 
    Document   : Verify_Email
    Created on : May 16, 2024, 11:35:48 AM
    Author     : TUF F15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy program</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
        <style>
            body{
                background-image: url(images/verify-Email.jpg);
                background-size: cover;
                background-position: center;
                
            }
            .height-100{
                height:100vh
            }
            .card{
                width:400px;
                border:none;
                height:300px;
                box-shadow: 0px 5px 20px 0px #d2dae3;
                z-index:1;
                display:flex;
                justify-content:center;
                align-items:center
            }
            .card h6{
                color:chocolate;
                font-size:20px
            }
            .inputs input{
                width:40px;
                height:40px
            }
            input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button{
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                margin: 0
            }
            .card-2{
                background-color:#fff;
                padding:10px;
                width:350px;
                height:100px;
                bottom:-50px;
                left:20px;
                position:absolute;
                border-radius:5px
            }
            .card-2 .content{
                margin-top:50px
            }
            .card-2 .content a{
                color:red
            }
            .form-control:focus{
                box-shadow:none;
                border:2px solid red
            }
            .validate{
                color: black;
                border-radius:20px;
                height:40px;
                background-color:aquamarine;
                border:1px solid red;
                width:140px
            }

        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                function OTPInput() {
                    const inputs = document.querySelectorAll('#otp > *[id]');
                    for (let i = 0; i < inputs.length; i++) {
                        inputs[i].addEventListener('keydown', function (event) {
                            if (event.key === "Backspace") {
                                inputs[i].value = '';
                                if (i !== 0)
                                    inputs[i - 1].focus();
                            } else {
                                if (i === inputs.length - 1 && inputs[i].value !== '') {
                                    return true;
                                } else if (event.keyCode > 47 && event.keyCode < 58) {
                                    inputs[i].value = event.key;
                                    if (i !== inputs.length - 1)
                                        inputs[i + 1].focus();
                                    event.preventDefault();
                                } else if (event.keyCode > 64 && event.keyCode < 91) {
                                    inputs[i].value = String.fromCharCode(event.keyCode);
                                    if (i !== inputs.length - 1)
                                        inputs[i + 1].focus();
                                    event.preventDefault();
                                }
                            }
                        });
                    }
                }
                OTPInput();
            });
        </script>
    </head>
    <body>
        <div class="container height-100 d-flex justify-content-center align-items-center">
            <div class="position-relative">
                <div class="card p-2 text-center">
                    <h6>Please enter code send to your email <br> to verify your account</h6>
                    <form action="VerifyEmail" method="post">
                    <div> <span>A code has been sent to ${email}</span> <small></small> </div>
                    
                        <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2">
                            <input class="m-2 text-center form-control rounded" type="number" name="first" id="first" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="number" name="second" id="second" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="number" name="third" id="third" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="number" name="fourth" id="fourth" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="number" name="fifth" id="fifth" maxlength="1" />
                            <input class="m-2 text-center form-control rounded" type="number" name="sixth" id="sixth" maxlength="1" /> 
                            <input type="hidden" name="email" value="${email}"/>
                            <input type="hidden" name="name" value="${name}"/>
                            <input type="hidden" name="pass" value="${pass}"/>
                        </div>
                            <div class="mt-4"> <button type="submit" class="btn btn-danger px-4 validate">Validate</button> </div>
                
                    </form>
                </div>    
                <div class="card-2">
                    <div class="content d-flex justify-content-center align-items-center"> <span>Didn't get the code</span> <a
                            href="#" class="text-decoration-none ms-3">Resend</a> </div>
                </div>
            </div>
        </div>
    </body>
</html>