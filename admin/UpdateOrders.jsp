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
			<jsp:param value="updateorders" name="form"/>
		</jsp:include>
		
		<div class="main">
			<jsp:include page="/admin/header.jsp"></jsp:include>
			<main>
				<div class="container-fluid">
					<div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h2 class="m-0 font-weight-bold text-primary">Update Order Details</h2>
			            </div>
			            <div class="card-body">
			            	<div class="table-responsive">
			                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>ORDER ID</th>
			                      <th>DESCRIPTION</th>
			                      <th>CUSTOMER DETAILS</th>
			                      <th>AMOUNT</th>
			                      <th>Date</th>
			                      <th>ACTION</th>
			                    </tr>
			                  </thead>
			                  <tfoot>
			                    <tr>
			                      <th>ORDER ID</th>
			                      <th>DESCRIPTION</th>
			                      <th>CUSTOMER DETAILS</th>
			                      <th>AMOUNT</th>
			                      <th>Date</th>
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
			                  		result = stmt.executeQuery("SELECT idorders, orderID, odesc, customer_name ,customer_number, amount, status, active, date_format(created_date,'%d-%m-%Y') as 'date' FROM cuppiecake.orders WHERE status = 'Pending' order by idorders desc;");
			                  		while(result.next()){
			                  %>
			                    <tr>
			                      <td><%= result.getString("orderID") %></td>
			                      <td><%= result.getString("odesc") %></td>
			                      <td><%= result.getString("customer_name") %><br><%= result.getString("customer_number") %></td>
			                      <td><%= result.getString("amount") %></td>
			                      <td><%= result.getString("date") %></td>
			                      <td>
			                      	<button type="button" class="btn btn-success" id="<%= result.getString("idorders") %>" onclick="updateStatus(this.id,1);">Completed</button>
			                      	<button type="button" class="btn btn-danger" id="<%= result.getString("idorders") %>" onclick="updateStatus(this.id,2);">Declined</button>
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
function updateStatus(orderID, status){
	$.ajax({
			data: { "orderID" : orderID, "status" : status},
			type: "POST",
        url: '/sh/updateorder',
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