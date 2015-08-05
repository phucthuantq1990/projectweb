var search = false;
		var accounts = [];
		var limit = $('#limitTemp').val();
		var offset = $('#offsetTemp').val();
		var total = $('#totalTemp').val;
		var table;
		var newaccounts = $('#accountNew').val();
		var activeaccount = $('#accountActived').val();
		var disableaccount = $('#disableaccount').val();
		var removableaccount = $('#removableaccount').val();
		
		$(document).ready(
				function() {	
					search = false;
					//changestate();
					
					//pre click
					$("#pre").click(function(){
						offset = parseInt($("#startoffset").html()) - 1;
						nOffset = offset - limit;
						if(nOffset < 0) {
							return;
						}
						
						if(nOffset == 0) {
							offset = 0;
							$("#endoffset").html(nOffset + limit);
							$("#startoffset").html(1);
						} else {
							offset = nOffset;
							$("#endoffset").html(offset + limit);
							$("#startoffset").html(offset + 1);
						}
						if(search) {
							//data
							var formData = JSON.parse(JSON.stringify(jQuery('#searchForm').serializeArray()));
							getSearch(formData);
						} else {
							getAccounts();
						};
						
						
					});
					//next click
					$("#next").click(function(){
						offset = parseInt($("#startoffset").html()) - 1;
						nOffset = offset + limit;
						endOffset = parseInt($("#endoffset").html());
                        if(endOffset == total) {
                            return;
                        }

						if(nOffset > total) {
							return;
						}
						
						if(nOffset == total) {
							offset = total - 1;
							$("#endoffset").html(total);
							$("#startoffset").html(total);
						} else {
							offset = nOffset;
							$("#endoffset").html(offset + limit);
							if(offset + limit > total){
								$("#endoffset").html(total);
							}
							$("#startoffset").html(offset + 1);
						}
						if(search) {
							//data
							var formData = JSON.parse(JSON.stringify(jQuery('#searchForm').serializeArray()));
							getSearch(formData);
						} else {
							getAccounts();
						};
						
					});
					//draw table with datatable
					table = $('#tableaccounts').dataTable();
					if(search) {
						getSearch();
					} else {
						getAccounts();
					};
					drawChart();
					
					//modify submit form
					$("#modifyform").submit(function(e){
						e.preventDefault();
						bootbox.confirm("Modify account info?",function(result){
							if(result){
								if(!validateFormModify()){
									return;
								}
								var data = {};
								$("#modifyform").serializeArray().map(function(x) {data[x.name] = x.value;});
								$.ajax({
									url : "managerpage/modify",
								headers : {
									'Accept' : 'application/json',
									'Content-Type' : 'application/json'
								},
								type : "post",
								dataType : 'json',
								data : JSON.stringify(data),
								beforeSend : function(xhr) {
									var token = $("meta[name='_csrf']").attr("content");
									var header = $("meta[name='_csrf_header']").attr("content");
									xhr.setRequestHeader(header,token);
								}
								}).done(function(data){
									if(data != "error"){
									$.each(accounts,function(index){
										if(this.id == data.id) {
											accounts.splice(index,1);
										}
									});
									accounts.push(data);
									redrawTable();
									showdetail();
									$("#accountdetailmodal").modal("hide");
									bootbox.alert("Successful modify!");
									}
									else{
										bootbox.alert("Error input data...");
									}
								}).fail(function(error){
									alert("System Error...");
								});
								$("#btnmodifycontent").html(
										"Modifing...");
								$("#modifybtn").attr(
										'disabled', 'disabled');
								$("#btnmodifyi").show();
							}
						});
					});
				});
		function validateFormModify() {
		    var firstname = document.forms["modifyForm"]["firstName"].value;
		    document.getElementById("validateFirstName").innerHTML = "";
		    $("#firstNameField").attr("class","");
		    var lastname = document.forms["modifyForm"]["lastName"].value;
		    document.getElementById("validateLastName").innerHTML = "";
		    $("#lastNameField").attr("class","");
		    var idCard = document.forms["modifyForm"]["idCardNumber"].value;
		    document.getElementById("validateCardNumber").innerHTML = "";
		    $("#idCardNumberField").attr("class","");
		    var address1 = document.forms["modifyForm"]["address01"].value;
		    document.getElementById("validateAddress01").innerHTML = "";
		    $("#address01Field").attr("class","");
		    var phone1 = document.forms["modifyForm"]["phoneNumber01"].value;
		    document.getElementById("validatePhone1").innerHTML = "";
		    $("#phone01Field").attr("class","");
		    var phone2 = document.forms["modifyForm"]["phoneNumber02"].value;
		    document.getElementById("validatePhone2").innerHTML = "";
		    $("#phone02Field").attr("class","");
		    var result = true;
		    if (firstname.toString().length < 2 || firstname.toString().length > 45) {
		    	var a = "The field has more than 2 and less 45 character.";
		    	document.getElementById("validateFirstName").innerHTML = a;
		    	$("#firstNameField").attr("class","has-error");
		       result = false;
		    }
		    if (lastname.toString().length < 2 || lastname.toString().length > 45) {
		    	var a = "The field has more than 2 and less 45 character.";
		    	document.getElementById("validateLastName").innerHTML = a;
		    	$("#lastNameField").attr("class","has-error");
		       result = false;
		      }
		    if (idCard.toString().length != 9 || isNaN(idCard) == true ) {
		    	var a = "The field has to exactly 9 number.";
		    	document.getElementById("validateCardNumber").innerHTML = a;
		    	$("#idCardNumberField").attr("class","has-error");
		       result = false;
		      }
		    if (address1.toString().length < 5 || address1.toString().length > 200 ) {
		    	var a = "The field has more than 5 and less 200 character.";
		    	document.getElementById("validateAddress01").innerHTML = a;
		    	$("#address01Field").attr("class","has-error");
		       result = false;
		      }
		    if (phone1.toString().length < 10 || isNaN(phone1) == true || phone1.toString().length > 11 ) {
			    	var a = "This number phone is incorect.";
			    	document.getElementById("validatePhone1").innerHTML = a;
			    	$("#phone01Field").attr("class","has-error");
		      		 result = false;
		      }
			if(phone2.toString() != "")
				{ 
				if (phone2.toString().length < 10 || isNaN(phone2) == true || phone2.toString().length > 11 ) {
				
				    	var a = "This number phone is incorect.";
				    	document.getElementById("validatePhone2").innerHTML = a;
				    	$("#phone02Field").attr("class","has-error");
				       result = false;
				      }
				}
			return result;	
		  }
		function drawChart(){
			var pieData = [ {
				value : newaccounts,
				color : "#F5E58E",
				highlight : "#F5E58E",
				label : "New"
			}, {
				value : activeaccount,
				color : "#A7F289",
				highlight : "#A7F289",
				label : "Active"
			}, {
				value : disableaccount,
				color : "#80C9ED",
				highlight : "#80C9ED",
				label : "Disable"
			}, {
				value : removableaccount,
				color : "#EC9292",
				highlight : "#EC9292",
				label : "Removable"
			} ];

			var ctx = document.getElementById("chart-area").getContext(
					"2d");
			window.myPie = new Chart(ctx).Pie(pieData);
		}
		function getAccounts(){
			$.ajax({
				url : "managerpage/getaccounts",
				type : "get",
				dataType : 'json',
				data : {
					'limit' : limit,
					'offset' : offset
				},
				beforeSend : function(xhr) {
					var token = $("meta[name='_csrf']").attr(
							"content");
					var header = $("meta[name='_csrf_header']")
							.attr("content");
					xhr.setRequestHeader(header, token);
				}
			}).done(function(data){
				accounts = data;
				redrawTable();
				showdetail();
			}).fail(function(error){
				bootbox.alert("Error! Please try again later");
				console.log(error);
			});
		}
		
		function getSearch(formData){
			$.ajax({
				url : "managerpage/search?limit="+limit+"&offset="+offset+"",
				type : "POST",
				dataType : 'json',
				data : formData,
				beforeSend : function(xhr) {
					var token = $("meta[name='_csrf']").attr(
							"content");
					var header = $("meta[name='_csrf_header']")
							.attr("content");
					xhr.setRequestHeader(header, token);
				}
			}).done(function(data){
				accounts = data.account;
				total = data.totalSearch;
				$("#totalAccount").html(total);
				redrawTable();
				showdetail();
				$("#searchaccountmodal").modal("hide");
			}).fail(function(error){
				customAlert("Error! Please try again later");
			})
		}
		
		function redrawTable(){
			table.fnClearTable();
			$.each(accounts,function(){
				s = [this.firstName,this.lastName,this.idCardNumber,this.number,this.address01,this.email01,"0"+this.phoneNumber01,this.state.accountState,this.id];
				var a = table.fnAddData(s);
				var oSettings = table.fnSettings();
				var nTr = oSettings.aoData[ a[0] ].nTr;
				if($($(nTr).find('td')[7]).html() == "New"){
					$(nTr).attr("class","warning");
				}
				if($($(nTr).find('td')[7]).html() == "Active"){
					$(nTr).attr("class","success");
				}
				if($($(nTr).find('td')[7]).html() == "Disable"){
					$(nTr).attr("class","info");
				}
				if($($(nTr).find('td')[7]).html() == "Removable"){
					$(nTr).attr("class","danger");
				}
				$($(nTr).find('td')[8]).attr("class",'id');
				$($(nTr).find('td')[8]).attr("style","visibility: hidden;");
			});
		}
		
		
		
		//change status click button
		
		function logout() {
			$("#logoutf").submit();
		}
		function customAlert(msg) {
			$("#alertcontent").html(msg);
			$("#alertbox").modal("show");
		}
		
		function changestate(){
			$("#changestatusbtn").click(function(){
									if($(this).html() == "Remove"){
										bootbox.confirm("Remove the account?",function(result){
											if(result){
												var data = {};
												$("#modifyform").serializeArray().map(function(x) {data[x.name] = x.value;});
												$.ajax({
													url : "managerpage/delete",
													headers : {
														'Accept' : 'application/json',
														'Content-Type' : 'application/json'
													},
													type : "post",
													dataType : 'json',
													data : JSON.stringify(data),
													beforeSend : function(xhr) {
														var token = $("meta[name='_csrf']").attr("content");
														var header = $("meta[name='_csrf_header']").attr("content");
														xhr.setRequestHeader(header,token);
													}
												}).done(function(data){
													if(data == "Successful"){
														removableaccount--;
														$("#removable").html(removableaccount);
														id = $("#accountdetailmodal input[name=id]").val();
														$.each(accounts,function(index){
															if(this.id == id) {
																accounts.splice(index,1);
															}
														});
														total--;
														$("#totalAccount").html(total);
														drawChart();
														redrawTable();
														showdetail();
														$("#accountdetailmodal").modal("hide");
														bootbox.alert("Remove Successful");
													} else {
														bootbox.alert(data);
													}
												}).fail(function(error){
													bootbox.alert("Error!");
												});		
											}
										})
										return;
									}
									$("#changestatusmodal").modal("show");
									$("#accountdetailmodal").modal("hide");
									$("#btnchangei").hide();
									$("#changebtn").removeAttr("disabled");
									id = $("#accountdetailmodal input[name=id]").val();
									var account;
									for (i = 0; i < accounts.length; i++) {
										if (accounts[i].id == id) {
											account = accounts[i];
											break;
										}
									}
									$("#changestatusmodal input[name=number]").val(account.number);
									$("#changestatusmodal input[name=customerName]").val(account.firstName + " " + account.lastName);
									$("#changestatusmodal select[name=accountState]").html("");
									if(account.state.accountState == "New") {
										$("#changestatusmodal select[name=accountState]").append("<option value='"+account.state.accountStateId+"'>"+account.state.accountState+"</option>");
										$("#changestatusmodal select[name=accountState]").append("<option value='"+2+"'>Active</option>");
										$("#changestatusform").attr("acction","managerpage/admin/active");
									}
									if(account.state.accountState == "Active") {
										$("#changestatusmodal select[name=accountState]").append("<option value='"+account.state.accountStateId+"'>"+account.state.accountState+"</option>");
										$("#changestatusmodal select[name=accountState]").append("<option value='"+3+"'>Disable</option>");
										$("#changestatusform").attr("acction","managerpage/admin/disable");
									}
									if(account.state.accountState == "Disable") {
										$("#changestatusmodal select[name=accountState]").append("<option value='"+2+"'>Active</option>");
										$("#changestatusmodal select[name=accountState]").append("<option value='"+account.state.accountStateId+"'>"+account.state.accountState+"</option>");
										$("#changestatusmodal select[name=accountState]").append("<option value='"+4+"'>Removable</option>");
									}
									$("#changestatusmodal select[name=accountState]").val(account.state.accountStateId);
									$("#changestatusmodal input[name=id]").val(account.id);
									
								});
			}
		