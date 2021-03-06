<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="resources/css/datatable.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/bootbox.js"></script>
<script type="text/javascript" src="resources/js/Chart.js"></script>
<script type="text/javascript" src="resources/js/datatable.js"></script>
<script type="text/javascript"	src="resources/js/datatable.bootstrap.js"></script>

<style type="text/css">
.jumbotron {
	padding-top: 9px;
	height: 90px;
	width: 1140px;
}

#accountsfield {
	margin-top: 70px;
	width: 200px;
	float: left;
}
.validate {
	color: red;
}
#notifycheck {
	color: green;
}
#listusers {
	margin-top: 20px;
	margin-left: 40px;
	width: 900px;
	float: left;
}

#tableaccountfield {
	width: 100%;
}

#logoutbtn :HOVER {
	cursor: pointer;
}

.modal-dialog {
	overflow-y: auto;
}
#idInput {
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #F00;
	border-right-color: #F00;
	border-bottom-color: #F00;
	border-left-color: #F00;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- <a class="navbar-brand" href="#">Account Manager</a> -->
			<img class="navbar-brand" alt="CSC banking account manager"
				src="resources/images/CSCLogo.png" id="logo">
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="homeAdmin">Home</a></li>
				<li><a href="createuser" id="addacount">Create New User</a></li>
				<li><a href="viewNew"  id="viewNewAccount">View New <span class="badge" id="numberNew">${accountNew}</span></a></li>
			</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout" id="logoutbtn"><span>Welcome
								${admin.name}!</span> Logout</a></li>
				</ul>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container theme-showcase" role="main"
		style="margin-top: 50px; width: 1170px">
		<div class="jumbotron">
			<h2 style="font-weight: bold; color: red;" align="center">CSC</h2>
		</div>
		
		<div id="listusers">
			<fieldset>
				<legend>Create User</legend>
				<form action="register/create" id="createUserForm"
					method="post"  name ="addUserForm">
					<div class="row modal-body">
						<div class="col-md-6">
							 <div id="idLoginField">  <label><span style="color: red">* </span>Id
								Login ID:</label> <input id="inputIdLogin" type="text" name="loginId"
								class="form-control" required ="required" /></div>
								<label id ="validateIdLogin" class ="validate"></label><br>
							<div id="passwordField"><label><span style="color: red">* </span>Password:</label> <input id ="inputPassword"
								type="password" name="password" class="form-control" required ="required"
								/> </div><label id ="validatePassword" class ="validate"></label><br>
								<div id="FullNameField"><label><span style="color: red">* </span>Full
								Name:</label> <input id ="inputFullname" type="text" name="name" class="form-control"
								required ="required"/></div>
								<label id ="validateFullName" class ="validate"></label><br>
			
								<div id="addressField"><label><span style="color: red">* </span>Address:</label> <input id="inputAddress" type="text"
								name="address" class="form-control" required ="required"/></div>
								<label id ="validateAddress" class ="validate"></label><br>
						</div>
						<div class="col-md-6">
							<div id="genderField"><label><span style="color: red">* </span>Gender: </label> <select
								id="genderselect" name="gender" class="form-control">
								<option value="0">Select</option>
								<option value="Male">Male</option>
  								<option value="Female">Female</option>
 								<option value="Other">Other</option>
							</select>
							<label id ="validateGender" class ="validate"></label><br>
						</div></div>
						
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-info" id="createbtn">
							<span
								class="glyphicon glyphicon-refresh glyphicon-refresh-animate"
								id="btncreatei"></span> <span id="btncreatecontent">Create</span>
						</button>
					</div>

				</form>
			</fieldset>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#createUserForm").submit(function(e) {
				e.preventDefault();
				bootbox.confirm("Create new User?", function(result) {
					 if(result){
						 var data = {};
							$("#createUserForm").serializeArray().map(function(x) {data[x.name] = x.value;});
							$("#btncreatecontent").val("Creating...");
							$("#createbtn").attr('disabled', 'disabled');
							$("#btncreatei").show();
							$.ajax({
								url : "register/create",
								headers : {
									'Accept' : 'application/json',
									'Content-Type' : 'application/json'
								},
								type : "post",
								dataType : 'json',
								data : JSON.stringify(data),
							}).done(function(data){
								if(data !="error"){
									$("#btncreatecontent").val("Create");
									$("#createbtn").removeAttr('disabled');
									$("#btncreatei").hide();
									$("#createUserForm")[0].reset();
									bootbox.alert("Add successful");
									notify("successful");
								}
								else{
									bootbox.alert("Error input data...");
									$("#btncreatecontent").val("Create");
									$("#createbtn").removeAttr('disabled');
								}
							}).fail(function(error){
								bootbox.alert("System Error!");
								$("#btncreatecontent").val("Create");
								$("#createbtn").removeAttr('disabled');
								$("#btncreatei").hide();
							});
					 }
				 }); 
				});						
		});
	</script>
</body>
</html>