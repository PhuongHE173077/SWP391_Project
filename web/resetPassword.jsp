<%-- 
    Document   : resetPassword
    Created on : May 15, 2024, 9:06:14 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/style.css">
        <title>Happy programming</title>
        
        <style>
		body {
			padding-top: 50px;
		}
		.form-group label {
			font-weight: bold;
		}
	</style>
    </head>
    <body>

	<div class="container">
            <div style="text-align: center; font-size: 40px; font-family:Arial, Helvetica, sans-serif; ">RESET PASSWORD</div>
            <form action="reset-password" method="POST">
                        
			<div class="form-group">
				<label for="email">Email address</label>
				<input type="email" class="form-control" id="email" name="email" required>
			</div>
			
			<button type="submit" class="btn btn-primary">Reset Password</button>   
                        
                                 <p class="big fw-bold mt-2 pt-2 mb-2 text-center" > <a href="home" class="link-danger">Home</a></p>
		</form>
		
	</div>
	
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	        crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.0/dist/esm/popper-lite"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	        crossorigin="anonymous"></script>
	

    </body>
</html>
