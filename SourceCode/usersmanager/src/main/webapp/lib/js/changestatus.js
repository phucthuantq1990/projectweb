$("#changestatusform").submit(function(e){
						e.preventDefault();
						bootbox.confirm("Modify account information?", function(result) {
							 if(result){
								 id = $("#accountdetailmodal input[name=id]").val();
									var account;
									for (i = 0; i < accounts.length; i++) {
										if (accounts[i].id == id) {
											account = accounts[i];
											break;
										}
									}
									if(account.state.accountState == "Disable") {
										if($("#changestatusmodal select[name=accountState]").val() == 2){
											$("#changestatusform").attr("acction","managerpage/admin/activefromdisable");
										} else
										if($("#changestatusmodal select[name=accountState]").val() == 4){
											$("#changestatusform").attr("acction","managerpage/admin/removable");
										} else {
											bootbox.alert("Choose another account state");
											return;
										}
									}
									$("#btnchangei").show();
									$("#changebtn").attr("disabled","");
									var data = {};
									$("#changestatusform").serializeArray().map(function(x) {data[x.name] = x.value;});
									$.ajax({
										url : $("#changestatusform").attr("acction")+"?accountStateId="+$("#changestatusmodal select[name=accountState]").val(),
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
										if(data == "Successful")
										{
											id = $("#changestatusmodal input[name=id]").val();
											$.each(accounts,function(index){
												if(this.id == id) {
													this.state.accountStateId = $("#changestatusmodal select[name=accountState]").val();
													this.state.accountState = $("#changestatusmodal select[name=accountState] option:selected").text();
												}
											});
											if($("#changestatusform").attr("acction") == "managerpage/admin/active"){
												activeaccount++;
												newaccounts--;
												$("#active").html(activeaccount);
												$("#new").html(newaccounts);
											}
											if($("#changestatusform").attr("acction") == "managerpage/admin/activefromdisable"){
												activeaccount++;
												disableaccount--;
												$("#active").html(activeaccount);
												$("#disable").html(disableaccount);
											}
											if($("#changestatusform").attr("acction") == "managerpage/admin/disable"){
												activeaccount--;
												disableaccount++;
												$("#active").html(activeaccount);
												$("#disable").html(disableaccount);
											}
											if($("#changestatusform").attr("acction") == "managerpage/admin/removable"){
												disableaccount--;
												removableaccount++;
												$("#disable").html(disableaccount);
												$("#removable").html(removableaccount);
											}
											$('#numberNew').html(newaccounts);
											drawChart();
											redrawTable();
											showdetail();
											$("#changestatusmodal").modal("hide");
											bootbox.alert("Change successful");	
										} else {
											bootbox.alert(data);
											$("#btnchangei").hide();
											$("#changebtn").removeAttr("disabled");
										}
									}).fail(function(error){
										bootbox.alert("Error!");
										$("#btnchangei").hide();
										$("#changebtn").removeAttr("disabled");
									});
							 }
						}); 
						
					});