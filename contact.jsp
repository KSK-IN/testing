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
		<jsp:param value="contact" name="current"/>
	</jsp:include>
</div><!--header-wrap-->

<div class="site-banner">
	<div class="banner-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">			
					<div class="text-content colored">
						<h1>Contact Us</h1>
						<div class="breadcum-items">
							<span class="item color-primary"><a href="/home">Home /</a></span>
							<span class="item colored">Contact Us</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!--site-banner-->

<section class="contact-information padding-large mt-3">
	<div class="container">
		<div class="row">
				<div class="col-md-6 p-0 mb-3">
					<div class="container">
					<h2>Get in Touch</h2>

				<div class="contact-detail d-flex flex-wrap mt-4">
					<div class="detail me-6 mb-4">
						<h3>Phones</h3>
						<ul class="list-unstyled">
							<li><i class="icon icon-phone"></i>+1850-243-0000</li>
							<li><i class="icon icon-phone"></i>+1850-245-0000</li>
						</ul>
					</div><!--detail-->
					<div class="detail mb-4">
						<h3>Emails</h3>
						<ul class="list-unstyled">
							<li><i class="icon icon-envelope-o"></i>
								<a href="mailto:info@cuppiecake.com">info@cuppiecake.com</a></li>
							<li><i class="icon icon-envelope-o"></i>
								<a href="mailto:info@cuppiecake.com">info@cuppiecake.com</a></li>
						</ul>
					</div><!--detail-->
					<div class="address detail mb-4">
						<h3>Address</h3>
						<ul class="list-unstyled">
							<li><i class="icon icon-map-marker"></i>
								Juhu Tara Road JW Marriott, Mumbai 400049 India</li>
							<li><i class="icon icon-map-marker"></i>
								Ground Floor 24 Vittal Mallya Road, Bengaluru 560001 India</li>
						</ul>
					</div><!--detail-->					
					<div class="detail mb-4">
						<h3>Social Links</h3>
						<div class="social-links flex-container">
							<a href="#" class="icon icon-facebook"></a>
							<a href="#" class="icon icon-twitter"></a>
							<a href="#" class="icon icon-pinterest-p"></a>
							<a href="#" class="icon icon-youtube"></a>
							<a href="#" class="icon icon-linkedin"></a>
						</div><!--social-links-->
					</div><!--detail-->

				</div><!--contact-detail-->
				</div>
			</div><!--col-md-6-->

			<div class="col-md-6 p-0">
				<div class="container">
					<div class="row">
						<div class="contact-information col-md-12">
						<h2>Send A Message</h2>
							<form name="contactform" id="contact-form" method="post" class="contact-form form-group mt-4">
								<div class="text-input flex-container">
								<input type="text" name="name" id="name" placeholder="Name" class="form-control name me-3 mb-3">
								<input type="text" name="email" id="email" placeholder="E-mail" class="form-control mb-3">
								</div><!--text-input-->
								<textarea name="message" id="message" placeholder="Message" style="height: 150px;"></textarea>
								<div class="app-form-group">
					            	<img alt="Captcha" src="/captcha.jpg">
					            	<input placeholder="Enter Captcha" id="captcha" autocomplete="off">
					            </div>
								<button type="submit" name="submit" class="w-100">Submit</button>
							</form>
						</div><!--contact-information-->
					</div>
				</div>
			</div><!--col-md-6-->

		</div>
	</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $("#contact-form").submit(function(event){
    	event.preventDefault();
	     	if(!$("#name").val()){
	    		alert("Name cannot be left blank.");
	    	}else if(!$("#email").val()){
	    		alert("Email cannot be left blank.");
	    	}else if(!$("#message").val()){
	    		alert("Message cannot be left blank.");
	    	}else if(!$("#captcha").val()){
	    		alert("Please enter the captcha!");
	    	}else if(!validateInput($("#name").val(),5)){
	  			alert("Please provide a valid name!");
	  		}else if(!validateInput($("#email").val(),1)){
	  			alert("Provide a valid email address");
	  		}else if(!validateInput($("#message").val(),5)){
	  			alert("Please enter a valid message. Avoid symbols!");
	  		}else{  
	  			$.ajax({
	  		        data: {"name":$('#name').val(),
	  		        	   "email":$('#email').val(),
	  		        	   "message":$('#message').val(),
	  		        	   "captcha":$('#captcha').val()
	  		        	   },
	  		        type: "POST",
	  		        url: '/sh/contact',
	  		        timeout: 20000,
	  		        contentType: "application/x-www-form-urlencoded",
	  		        dataType: 'json',
					success: function(data){
						console.log(data);
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

</body>
</html>