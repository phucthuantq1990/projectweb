<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/bootbox.js"></script>

<style type="text/css">
#loginForm {
	width: 80%;
	margin: 0% auto;
}

#btnLogin {
	width: 28%;
	height: 34px;
	margin-top: 3%;
	margin-bottom: 12px;
	margin-left: 35%;
}

.divLoginForm {
	border-radius: 25px;
	border: 1px solid black;
	width: 460px;
	margin: 15% auto;
}

.form-control {
	width: 100%;
}

label {
	font-weight: bold;
}

.error {
	margin-top: 3%;
	margin-bottom: 0px;
}

.msg {
	margin-top: 3%;
	margin-bottom: 0px;
}
</style>
</head>
<body>
	<div class="divLoginForm">
	<form id="loginForm"
			action="login2" method='POST'>
			<h2 align="center">User Manager System</h2>
			<label for="username">Login ID:</label> <input type="text"
				name="loginId" class="form-control" placeholder="Username" /> <label
				for="password">Password:</label> <input type="password"
				name="password" class="form-control" placeholder="Password" />
			<div>
				<label>Remember me ?  <input type="checkbox" id="remember"
					name="remember_me" value="true" /></label>
			</div>
			<span style="color:red">${failed}</span>
			<input type="submit" class="btn btn-success" id="btnLogin" name="login" value="Login">
			<input type="submit" class="btn btn-success" id="btnRegister" name="register" value="Register">
		</form>
	</div>


</body>
<script type="text/javascript">
$.ready(function(){
	});
	
</script>
</html>