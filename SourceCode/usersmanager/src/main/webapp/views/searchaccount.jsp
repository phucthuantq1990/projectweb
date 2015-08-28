<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />

<div id="searchaccountmodal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
   <div class="modal-content">
    <div class="modal-header"><button class="close" data-dismiss="modal" type="button">&times;</button>

    <h2 style="color: rgb(200, 0, 255); float: left;">Search Account</h2><img alt="logo" height="60px" src="resources/image/CSCLogo.png" style="margin-left: 234px" width="100px"></div>

    <form id="searchForm" name="searchForm" method="post" >
        <div class="modal-body">
            <label>First name:</label> <input class="form-control" name="firstName" type="text"> 
            <label>Mid name:</label> <input class="form-control" name="midName" type="text"> 
            <label>Last name:</label> <input class="form-control" name="lastName" type="text"> 
            <label>Id Card Number:</label> <input class="form-control" name="idCardNumber" type="text"> 
            <label>Address:</label> <input class="form-control" name="address" type="text">
             <label>Phone Number:</label> <input class="form-control" name="phoneNumber" type="text"> 
             <label>Email:</label> <input class= "form-control" name="email" type="email"> 
             <!-- end base info -->
             <!-- for support -->
             <label>Account Type:</label> <select class="form-control" id="accounttypeselect" name="accountTypeId">
                <option value="0">All</option>
                <c:forEach items="${accountTypes}" var="accountType">
					<option value="${accountType.accountTypeId }">${accountType.accountType }</option>
				</c:forEach>
            </select> <label>Account State:</label> <select class="form-control" id="accounttypeselect" name="accountStateId">
                <option value="0">All</option>
                <c:forEach items="${accountStates}" var="accountState">
					<option value="${accountState.accountStateId}">${accountState.accountState}</option>
				</c:forEach>
            </select>
            
        </div>

        <div class="modal-footer">
            <button class="btn btn-info" id="btnCreate" type="submit">
            	<span class="glyphicon glyphicon-refresh glyphicon-refresh-animate" id="btncreatei"></span> 
            		<span id="btncreatecontent">Search</span>
            </button> 
            <button class="btn btn-default" data-dismiss="modal" type="button">Close</button>
        </div>
    </form>
</div>
	</div>
	<script type="text/javascript" src="resources/js/myjs.js"></script>
	<script type="text/javascript">
	$('#sandbox-container .input-daterange').datepicker({
		 autoclose: true
	});
	</script>
</div>