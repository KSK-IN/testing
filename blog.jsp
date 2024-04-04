<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="meta.jsp"></jsp:include>
</head>

<body style="">
<div id="header-wrap">
	<jsp:include page="top-menu.jsp"></jsp:include>
	<jsp:include page="header.jsp">
		<jsp:param value="blog" name="current"/>
	</jsp:include>
</div><!--header-wrap-->

<div class="site-banner">
	<div class="banner-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">			
					<div class="text-content colored">
						<h1>Blogs</h1>
						<div class="breadcum-items mt-2">
							<span class="item color-primary"><a href="/home">Home /</a></span>
							<span class="item colored">Blogs</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!--site-banner-->

<section class="post-grid margin-large border-bottom">
	<div class="container">
		<div class="row">
			 <% 
			    Connection connect = null;
			    Statement stmt = null;
			    ResultSet result = null;	
			    try{	
			    	connect = DBConnection.getConnection();
			    	stmt = connect.createStatement();
			    	result = stmt.executeQuery("SELECT * FROM blog where active = 'A';");
			%>			    
			<% while(result.next()) { %>

			<div class="col-md-4 mb-5">
				<a href="/post?id=<%= result.getString("idblog") %>">
					<img src="<%= result.getString("image") %>" alt="blog" class="postImg img-fluid mb-3">
				</a>
				<div class="content">
					<div class="meta-tags d-flex color-secondary mb-3">
						<span class="border-right"><i class="icon icon-calendar me-2"></i><%= result.getString("created_date") %></span>
					</div><!--meta-tags-->

					<h2 class="post-title"><a href="/post?id=<%= result.getString("idblog") %>"><%= result.getString("title") %></a></h2>
					<p><%= result.getString("shortcontent") %></p>

					<div class="pix_btn">
						<a href="/post?id=<%= result.getString("idblog") %>" class="btn-hvr-effects mt-3">read more</a>
					</div>
				
				</div><!--content-->
			</div><!--col-md-4-->
			
			 <% } %>
			    <%	}catch(Exception e){ 
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
	</div>
</section>


<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>
<script type="text/javascript" src="js/script.js"></script>



</body></html>