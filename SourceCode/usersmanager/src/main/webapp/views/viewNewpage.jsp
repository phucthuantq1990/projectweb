<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>User Manager System Admin Page</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="resources/css/datatable.css" rel="stylesheet" />

<link href="resources/date/css/bootstrap-datepicker.css"
	rel="stylesheet" />
<link href="resources/date/css/bootstrap-datepicker3.css"
	rel="stylesheet" />
<link href="resources/date/css/bootstrap-datepicker.standalone.css"
	rel="stylesheet" />
<link href="resources/date/css/bootstrap-datepicker3.standalone.css"
	rel="stylesheet" />

<!-- my css -->
<link href="resources/myLib/css/manager-page.css" rel="stylesheet" />

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/bootbox.js"></script>
<script type="text/javascript" src="resources/js/Chart.js"></script>
<script type="text/javascript" src="resources/js/datatable.js"></script>
<script type="text/javascript" src="resources/js/datatable.bootstrap.js"></script>
<script type="text/javascript"
	src="resources/date/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="resources/date/js/bootstrap-datepicker.min.js"></script>
<!-- <script type="text/javascript" src="resources/myLib/js/manager-page.js"></script> -->
<script type="text/javascript" src="resources/js/changestatus.js"></script>


<!-- WebSocket -->
<script type="text/javascript"
	src="resources/web-socket/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="resources/web-socket/stomp.js"></script>
<script type="text/javascript"
	src="resources/web-socket/web-socket-admin.js"></script>



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
				<li><a href="" data-toggle="modal"
					data-target="#searchaccountmodal">Search User</a></li>
				<li><a href="#" onclick="viewNewAccount();" id="viewNewAccount">View
						New <span class="badge" id="numberNew">${accountNew}</span>
				</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout" id="logoutbtn"><span>Welcome
							${admin.name}!</span> Logout</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container theme-showcase" role="main"
		style="margin-top: 80px; width: 1170px">
		<div class="jumbotron">
			<h2 style="font-weight: bold; color: red;" align="center">CSC</h2>
		</div>
		<div id="accountsfield">
			<fieldset>
				<legend>Users</legend>
				<table id="tableaccountfield">
					<tr>
						<td><label style="color: #F5E58E;">New:</label></td>
						<td id="new">${accountNew}</td>
					</tr>
					<tr>
						<td><label style="color: #A7F289;">Active:</label></td>
						<td id="active">${accountActived}</td>
					</tr>
					<tr>
						<td><label style="color: #80C9ED;">Disable:</label></td>
						<td id="disable">${accountDisabled}</td>
					</tr>
					<tr>
						<td><label style="color: #EC9292;">Removable:</label></td>
						<td id="removable">${accountRemoveable}</td>
					</tr>
					<tr>
						<td><label>Total:</label></td>
						<td id="total">${accountNew + accountActived + accountDisabled + accountRemoveable}</td>
					</tr>
				</table>
				<div id="canvas-holder" style="margin-top: 30px">
					<canvas id="chart-area" width="180" height="180" />
				</div>
			</fieldset>
		</div>
		<div id="listusers">
			<fieldset>
				<legend>List Users</legend>
				<div id="pageselect"></div>
				<div id="divtableusers" style="margin-top: 20px">
					<table id="tableusers" class="display table table-striped "
						cellspacing="0">
						<thead>
							<tr>
								<td>Login ID</td>
								<td>Password</td>
								<td>Full Name</td>
								<td>Address</td>
								<td>Gender</td>
								<td>State</td>
								<td>Role</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ listuser}" var="item">
								<tr>
									<td>${item.loginId }</td>
									<td>${item.password }</td>
									<td>${item.name }</td>
									<td>${item.address }</td>
									<td>${item.gender }</td>
									<td>${item.state }</td>
									<td>${item.userRole.userRole }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</fieldset>
		</div>
	</div>
	<%@include file="searchaccount.jsp"%>
	<script type="text/javascript">
	<%@include file="../lib/js/changestatus.js"%>
	<%@include file="../lib/js/managerpage.js"%>
	<%@include file="../lib/js/showdetail.js"%>
		
	</script>



<script type="text/javascript">
$(document).ready(function(){
	$("#tableusers tbody tr").click(function(){
		$("#inputloginId").val($($(this).find('td')[0]).html());
		$("#inputPassword").val($($(this).find('td')[1]).html());
		$("#inputFullName").val($($(this).find('td')[2]).html());
		$("#inputAddress").val($($(this).find('td')[3]).html());
		$("#genderselect").val($($(this).find('td')[4]).html());
		$("#stateselect").val($($(this).find('td')[5]).html());
		$("#accountdetailmodal").modal('show');
	});
})
</script>

	<!-- Account detail modal -->

	<div id="accountdetailmodal" class="modal fade" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog">
			<form action="adminmodify" name="modifyForm"
				method="post">
				<!-- Modal content-->
				<div class="modal-content" style="width: 600px">
					<div class="modal-header">
						<h2 style="color: rgb(255, 174, 0); float: left;">User Detail</h2>
						<img style="margin-left: 274px" width="100px" height="60px"
							alt="logo" src="resources/image/CSCLogo.png">
					</div>
					<div class="modal-body">
						<label>Login ID:</label><input type="text" name="loginID"
							class="form-control" required="required" id="inputloginId" readonly="readonly"/>
						<div id="address01Field">
							<label>Full Name:</label> <input type="text" name="fullName"
								class="form-control" required="required" id= "inputFullName" />
						</div>
						<label id="validateAddress01" class="validate"></label><br>
						<div id="firstNameField">
							<label>Password:</label> <input type="password" name="password"
								class="form-control" required="required" id = "inputPassword" />
						</div>
						<label id="validateFirstName" class="validate"></label><br>
						<div id="lastNameField">
							<label>Address:</label> <input type="text" name="address"
								class="form-control" required="required"  id = "inputAddress"/>
						</div>
						<label id="validateLastName" class="validate"></label><br> <label>
							Gender:</label>
						<select id = "genderselect" name="gender">
						<option value="Male">Male</option>
						<option value="Female">Female</option>
						</select>
						 <label>
							State:</label>
						<select id = "stateselect" name="state">
						<option value="new">new</option>
						<option value="enable">enable</option>
						<option value="disable">disable</option>
						</select>
					</div>

					<div class="modal-footer" id="ftmodal">
						<button type="submit" class="btn btn-info" id="modifybtn">
							<span
								class="glyphicon glyphicon-refresh glyphicon-refresh-animate"
								id="btnmodifyi"></span> <span id="btnmodifycontent">Modify</span>
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</form>
		</div>
	</div>



	<!-- change state modal -->

	<div id="changestatusmodal" class="modal fade" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h2 style="color: rgb(255, 0, 136); float: left;">Change User
						State</h2>
					<img style="margin-left: 164px" width="100px" height="60px"
						alt="logo" src="resources/image/CSCLogo.png">
				</div>
				<form action="" id="changestatusform">
					<div class="modal-body">
						<label>Login ID:</label> <input name="number" class="form-control"
							readonly /> <label>Full Name:</label> <input name="customerName"
							class="form-control" readonly /> <label>User state:</label><select
							name="accountState" class="form-control"></select> <input
							name="id" class="form-control" readonly
							style="visibility: hidden;" />
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger" id="changebtn">
							<span
								class="glyphicon glyphicon-refresh glyphicon-refresh-animate"
								id="btnchangei"></span> <span id="btnchangecontent">Change</span>
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>



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