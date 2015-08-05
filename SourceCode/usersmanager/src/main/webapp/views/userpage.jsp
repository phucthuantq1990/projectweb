<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>User Manager System</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="resources/css/datatable.css" rel="stylesheet" />

<link href="resources/date/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="resources/date/css/bootstrap-datepicker3.css" rel="stylesheet" />
<link href="resources/date/css/bootstrap-datepicker.standalone.css" rel="stylesheet" />
<link href="resources/date/css/bootstrap-datepicker3.standalone.css" rel="stylesheet" />

<!-- my css -->
<link href="resources/myLib/css/manager-page.css" rel="stylesheet" />

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/bootbox.js"></script>
<script type="text/javascript" src="resources/js/Chart.js"></script>
<script type="text/javascript" src="resources/js/datatable.js"></script>
<script type="text/javascript" src="resources/js/datatable.bootstrap.js"></script>
<script type="text/javascript" src="resources/date/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="resources/date/js/bootstrap-datepicker.min.js"></script>
<!-- <script type="text/javascript" src="resources/myLib/js/manager-page.js"></script> -->
<script type="text/javascript" src="resources/js/changestatus.js"></script>


<!-- WebSocket -->
<script type="text/javascript" src="resources/web-socket/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="resources/web-socket/stomp.js"></script>
<script type="text/javascript" src="resources/web-socket/web-socket-admin.js"></script>



</head>
<body>
	<input id="limitTemp" value="${limit}" />
	<input id="offsetTemp" value="${offset}" />
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
				<li class="active"><a href="homeUser">Home</a></li>
				<ul class="nav navbar-nav">
				<li class="active"><a href="changepass">Change Password</a></li>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout" id="logoutbtn"><span>Welcome
							${user.loginId}!</span> Logout</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container theme-showcase" role="main"
		style="margin-top: 80px; width: 1170px">
		<div class="jumbotron">
			<h2 style="font-weight: bold;" align="center">CSC</h2>
		</div>
		<div id="accountsfield">
			<fieldset>
				<legend>Profile</legend>
				<table id="tableaccountfield">
					<tr>
						<td><label style="color: #F5E58E;">Login ID:</label></td>
						<td id="new">${user.loginId}</td>
					</tr>
					<tr>
						<td><label style="color: #A7F289;">Full Name:</label></td>
						<td id="active">${user.name}</td>
					</tr>
					<tr>
						<td><label style="color: #80C9ED;">Address:</label></td>
						<td id="disable">${user.address}</td>
					</tr>
					<tr>
						<td><label style="color: #EC9292;">State:</label></td>
						<td id="removable">${user.state}</td>
					</tr>
				</table>
				<div id="canvas-holder" style="margin-top: 30px">
					<canvas id="chart-area" width="180" height="180" />
				</div>
			</fieldset>
		</div>
		<div id="listaccounts">
			<fieldset>
				<legend>Modify Information</legend>
				<form action="usermodify" id="mofifyUserForm"
					method="post"  name ="mofidyForm">
					<div class="row modal-body">
						<div class="col-md-6">
							 <div id="idLoginField">  <label><span style="color: red">* </span>Id
								Login ID:</label> <input id="inputIdLogin" type="text" name="loginId"
								class="form-control" required ="required" disabled="disabled" value="${user.loginId}" /></div>
								<label id ="validateIdLogin" class ="validate"></label><br>
								<div id="FullNameField"><label><span style="color: red">* </span>Full
								Name:</label> <input id ="inputFullname" type="text" name="name" class="form-control"
								required ="required" value="${user.name}"/></div>
								<label id ="validateFullName" class ="validate"></label><br>
			
								<div id="addressField"><label><span style="color: red">* </span>Address:</label> <input id="inputAddress" type="text"
								name="address" class="form-control" required ="required" value="${user.address}"/></div>
								<label id ="validateAddress" class ="validate"></label><br>
						</div>
						<div class="col-md-6">
							<div id="genderField"><label><span style="color: red">* </span>Gender: </label> <select
								id="genderselect" name="gender" class="form-control" >
								<option value="${user.gender}">${user.gender}</option>
								<option value="Male">Male</option>
  								<option value="Female">Female</option>
 								<option value="Other">Other</option>
							</select>
							<label id ="validateGender" class ="validate"></label><br>
						<div class="modal-footer" id="ftmodal">
					<button type="submit" class="btn btn-info" id="modifybtn">
							<span
								class="glyphicon glyphicon-refresh glyphicon-refresh-animate"
								id="btnmodifyi"></span> <span id="btnmodifycontent">Modify</span>
						</button>
					</div>
					</div>
				</div></div></form>
			</fieldset>
			<span style="color: green; font-size: 14" >${message }</span>
		</div>
	</div>
	<%@include file="searchaccount.jsp"%>
	<script type="text/javascript">
		//change state click button
		<%@include file="../lib/js/managerpage.js"%>
		function logout() {
			$("#logoutf").submit();
		}
		function customAlert(msg) {
			$("#alertcontent").html(msg);
			$("#alertbox").modal("show");
		}
		<%@include file="../lib/js/showdetail.js"%>
	</script>

	<!-- message modal -->
	<div id="alertbox" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<p id="alertcontent">Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>