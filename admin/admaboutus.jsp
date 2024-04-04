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
			<jsp:param value="about" name="form"/>
		</jsp:include>
		
		<div class="main">
			<jsp:include page="/admin/header.jsp"></jsp:include>
			<main>
				<div class="container-fluid">
					<div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h2 class="m-0 font-weight-bold text-primary">About Us </h2>
			            </div>
			            <div class="card-body">
			            <label class="mb-2" for="add-blog-form"><b>About Us Page Description</b></label>
			            <% 
			                  	Connection connect = null;
			                  	Statement stmt = null;
			                  	ResultSet result = null;
			                  	try{
			                  		connect = DBConnection.getConnection();
			                  		stmt = connect.createStatement();
			                  		result = stmt.executeQuery("SELECT idaboutus, title, content, created_date FROM cuppiecake.aboutus where type = 1;");
			                  		while(result.next()){
			            %>
			              	<form id="update-mdesc-form">
			            		<div class="row">
			            			<div class="col-md-12 mb-2">
					              		<input type="text" id="title" name="title" class="form-control" placeholder="Enter Title" value="<%= result.getString("title") %>">
					              	</div>
					              	
					              	<div class="col-md-12 mb-2">
					              		<textarea class="form-control" id="content" name="content" rows="8" placeholder="Enter your content here..."><%= result.getString("content") %></textarea>
					              	</div>
					              	
					              	<div class="col-md-12 mb-4">
					              		<button type="submit" class="btn btn-primary">UPDATE</button>
					              	</div>	
					              </div>
			            	</form>
			            	
			            <% }
			                  	}catch(Exception e){
			                  		e.printStackTrace();
			                  	}finally{
			                  		try {
						    			if(connect != null) {
											connect.close();
										}
						    			
						    			if(stmt != null) {
											stmt.close();
										}
										
										if(result != null) {
											result.close();
										}
									}catch (Exception e) {
										e.printStackTrace();
									}	
			                  	}
			                    %>
			            </div>
		          </div> <!-- About us page description  -->
		          
		          
		          <div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h4 class="m-0 font-weight-bold text-primary">Mission Contents </h4>
			            </div>
			            <div class="card-body">
			            <% 
			                  	connect = null;
			                  	stmt = null;
			                  	result = null;
			                  	try{
			                  		connect = DBConnection.getConnection();
			                  		stmt = connect.createStatement();
			                  		result = stmt.executeQuery("SELECT idaboutus, title, sub_title, content, created_date FROM cuppiecake.aboutus where type = 3;");
			                  		while(result.next()){
			            %>
			              	<form id="update-mission-form">
			            		<div class="row">
			            			<div class="col-md-12 mb-2">
					              		<input type="text" id="mtitle" name="mtitle" class="form-control" placeholder="Enter Title" value="<%= result.getString("sub_title") %>">
					              	</div>
					              	
					              	<div class="col-md-12 mb-2">
					              		<textarea class="form-control" id="mcontent" name="mcontent" rows="8" placeholder="Enter your content here..."><%= result.getString("content") %></textarea>
					              	</div>
					              	
					              	<div class="col-md-12 mb-4">
					              		<button type="submit" class="btn btn-primary">UPDATE</button>
					              	</div>	
					              </div>
			            	</form>
			            	
			            <% }
			                  	}catch(Exception e){
			                  		e.printStackTrace();
			                  	}finally{
			                  		try {
						    			if(connect != null) {
											connect.close();
										}
						    			
						    			if(stmt != null) {
											stmt.close();
										}
										
										if(result != null) {
											result.close();
										}
									}catch (Exception e) {
										e.printStackTrace();
									}	
			                  	}
			                    %>
			            </div>
		          </div> <!--  Update Mission Content -->
		          
		          
		          <div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h4 class="m-0 font-weight-bold text-primary">Vision Contents </h4>
			            </div>
			            <div class="card-body">
			            <% 
			                  	connect = null;
			                  	stmt = null;
			                  	result = null;
			                  	try{
			                  		connect = DBConnection.getConnection();
			                  		stmt = connect.createStatement();
			                  		result = stmt.executeQuery("SELECT idaboutus, title, sub_title, content, created_date FROM cuppiecake.aboutus where type = 4;");
			                  		while(result.next()){
			            %>
			              	<form id="update-vision-form">
			            		<div class="row">
			            			<div class="col-md-12 mb-2">
					              		<input type="text" id="vtitle" name="vtitle" class="form-control" placeholder="Enter Title" value="<%= result.getString("sub_title") %>">
					              	</div>
					              	
					              	<div class="col-md-12 mb-2">
					              		<textarea class="form-control" id="vcontent" name="vcontent" rows="8" placeholder="Enter your content here..."><%= result.getString("content") %></textarea>
					              	</div>
					              	
					              	<div class="col-md-12 mb-4">
					              		<button type="submit" class="btn btn-primary">UPDATE</button>
					              	</div>	
					              </div>
			            	</form>
			            	
			            <% }
			                  	}catch(Exception e){
			                  		e.printStackTrace();
			                  	}finally{
			                  		try {
						    			if(connect != null) {
											connect.close();
										}
						    			
						    			if(stmt != null) {
											stmt.close();
										}
										
										if(result != null) {
											result.close();
										}
									}catch (Exception e) {
										e.printStackTrace();
									}	
			                  	}
			                    %>
			            </div>
		          </div> <!--  Update Vision Content -->
		          
		          <div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h4 class="m-0 font-weight-bold text-primary">Goal Contents </h4>
			            </div>
			            <div class="card-body">
			            <% 
			                  	connect = null;
			                  	stmt = null;
			                  	result = null;
			                  	try{
			                  		connect = DBConnection.getConnection();
			                  		stmt = connect.createStatement();
			                  		result = stmt.executeQuery("SELECT idaboutus, title, sub_title, content, created_date FROM cuppiecake.aboutus where type = 5;");
			                  		while(result.next()){
			            %>
			              	<form id="update-goal-form">
			            		<div class="row">
			            			<div class="col-md-12 mb-2">
					              		<input type="text" id="gtitle" name="gtitle" class="form-control" placeholder="Enter Title" value="<%= result.getString("sub_title") %>">
					              	</div>
					              	
					              	<div class="col-md-12 mb-2">
					              		<textarea class="form-control" id="gcontent" name="gcontent" rows="8" placeholder="Enter your content here..."><%= result.getString("content") %></textarea>
					              	</div>
					              	
					              	<div class="col-md-12 mb-4">
					              		<button type="submit" class="btn btn-primary">UPDATE</button>
					              	</div>	
					              </div>
			            	</form>
			            	
			            <% }
			                  	}catch(Exception e){
			                  		e.printStackTrace();
			                  	}finally{
			                  		try {
						    			if(connect != null) {
											connect.close();
										}
						    			
						    			if(stmt != null) {
											stmt.close();
										}
										
										if(result != null) {
											result.close();
										}
									}catch (Exception e) {
										e.printStackTrace();
									}	
			                  	}
			                    %>
			            </div>
		          </div> <!--  Update Mission Content -->
		          
		          
		          
							
		        </div>
			
			</main>
			<jsp:include page="/admin/footer.jsp"></jsp:include>
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $("#update-mdesc-form").submit(function(event){
	    	event.preventDefault();
		     	if(!$("#title").val()){
		    		alert("Title cannot be left blank.");
		    	}else if(!$("#content").val()){
		    		alert("Content cannot be left blank.");
		  		}else if(!validateInput($("#content").val().trim(),7)){
		  			alert("Content contains invalid symbols!");
		  		}else{  
		  			$.ajax({
		  		        data: {"title":$('#title').val(),
		  		        	   "content":$('#content').val(),
		  		        	   "shortcontent": '',
		  		        	   "type":1
		  		        	   },
		  		        type: "POST",
		  		        url: '/sh/about',
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
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $("#update-mission-form").submit(function(event){
	    	event.preventDefault();
		     	if(!$("#mtitle").val()){
		    		alert("Title cannot be left blank.");
		    	}else if(!$("#mcontent").val()){
		    		alert("Content cannot be left blank.");
		  		}else if(!validateInput($("#mcontent").val().trim(),7)){
		  			alert("Contents contains invalid characters.");
		  		}else{  
		  			$.ajax({
		  		        data: {"title": '',
		  		        	   "content":$('#mcontent').val(),
		  		        	   "shortcontent":$('#mtitle').val(),
		  		        	   "type":3
		  		        	   },
		  		        type: "POST",
		  		        url: '/sh/about',
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
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $("#update-vision-form").submit(function(event){
	    	event.preventDefault();
		     	if(!$("#vtitle").val()){
		    		alert("Title cannot be left blank.");
		    	}else if(!$("#vcontent").val()){
		    		alert("Content cannot be left blank.");
		  		}else if(!validateInput($("#vcontent").val().trim(),7)){
		  			alert("Contents contains invalid characters.");
		  		}else{  
		  			$.ajax({
		  		        data: {"title": '',
		  		        	   "content":$('#vcontent').val(),
		  		        	   "shortcontent":$('#vtitle').val(),
		  		        	   "type":4
		  		        	   },
		  		        type: "POST",
		  		        url: '/sh/about',
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
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $("#update-goal-form").submit(function(event){
	    	event.preventDefault();
		     	if(!$("#gtitle").val()){
		    		alert("Title cannot be left blank.");
		    	}else if(!$("#gcontent").val()){
		    		alert("Content cannot be left blank.");
		  		}else if(!validateInput($("#gcontent").val().trim(),7)){
		  			alert("Contents contains invalid characters.");
		  		}else{  
		  			$.ajax({
		  		        data: {"title": '',
		  		        	   "content":$('#gcontent').val(),
		  		        	   "shortcontent":$('#gtitle').val(),
		  		        	   "type":5
		  		        	   },
		  		        type: "POST",
		  		        url: '/sh/about',
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