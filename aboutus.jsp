<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
		<jsp:param value="aboutus" name="current"/>
	</jsp:include>
</div><!--header-wrap-->

<div class="site-banner">
	<div class="banner-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">			
					<div class="colored">
						<h1>About Us</h1>
						<div class="breadcum-items">
							<span class="item"><a href="/home">Home /</a></span>
							<span class="item colored">About Us</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!--site-banner-->

<section class="chief-detail padding-large">
	<div class="container">
		<div class="row">
			<div class="col-md-12 p-5 text-center align-self-center">
			<% 
			    Connection connect = null;
			    Statement stmt = null;
			    ResultSet result = null;	
			    try{	
			    	connect = DBConnection.getConnection();
			    	stmt = connect.createStatement();
			    	result = stmt.executeQuery("SELECT * FROM cuppiecake.aboutus where `type` = 1;");
			%>
			<% while(result.next()) { %>
				<h2 class="section-title text-center mb-3"><%= result.getString("title") %></h2>
				<p style="text-align: justify;text-justify: inter-word;"><%= result.getString("content") %></p>
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
	</div>
</section>

<section class="our-team bg-sand padding-large">
	<h2 class="section-title text-center mb-4">Our Team</h2>
	<div class="container">
		<div class="row">

				<div class="col-md-3">

					<div class="team-member text-center">
						
						<figure>
							<a href="#"><img src="images/team.jpg" alt="post" class="member-image"></a>
						</figure>

						<div class="member-details text-center">
							<h4>Ria George</h4>
							<div class="designation colored">CEO-Founder</div>
							<p>Jelly topping halvah caramels sweet cake and loves coffee.</p>
							<div class="social-links color-primary ">
								<a href="#" class="icon icon-facebook pr-10"></a>
								<a href="#" class="icon icon-twitter pr-10"></a>
								<a href="#" class="icon icon-pinterest-p"></a>
							</div>
						</div>

					</div>

				</div><!--col-md-3-->

				<div class="col-md-3 text-center">

					<div class="team-member text-center">
						<figure>
							<img src="images/team1.jpg" alt="post" class="member-image">
						</figure>
						<div class="member-details text-center">
							<h4>Ms Sienna Jolie</h4>
							<div class="designation colored">General Manager</div>
							<p>A cake is all you need.</p>
							<div class="social-links color-primary">
								<a href="#" class="icon icon-facebook pr-10"></a>
								<a href="#" class="icon icon-twitter pr-10"></a>
								<a href="#" class="icon icon-pinterest-p"></a>
							</div>
						</div><!--text-content-->
					</div>

				</div><!--col-md-3-->

				<div class="col-md-3 text-center">

					<div class="team-member text-center">
						<figure>
							<img src="images/team2.jpg" alt="post" class="member-image">
						</figure>
						<div class="member-details text-center">
							<h4>Ms Jenny Blacksmith</h4>
							<div class="designation colored">Assistant Manager</div>
							<p>cup and cake</p>
							<div class="social-links color-primary">
								<a href="#" class="icon icon-facebook pr-10"></a>
								<a href="#" class="icon icon-twitter pr-10"></a>
								<a href="#" class="icon icon-pinterest-p"></a>
							</div>
						</div><!--text-content-->
					</div>

				</div><!--col-md-3-->

				<div class="col-md-3 text-center">

					<div class="team-member text-center">
						<figure>
							<img src="images/team3.jpg" alt="post" class="member-image">
						</figure>
						<div class="member-details text-center">
							<h4>Mrs Lora Inn</h4>
							<div class="designation colored">Staff</div>
							<p>A peace and calm bakery. Full of cupcakes</p>
							<div class="social-links color-primary">
								<a href="#" class="icon icon-facebook pr-10"></a>
								<a href="#" class="icon icon-twitter pr-10"></a>
								<a href="#" class="icon icon-pinterest-p"></a>
							</div>
						</div><!--text-content-->
					</div>

				</div><!--col-md-3-->

		</div>
	</div>
</section>

<section class="our-targets padding-large">
	<div class="container">
		<h2 class="section-title text-center mb-5">Our Targets</h2>
		<div class="row">
			<img src="images/cupcakebg.jpg" alt="flower">
			<div class="accordion accordion-flush mt-3" id="target-accordion">
			<% 
			    connect = null;
			    stmt = null;
			    result = null;	
			    int i = 0;
			    try{	
			    	connect = DBConnection.getConnection();
			    	stmt = connect.createStatement();
			    	result = stmt.executeQuery("SELECT * FROM cuppiecake.aboutus where `type` = 2;");
			%>
			<% while(result.next()) { %>
			
			<div class="accordion-item">
				<div class="accordion-header">
					<h4 class="accordion-title">
						<a role="button" data-bs-toggle="collapse" data-bs-target="#target<%= i %>" class="" aria-expanded="true"><%= result.getString("title") %></a>
					</h4>
				</div>
				<div id="target<%= i %>" class="accordion-collapse collapse show" aria-expanded="true">
					<div class="accordion-body"> 
						<div class="target-detail">
						<p><%= result.getString("content") %></p>
						</div>
				</div>
				</div>
			</div><!--panel-->
			<% i=i+1; %>
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
		</div><!--panel-group-->

		</div>
	</div>
</section>

<section class="our-achivement bg-sand padding-large">
	<div class="container">
			<h2 class="section-title text-center mb-5">Our Best Moments</h2>

		<div class="row">

			<div class="achivement-block text-center col-md-4">
				<img src="../images/badge.png" alt="badge">
				<div class="mt-3">
					<h3>Bakery of the Month</h3>
					<span class="date">2017 - 2018</span>
				</div>
			</div><!--achivement-block-->
			<div class="achivement-block text-center col-md-4">
				<img src="../images/badge1.png" alt="badge">
				<div class="mt-3">
					<h3>Bakery of the Month</h3>
					<span class="date">2019 - 2020</span>
				</div>
			</div><!--achivement-block-->
			<div class="achivement-block text-center col-md-4">
				<img src="../images/badge2.png" alt="badge">
				<div class="mt-3">
					<h3>Bakery of the Month</h3>
					<span class="date">2022 - 2023</span>
				</div>
			</div><!--achivement-block-->

		</div>
	</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../js/plugins.js"></script>
<script type="text/javascript" src="../js/script.js"></script>



</body></html>