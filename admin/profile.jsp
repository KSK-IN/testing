<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String userid = (String)request.getSession().getAttribute("userid");

response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.addHeader("Cache-Control", "pre-check=0, post-check=0");
response.setDateHeader("Expires", 0);
response.setHeader("X-Frame-Options", "DENY"); // SAMEORIGIN To prevent from clickjacking
response.setHeader("X-XSS-Protection", "1; mode=block"); //Prevent Reflective XSS 
response.addHeader("X-Content-Type-Options", "nosniff"); // MIME type is not changed
response.setHeader("Content-Security-Policy", "default-src 'self'"); 
response.setHeader("Content-Security-Policy", "frame-ancestors 'self'");

response.setHeader("Strict-Transport-Security", "max-age=7776000; includeSubdomains");
if (userid == null || userid.equals("")) {
    //request.setAttribute("err", "You have not logged in");
    request.getRequestDispatcher("/login").forward(request, response);
}
%>
    
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/admin/meta.jsp"></jsp:include>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/admin/navigation.jsp">
			<jsp:param value="profile" name="form"/>
		</jsp:include>
		
		<div class="main">
			<jsp:include page="/admin/header.jsp"></jsp:include>
			<main>
				<div class="container-fluid">
					<div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h2 class="m-0 font-weight-bold text-primary">Update User Profile </h2>
			            </div>
			            <div class="card-body">
			            <form id="update-password-form">
			            	<div class="col-md-12 mb-2">
					        	<input type="password" id="cpassword" name="cpassword" class="form-control" placeholder="Current Password">
					        </div>
					        
					        <div class="col-md-12 mb-2">
					        	<input type="password" id="npassword" name="npassword" class="form-control" placeholder="New Password">
					        </div>
					        
					        <div class="col-md-12 mb-2">
					        	<input type="password" id="copassword" name="copassword" class="form-control" placeholder="Confirm Password">
					        </div>
					        
					        <div>
					        	<p>Note: Password should contain the following:</p>
						        <ul>
						        	<li>Minimum 1 capital letter</li>
						        	<li>Minimum 1 small letter</li>
						        	<li>Minimum 1 numeric letter</li>
						        	<li>Minimum 1 symbol</li>
						        	<li>Minimum length should be 8</li>
						        </ul>
					        </div>
					        
					        <div class="col-md-12 mb-2">
					        	<button type="submit" class="btn btn-primary">UPDATE PASSWORD</button>
					        </div>
			            </form>
			            </div>
		          </div>
							
		        </div>
			
			</main>
			<jsp:include page="/admin/footer.jsp"></jsp:include>
		</div>
	</div>
	
<script type="text/javascript">
$(document).ready(function() {
    $("#update-password-form").submit(function(event){
    	event.preventDefault();
	     	if(!$("#cpassword").val()){
	    		alert("Current Password Field cannot be left blank.");
	    	}else if(!$("#npassword").val()){
	    		alert("New Password cannot be left blank.");
	    	}else if($("#npassword").val()!== $("#copassword").val()){
	    		alert("Password do not match.");
	    	}else if(!validateInput($("#npassword").val(),2)){
	  			alert("Password not match the criteria specified.");
	  		}else{  
	  			$.ajax({
	  		        data: {"password":$('#npassword').val(), "userid" : "<%= userid %>"},
	  		        type: "POST",
	  		        url: '/sh/profile',
	  		        timeout: 20000,
	  		        contentType: "application/x-www-form-urlencoded",
	  		        dataType: 'json',
					success: function(data){
		  				alert(data.message);
		  				location.href = "/login";
					},
					error: function(data){
						alert("Something went wrong!");
						location.reload();
					}
	  			});
	  		}  
	    })
	});
  
</script>	
</body>
</html>