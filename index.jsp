<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
	<jsp:include page="meta.jsp"></jsp:include>
</head>

<body>


<div id="header-wrap">
	<jsp:include page="top-menu.jsp"></jsp:include>

	<jsp:include page="header.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>

</div><!--header-wrap-->

<section id="billboard">
	<div class="main-slider">		
		<% 
			    Connection connect = null;
			    Statement stmt = null;
			    ResultSet result = null;	
			    try{	
			    	connect = DBConnection.getConnection();
			    	stmt = connect.createStatement();
			    	result = stmt.executeQuery("SELECT * FROM cuppiecake.banner where active = 'A';");
		%>
		<% while(result.next()) { %>
		<div class="slider-item">

			<figure>
				<img src="<%= result.getString("image") %>">
			</figure>

			<div class="text-overlay">
				<div class="container">
					<div class="col-md-8">
						<div class="text-content">
							<span class="fs-6 text-muted"><%= result.getString("title") %></span>
							<h2 class="colored padding-xsmall display-1 text-capitalize lh-1 py-2"><a href="#"><%= result.getString("subtitle") %></a>
							</h2>
							<p><%= result.getString("desc") %></p>
							<div class="pix_btn">
								<a href="/shop" class="btn-hvr-effects mt-3">Shop Now</a>
							</div>
					</div>
				</div>
				</div>
			</div><!--content-box-->
			

		</div><!--slider-item-->
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
		
	</div><!--slider-->

</section>

<section class="about-us margin-medium">
	<div class="container">
		<div class="row">
			<div class="nav-tabs-wrap products-tab">

				<h2 class="section-title text-center">About Us</h2>

				<nav>
					<div class="nav nav-tabs padding-small text-hover" id="nav-tab" role="tablist">
						<a class="nav-link active" id="nav-missions-tab" data-bs-toggle="tab"
							data-bs-target="#nav-missions" role="tab" aria-controls="nav-missions"
							aria-selected="true">Our Missions</a>
						<a class="nav-link" id="nav-values-tab" data-bs-toggle="tab"
							data-bs-target="#nav-values" role="tab" aria-controls="nav-values"
							aria-selected="false">Our Values
						</a>
						<a class="nav-link" id="nav-goals-tab" data-bs-toggle="tab" data-bs-target="#nav-goals"
							role="tab" aria-controls="nav-goals" aria-selected="false">Our Goals</a>
					</div>
				</nav>

				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" role="tabpanel" id="nav-missions"
						aria-labelledby="nav-missions-tab">
						<div class="col-md-12">
							<div class="row">

								<div class="col-md-6">
									<div class="product-image"
										style="background-image: url(../images/cupcakebg.jpg);background-size: cover;">
									</div>
								</div>

								<% 
									connect = null;
									stmt = null;
									result = null;	
									    try{	
									    	connect = DBConnection.getConnection();
									    	stmt = connect.createStatement();
									    	result = stmt.executeQuery("SELECT * FROM cuppiecake.aboutus where `type` = 3;");
								%>
								<% while(result.next()) { %>
								<div class="text-content col-md-6 bg-Peach p-5">
									<h3 class="mb-4">
										<%= result.getString("sub_title") %>
									</h3>
									<p><%= result.getString("content") %></p>
									<div class="pix_btn mt-4">
										<a href="about_us" class="btn-hvr-effects">read more</a>
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
						</div><!--content-->
					</div><!--tab-pane-->

					<div class="tab-pane fade" role="tabpanel" id="nav-values" aria-labelledby="nav-values-tab">
						<div class="col-md-12">
							<div class="row">

								<div class="col-md-6">
									<div class="product-image"
										style="background-image: url(../images/tabimg1.jpg);background-size: cover;">
									</div>
								</div>
								<% 
									connect = null;
									stmt = null;
									result = null;	
									    try{	
									    	connect = DBConnection.getConnection();
									    	stmt = connect.createStatement();
									    	result = stmt.executeQuery("SELECT * FROM cuppiecake.aboutus where `type` = 4;");
								%>
								<% while(result.next()) { %>
								<div class="text-content col-md-6 bg-Peach p-5">
									<h3 class="mb-4">
										<%= result.getString("sub_title") %>
									</h3>
									<p><%= result.getString("content") %></p>
									<div class="pix_btn mt-4">
										<a href="about_us" class="btn-hvr-effects">read more</a>
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
						</div><!--col-md-12-->
					</div><!--tab-panel-->

					<div class="tab-pane fade" role="tabpanel" id="nav-goals" aria-labelledby="nav-goals-tab">
						<div class="col-md-12">
							<div class="row">

								<div class="col-md-6">
									<div class="product-image"
										style="background-image: url(../images/cupcakebg.jpg);background-size: cover;">
									</div>
								</div>
								<% 
									connect = null;
									stmt = null;
									result = null;	
									    try{	
									    	connect = DBConnection.getConnection();
									    	stmt = connect.createStatement();
									    	result = stmt.executeQuery("SELECT * FROM cuppiecake.aboutus where `type` = 4;");
								%>
								<% while(result.next()) { %>
								<div class="text-content col-md-6 bg-Peach p-5">
									<h3 class="mb-4">
										<%= result.getString("sub_title") %>
									</h3>
									<p><%= result.getString("content") %></p>
									<div class="pix_btn mt-4">
										<a href="about_us" class="btn-hvr-effects">read more</a>
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
						</div><!--content-->
					</div><!--tab-panel-->

				</div><!--tab-content-->

			</div><!---with-nav-tabs--->
		</div>
	</div>

</section>

<section class="best-products margin-large">
	<div class="container">
		<h2 class="section-title text-center mb-4">Best Product</h2>
		<div class="row">
			<div class="d-flex products-slider">
				<% 
					connect = null;
					stmt = null;
					result = null;	
					try{	
						connect = DBConnection.getConnection();
						stmt = connect.createStatement();
						result = stmt.executeQuery("SELECT * FROM cuppiecake.products where `active` = 'A';");
				%>
				<% while(result.next()) { %>
				<div class="product-item me-3">
					<a href="#" class="product-image"><img src="<%= result.getString("image") %>" class="img-fluid"></a>
					<div class="text-comtent text-center text-hover">
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

			</div><!--slider-->
		</div>
	</div>
</section>


<section class="special-items mb-5">
	<div class="item-content">
		<div class="container">
			<div class="row">
				<div class="col-md-6 color-white">
					<h2 class="section-title color-white mb-4">
						Our Special Chocolate Mousse
					</h2>
					<p>All of our products are made from scratch using family recipes with the highest quality
						ingredients. We bake and sell fresh daily to ensure only the best products are sold to
						our customers.</p>

					<div class="pix_btn mt-4">
						<a class="btn btn-outline-light" href="shop">
							<span>Shop Now</span>
						</a>
					</div>
				</div><!--item-content-->
			</div>
		</div>
	</div>
</section>

<section class="gallery-wrap margin-medium">
	<div class="container-fluid">
		<h2 class="section-title mb-5 text-center">View Our Gallery</h2>
		<div class="row">
			<div class="col-md-3">
				<figure class="mb-4">
					<a class="image-link" href="../images/gallery-item-1.jpg">
						<img src="../images/gallery-thumb-1.jpg" alt="cake" class="img-fluid">
						<div class="overlay">
							<i class="icon icon-search-plus"></i>
						</div><!--imgOverlay-->
					</a>
				</figure>
				<figure class="mb-4">
					<a class="image-link" href="../images/gallery-item-2.jpg">
						<img src="../images/gallery-thumb-2.jpg" alt="cake" class="img-fluid">
						<div class="overlay">
							<i class="icon icon-search-plus"></i>
						</div><!--imgOverlay-->
					</a>
				</figure>
			</div>
			<div class="col-md-3">
				<figure class="mb-4">
					<a class="image-link" href="../images/gallery-item-3.jpg">
						<img src="../images/gallery-thumb-3.jpg" alt="cake" class="img-fluid">
						<div class="overlay">
							<i class="icon icon-search-plus"></i>
						</div><!--imgOverlay-->
					</a>
				</figure>
			</div>
			<div class="col-md-3">
				<figure class="mb-4">
					<a class="image-link" href="../images/gallery-item-4.jpg">
						<img src="../images/gallery-thumb-4.jpg" alt="cake" class="img-fluid">
						<div class="overlay">
							<i class="icon icon-search-plus"></i>
						</div><!--imgOverlay-->
					</a>
				</figure>
				<figure class="mb-4">
					<a class="image-link" href="../images/gallery-item-5.jpg">
						<img src="../images/gallery-thumb-5.jpg" alt="cake" class="img-fluid">
						<div class="overlay">
							<i class="icon icon-search-plus"></i>
						</div><!--imgOverlay-->
					</a>
				</figure>
			</div>
			<div class="col-md-3">
				<figure class="mb-4">
					<a class="image-link" href="../images/gallery-item-6.jpg">
						<img src="../images/gallery-thumb-6.jpg" alt="cake" class="img-fluid">
						<div class="overlay">
							<i class="icon icon-search-plus"></i>
						</div><!--imgOverlay-->
					</a>
				</figure>
			</div>
		</div>
	</div>
</section>

<section class="testimonials-wrap padding-medium">
	<div class="container">
		<div class="row">
			<div class="reviews-content col-md-12 light text-center">
				<h2 class="section-title">Testimonials</h2>
				<div class="testimonial-slider">
					<% 
					connect = null;
					stmt = null;
					result = null;	
					try{	
						connect = DBConnection.getConnection();
						stmt = connect.createStatement();
						result = stmt.executeQuery("SELECT * FROM cuppiecake.testimony where `active` = 'A';");
					%>
					<% while(result.next()) { %>
				
					<div class="testimonials-inner">
						<div class="rating padding-small">
							<i class="icon icon-star"></i>
							<i class="icon icon-star"></i>
							<i class="icon icon-star"></i>
							<i class="icon icon-star"></i>
							<i class="icon icon-star"></i>
						</div>
						<p class="animated zoomIn"><%= result.getString("content") %></p>
						<div class="testimonial-author">
							<img src="<%= result.getString("image") %>" alt="jane">
							<span class="name d-flex justify-content-center mt-3"><%= result.getString("name") %></span>
						</div>
					</div><!--reviews-info-->
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
					
				</div><!--testimonial-slider-->


			</div><!--col-md-12-->
		</div>
	</div>
</section>

<section class="latest-blogs margin-medium">
	<h2 class="section-title text-center mb-5">Latest Blogs</h2>
	<div class="container">
		<div class="row">
			<% 
				connect = null;
				stmt = null;
				result = null;	
					try{	
						connect = DBConnection.getConnection();
						stmt = connect.createStatement();
						result = stmt.executeQuery("SELECT * FROM cuppiecake.blog order by idblog desc limit 1;");
			%>
			<% while(result.next()) { %>
			<div class="col-md-6 left-post pl-0 mb-3">
				<div class="post-content">
					<a href="blog"><img src="../images/postImg1.jpg" alt="cake" class="largeImg img-fluid"></a>
					<div class="content light">
						<span class="highlight"><%= result.getString("created_date") %></span>
						<h3 class="mt-3"><a href="blog"><%= result.getString("title") %></a></h3>
					</div>
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
			
			<div class="col-md-6 right-post pl-0">
			<% 
				connect = null;
				stmt = null;
				result = null;	
					try{	
						connect = DBConnection.getConnection();
						stmt = connect.createStatement();
						result = stmt.executeQuery("SELECT * FROM cuppiecake.blog order by idblog asc limit 2;");
			%>
			<% while(result.next()) { %>
				<div class="post-content mb-3">
					<a href="blog"><img src="../images/postLong.jpg" alt="cake"
							class="horizontalImg img-fluid"></a>
					<div class="content light">
						<span class="highlight"><%= result.getString("created_date") %></span>
						<h3 class="mt-3"><a href="blog"><%= result.getString("title") %></a></h3>
					</div>
				</div><!--post-->
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

	<div class="pix_btn text-center">
		<a href="blog" class="btn-hvr-effects mt-5">read more</a>
	</div>
</section>

<section class="association-with bg-prim padding-small">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul class="d-flex list-unstyled justify-content-between flex-wrap">
					<li><a href="#"><img src="../images/baker.svg" class="brandImg"></a></li>
					<li><a href="#"><img src="../images/bakery.svg" class="brandImg"></a></li>
					<li><a href="#"><img src="../images/thebakery.svg" class="brandImg"></a></li>
					<li><a href="#"><img src="../images/breadcookies.svg" class="brandImg"></a></li>
					<li><a href="#"><img src="../images/bakery.svg" class="brandImg"></a></li>
				</ul>
			</div>
		</div>
	</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../js/plugins.js"></script>
<script type="text/javascript" src="../js/script.js"></script>

</body>
</html>