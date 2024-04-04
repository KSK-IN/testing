<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String val = request.getParameter("form");
%>    
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="#">
		          <span class="align-middle">CuupieCake</span>
		        </a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						Pages
					</li>

					<li class="sidebar-item <% if(val.equals("dashboard")){ %>active <%}%>">
						<a class="sidebar-link" href="dashboard">
			              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
			            </a>
					</li>

					<li class="sidebar-item <% if(val.equals("orders")){ %>active <%}%>">
						<a class="sidebar-link" href="/admin/order">
			              <i class="align-middle" data-feather="chevron-right"></i> <span class="align-middle">Order Details</span>
			            </a>
					</li>
					
					<li class="sidebar-item <% if(val.equals("takeorder")){ %>active <%}%>">
						<a class="sidebar-link" href="/admin/createorder">
			              <i class="align-middle" data-feather="chevron-right"></i> <span class="align-middle">Take Order</span>
			            </a>
					</li>
					
					<li class="sidebar-item <% if(val.equals("updateorders")){ %>active <%}%>">
						<a class="sidebar-link" href="/admin/updateorder">
			              <i class="align-middle" data-feather="chevron-right"></i> <span class="align-middle">Update Order Details</span>
			            </a>
					</li>
					
					<%-- <li class="sidebar-item <% if(val.equals("profile")){ %>active <%}%>">
						<a class="sidebar-link" href="/admin/profile">
			              <i class="align-middle" data-feather="chevron-right"></i> <span class="align-middle">Profile</span>
			            </a>
					</li> --%>
					
					<li class="sidebar-item <% if(val.equals("contact")){ %>active <%}%>">
						<a class="sidebar-link" href="/admin/contact">
			              <i class="align-middle" data-feather="chevron-right"></i> <span class="align-middle">Messages</span>
			            </a>
					</li>
					
					<li class="sidebar-item <% if(val.equals("blog")){ %>active <%}%>">
						<a class="sidebar-link" href="/admin/blog">
			              <i class="align-middle" data-feather="chevron-right"></i> <span class="align-middle">Blogs</span>
			            </a>
					</li>
					
					<li class="sidebar-item <% if(val.equals("about")){ %>active <%}%>">
						<a class="sidebar-link" href="/admin/aboutus">
			              <i class="align-middle" data-feather="chevron-right"></i> <span class="align-middle">About Us Page</span>
			            </a>
					</li>
					
					<li class="sidebar-item <% if(val.equals("product")){ %>active <%}%>">
						<a class="sidebar-link" href="/admin/products">
			              <i class="align-middle" data-feather="chevron-right"></i> <span class="align-middle">Products</span>
			            </a>
					</li>
					
					<li class="sidebar-item <% if(val.equals("testimony")){ %>active <%}%>">
						<a class="sidebar-link" href="/admin/testimony">
			              <i class="align-middle" data-feather="chevron-right"></i> <span class="align-middle">Testimony</span>
			            </a>
					</li>
					
					

				</ul>

			</div>
		</nav>