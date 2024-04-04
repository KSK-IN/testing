<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% session.invalidate();
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

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	history.forward();
	window.location.href = '../login';
</script>
</body>
</html>