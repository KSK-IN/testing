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
			<jsp:param value="contact" name="form"/>
		</jsp:include>
		
		<div class="main">
			<jsp:include page="/admin/header.jsp"></jsp:include>
			<main>
				<div class="container-fluid">
					<div class="card shadow mb-4">
			            <div class="card-header py-3">
			              <h6 class="m-0 font-weight-bold text-primary">Details of the contacted persons: </h6>
			            </div>
			            <div class="card-body">
			              <div class="table-responsive">
			                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>Name</th>
			                      <th>Email ID</th>
			                      <th>Message</th>
			                      <th>Date</th>
			                    </tr>
			                  </thead>
			                  <tfoot>
			                    <tr>
			                      <th>Name</th>
			                      <th>Email ID</th>
			                      <th>Message</th>
			                      <th>Date</th>
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
			                  		result = stmt.executeQuery("SELECT name,email_id,message,date_format(created_date,'%d-%m-%Y') as 'date' FROM contact order by created_date desc;");
			                  		while(result.next()){
			                  %>
			                    <tr>
			                      <td><%= result.getString("name") %></td>
			                      <td><%= result.getString("email_id") %></td>
			                      <td><%= result.getString("message") %></td>
			                      <td><%= result.getString("date") %></td>
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
</body>
</html>