<%@page import="com.linus.utils.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Cyber Security test project.">
  <title>Cuppiecake | Login</title>
  <link href="/admin/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="/admin/css/sb-admin-2.min.css" rel="stylesheet">
  

</head>

<body style="background-color: #FFA96A;">
<% String base_url = Utility.getExternalUrl(request.getRequestURL()); %>
  <div class="container">

    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block">
              	<div style="text-align: center;">
              		<img alt="Login" src="../../images/main-logo2.png" width="350" style="vertical-align: middle;margin-top: 10rem;" >
              	</div>
              	
              	<div style="text-align: center;bottom: 0px;">
              		<a class="" href="<%= base_url %>../home" style="color: #EA3C12;">
              			<b>GO BACK TO WEBSITE</b>
              		</a>
              	</div>
              </div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  <form class="user" autocomplete="off">
                    <div class="form-group">
                    	<input type="text" class="form-control form-control-user" id="userName" placeholder="Enter Username">
                    </div>
                    <div class="form-group">
                      	<input type="password" class="form-control form-control-user" id="userPassword" placeholder="Password">
                    </div>
                    <div class="form-group" style="text-align: center;">
		            	<img alt="Captcha" src="/captcha.jpg">
		            	<input placeholder="Enter Captcha" id="captcha">
		            </div>
                    
                    <button class="btn btn-user btn-block" style="background-color: #FF4136;color:white;font-size: large;">LOGIN</button>
                  </form>
                  <hr>
                  
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>
  <script src="/admin/vendor/jquery/jquery.min.js"></script>
  <script src="/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="/admin/js/sb-admin-2.min.js"></script>
  <script type="text/javascript" src="/admin/js/validate.js"></script>
  <script type="text/javascript">
  
 	$(document).ready(function() {
	    $("form").submit(function(event){
	    	event.preventDefault(); 
	    	
	    	if(!$("#userName").val()){
	    		alert("Username cannot be left blank.");
	    	}else if(!$("#userPassword").val()){
	    		alert("Password cannot be left blank.");
	    	}else if(!validateInput($("#userName").val(),5)){
	    		alert("Please enter a valid Username.");
	  		}else if(!$('#captcha').val()){
	  			alert("Please enter the captcha.");
	  		}else{  
	  			$.ajax({
	  		        data: {"email":$('#userName').val(),
	  		        	   "password":$('#userPassword').val(),
	  		        	   "captcha":$('#captcha').val()
	  		        	  },
	  		        type: "POST",
	  		        url: '/sh/login',
	  		        timeout: 20000,
	  		        contentType: "application/x-www-form-urlencoded",
	  		        dataType: 'json',
	  		      	success : function(msg) {
	  		      		var status = msg.status;
	  		      		console.log(msg);
	                    if (status == 'success') {
	                    	window.location = msg.form;
	                    }else {
	                        alert(msg.message);
	                        location.reload();
	                    }
	                },
	                error : function(msg) {
	                    alert("Something went wrong. Try Again");
	                    location.reload();
	                }
	  			});
	  		}  
	  	});
	});
  
  </script>

</body>

</html>
