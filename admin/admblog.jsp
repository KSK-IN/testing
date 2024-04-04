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
			<jsp:param value="blog" name="form"/>
		</jsp:include>
		
		<div class="main">
			<jsp:include page="/admin/header.jsp"></jsp:include>
			<main>
				<div class="container-fluid">
					<div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h2 class="m-0 font-weight-bold text-primary">Create Blog</h2>
			            </div>
			            <div class="card-body">
			            	<form id="add-blog-form">
			            		<div class="row">
					              	<div class="col-md-12 mb-2">
					              		<input type="text" id="title" name="title" class="form-control" placeholder="Enter Blog Title">
					              	</div>
					              	<div class="col-md-12 mb-2">
					              		<textarea class="form-control" id="shortdesc" name="shortdesc" rows="2" placeholder="Enter short description"></textarea>
					              	</div>
					              	
					              	<div class="col-md-12 mb-2">
					              		<textarea class="form-control" id="longdesc" name="longdesc" rows="4" placeholder="Enter your content here..."></textarea>
					              	</div>
					              	
					              	<div class="col-md-12 mb-2">
					              		<input type="file" class="form-control" id="image" name="image" placeholder="Choose the picture">
					              	</div>
					              	<div class="col-md-12 mb-4">
					              		<button type="submit" class="btn btn-primary">SUBMIT</button>
					              	</div>	
					              </div>
			            	</form>
			            </div>
		          </div>
		          
		          
		          <div class="card shadow mb-4">
		          	<div class="card-header py-3">
			              <h6 class="m-0 font-weight-bold text-primary">List of blogs: </h6>
			            </div>
			            <div class="card-body">
			              <div class="table-responsive">
			                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>TITLE</th>
			                      <th>LONG DESC</th>
			                      <th>IMAGE</th>
			                      <th>CREATED DATE</th>
			                      <th>ACTION</th>
			                    </tr>
			                  </thead>
			                  <tfoot>
			                    <tr>
			                      <th>TITLE</th>
			                      <th>LONG DESC</th>
			                      <th>IMAGE</th>
			                      <th>CREATED DATE</th>
			                      <th>ACTION</th>
			                    </tr>
			                  </tfoot>
			                  <tbody>
			                  <% 
			                  	Connection connect = null;
			                  	Statement stmt = null;
			                  	ResultSet result = null;
			                  	try{
			                  		connect = DBConnection.getConnection();
			                  		stmt = connect.createStatement();
			                  		result = stmt.executeQuery("SELECT idblog,title, shortcontent, longcontent, image, date_format(created_date,'%d-%m-%Y') as 'date' FROM cuppiecake.blog where active = 'A' order by created_date desc;");
			                  		while(result.next()){
			                  %>
			                    <tr>
			                      <td><%= result.getString("title") %></td>
			                      <td><%= result.getString("longcontent") %></td>
			                      <td>
			                      	<img alt="picture" src="<%= result.getString("image") %>" width="100" height="100">
			                      </td>
			                      <td><%= result.getString("date") %></td>
			                      <td>
			                      	<button type="button" class="btn btn-danger" id="<%= result.getString("idblog") %>" onclick="deleteBlog(this.id);">Remove</button>
			                      </td>
			                    </tr>
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
			                  </tbody>
			                </table>
			              </div>
			            </div>
		          </div>
		          
							
		        </div>
			
			</main>
			<jsp:include page="/admin/footer.jsp"></jsp:include>
		</div>
	</div>
	
	<script type="text/javascript">
  	$(document).ready(function(){
  		$('#add-blog-form').submit(function(event){
  			event.preventDefault(); 
  			if(!$('#title').val()){
  				alert("Title cannot be empty!");
  			}else if(!$('#shortdesc').val()){
  				alert("Short description cannot be left empty.");
  			}else if(!$('#longdesc').val()){
  				alert("Long description cannot be left empty.");
  			}else if($('#image')[0].files.length === 0){
  				alert("File upload in empty!");
  			}else{
  				var form = $("#add-blog-form")[0];
  	            var data = new FormData(form);
  	            /* var data = {};
  	            data['key1'] = 'value1';
  	            data['key2'] = 'value2'; */
  	            $.ajax({
  	                type : "POST",
  	                encType : "multipart/form-data",
  	                url : "/sh/addblog",
  	                cache : false,
  	                processData : false,
  	                contentType : false,
  	                data : data,
  	                success : function(msg) {
  	                    var status = msg.status;
  	                    if (status == 'success') {
  	                        alert(msg.message);
  	                      	location.reload();
  	                    } else {
  	                        alert("Couldn't upload file");
  	                    }
  	                },
  	                error : function(msg) {
  	                    alert("Couldn't upload file");
  	                }
  	            });	
  			}
  			
  		});
  	});
  	
  	
  	function deleteBlog(blogID){
  		
  		$.ajax({
  				data: { "blogid" : blogID},
  				type: "POST",
		        url: '/sh/delblog',
		        timeout: 20000,
		        contentType: "application/x-www-form-urlencoded",
		        dataType: 'json',
		        success: function(data){
  						alert(data.message);
  						location.reload();
				},
				error: function(data){
					alert("Something went wrong!");
					location.reload();
				}
			});
  	}
  
  </script>
</body>
</html>