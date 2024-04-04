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
//if (userid == null || userid.equals("")) {
    //request.setAttribute("err", "You have not logged in");
//    request.getRequestDispatcher("/login").forward(request, response);
//}
%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/admin/meta.jsp"></jsp:include>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/admin/navigation.jsp">
			<jsp:param value="product" name="form"/>
		</jsp:include>
		
		<div class="main">
			<jsp:include page="/admin/header.jsp"></jsp:include>
			<main>
				<div class="container-fluid">
					<div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h2 class="m-0 font-weight-bold text-primary">Add Product </h2>
			            </div>
			            <div class="card-body">
			            	<form id="add-product-form">
			            		<div class="row">
					              	<div class="col-md-12 mb-2">
					              		<input type="text" id="name" name="name" class="form-control" placeholder="Enter Product Name">
					              	</div>
					              	<div class="col-md-6 mb-2">
					              		<select class="form-control" id="type" name="type">
					              			<option value="0">Select type</option>
					              			<option value="Cake">Cake</option>
					              			<option value="Donut">Donut</option>
					              			<option value="Cupcake">Cupcake</option>
					              			<option value="Cake - Pastries">Cake - Pastries</option>
					              		</select>
					              	</div>
					              	
					              	<div class="col-md-6 mb-2">
					              		<input type="text" id="rate" name="rate" class="form-control" placeholder="Enter Product Rate">
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
			                      <th>NAME</th>
			                      <th>TYPE</th>
			                      <th>RATE</th>
			                      <th>IMAGE</th>
			                      <th>CREATED DATE</th>
			                      <th>ACTION</th>
			                    </tr>
			                  </thead>
			                  <tfoot>
			                    <tr>
			                       <th>NAME</th>
			                      <th>TYPE</th>
			                      <th>RATE</th>
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
			                  		result = stmt.executeQuery("SELECT idproducts, pname, ptype, image, rate, date_format(created_date,'%d-%m-%Y') as 'date' FROM cuppiecake.products where active = 'A' order by created_date desc;");
			                  		while(result.next()){
			                  %>
			                    <tr>
			                      <td><%= result.getString("pname") %></td>
			                      <td><%= result.getString("ptype") %></td>
			                      <td><%= result.getString("rate") %></td>
			                      <td>
			                      	<img alt="picture" src="<%= result.getString("image") %>" width="100" height="100">
			                      </td>
			                      <td><%= result.getString("date") %></td>
			                      <td>
			                      	<button type="button" class="btn btn-danger" id="<%= result.getString("idproducts") %>" onclick="deleteProduct(this.id);">Remove</button>
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
  		$('#add-product-form').submit(function(event){
  			event.preventDefault(); 
  			if(!$('#name').val()){
  				alert("Name cannot be empty!");
  			}else if($('#type').val() == 0){
  				alert("Select product type.");
  			}else if(!$('#rate').val()){
  				alert("Product Rate cannot be left empty.");
  			}else if($('#image')[0].files.length === 0){
  				alert("File upload in empty!");
  			}else{
  				var form = $("#add-product-form")[0];
  	            var data = new FormData(form);
  	            /* var data = {};
  	            data['key1'] = 'value1';
  	            data['key2'] = 'value2'; */
  	            $.ajax({
  	                type : "POST",
  	                encType : "multipart/form-data",
  	                url : "/sh/addproduct",
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
  	
  	
  	function deleteProduct(productID){
  		
  		$.ajax({
  				data: { "productID" : productID},
				type: "POST",
	        	url: '/sh/product_remove',
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