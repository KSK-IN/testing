<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String iactive = request.getParameter("current"); %>
<header id="header">
		<div class="container-fluid">
			<div class="row">

				<nav class="navbar navbar-expand-lg col-md-12">

					<div class="navbar-brand">
						<a href="/home">
							<img src="../../images/main-logo2.png" alt="logo" width="200">
						</a>
					</div>

					<button class="navbar-toggler collapsed" type="button" data-toggle="collapse"
						data-target="#slide-navbar-collapse" aria-controls="slide-navbar-collapse"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"><i class="icon icon-navicon"></i></span>
					</button>

					<div class="navbar-collapse collapse" id="slide-navbar-collapse">
						<ul class="navbar-nav list-inline text-uppercase">
							<li class="nav-item text-hover <% if(iactive.equals("home")){ %> active <% } %>"><a href="/" class="nav-link"
									data-effect="Home">Home</a></li>
							<li class="nav-item text-hover <% if(iactive.equals("aboutus")){ %> active <% } %> "><a href="about_us" class="nav-link"
									data-effect="About Us">About us</a></li>
							<li class="nav-item text-hover <% if(iactive.equals("blog")){ %> active <% } %>" ><a href="blog" class="nav-link"
									data-effect="Blogs">Blog</a></li>
							<li class="nav-item text-hover <% if(iactive.equals("contact")){ %> active <% } %> "><a href="contact" class="nav-link"
									data-effect="Contact">Contact us</a></li>
						</ul>
					</div>

					<div class="action-menu">
						<div class="shopping-cart">
							<a href="shop">
								<i class="icon icon-shopping-cart"></i>
							</a>
						</div>
					</div><!--action-menu-->

				</nav>

			</div>
		</div>

	</header>