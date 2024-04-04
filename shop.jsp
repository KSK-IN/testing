<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="meta.jsp"></jsp:include>
</head>

<body style="">


<div id="header-wrap">
	<jsp:include page="top-menu.jsp"></jsp:include>
	<jsp:include page="header.jsp">
		<jsp:param value="shop" name="current"/>
	</jsp:include>
</div><!--header-wrap-->

<div class="site-banner">
	<div class="banner-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">			
					<div class="colored">
						<h1>Shop</h1>
						<div class="breadcum-items">
							<span class="item"><a href="/home">Home /</a></span>
							<span class="item colored">Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!--site-banner-->

<section class="our-team bg-sand padding-large">
	<div class="container">
		<div class="row">
				
				<% 
				 	Connection connect = null;
			    	Statement stmt = null;
			    	ResultSet result = null;	
					try{	
						connect = DBConnection.getConnection();
						stmt = connect.createStatement();
						result = stmt.executeQuery("SELECT * FROM cuppiecake.products where `active` = 'A';");
				%>
				<% while(result.next()) { %>
				
				<div class="product-item col-md-3 pb-4">
					<a href="#" class="product-image"><img src="<%= result.getString("image") %>"></a>
					<div class="text-comtent text-center">
						<h5 class="pt-4"><a href="#"><%= result.getString("pname") %></a></h5>
						<p><%= result.getString("ptype") %></p>
						<span class="price colored">INR <%= result.getString("rate") %></span>
					</div>
				</div>
				
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

<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>
<script type="text/javascript" src="js/script.js"></script>



</body></html>