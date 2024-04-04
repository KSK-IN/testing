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
			<jsp:param value="takeorder" name="form"/>
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
			            	<form id="take-order-form">
			            		<div class="row">
					              	<div class="col-md-12 mb-2">
					              		<textarea class="form-control" id="orderdetails" name="orderdetails" rows="6" placeholder="Enter order Details"></textarea>
					              	</div>
					              	<div class="col-md-6 mb-2">
					              		<input type="text" id="customername" name="customername" class="form-control" placeholder="Enter Customer Name">
					              	</div>
					              	<div class="col-md-6 mb-2">
					              		<input type="text" id="customernumber" name="customernumber" class="form-control" placeholder="Enter Customer Number">
					              	</div>
					              	<div class="col-md-6 mb-2">
					              		<input type="text" id="rate" name="rate" class="form-control" placeholder="Enter Total Amount">
					              	</div>
					              	<div class="col-md-12 mb-4">
					              		<button type="submit" class="btn btn-primary">SUBMIT</button>
					              	</div>	
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
	    $("#take-order-form").submit(function(event){
	    	event.preventDefault();
		     	if(!$("#orderdetails").val()){
		    		alert("Order Details cannot be left blank.");
		    	}else if(!$("#customername").val()){
		    		alert("Customer Name cannot be left blank.");
		    	}else if(!$("#customernumber").val()){
		    		alert("Customer Number cannot be left blank.");
		    	}else if(!$("#rate").val()){
		    		alert("Total Amount cannot be left blank.");
		    	}else if(!validateInput($("#customernumber").val().trim(),6)){
		  			alert("Provide a valid customer number!");
		  		}else{  
		  			$.ajax({
		  		        data: {
		  		        		"order": $('#orderdetails').val(),
		  		        	    "name": $('#customername').val(),
		  		        	    "mobile": $('#customernumber').val(),
		  		        	    "amount": $('#rate').val(),
		  		        	   },
		  		        type: "POST",
		  		        url: '/sh/order',
		  		        timeout: 20000,
		  		        contentType: "application/x-www-form-urlencoded",
		  		        dataType: 'json',
						success: function(data){
							console.log(data);
			  				alert(data.message);
			  				location.reload();
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