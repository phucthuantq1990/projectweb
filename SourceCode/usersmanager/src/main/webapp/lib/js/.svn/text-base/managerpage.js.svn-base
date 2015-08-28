
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