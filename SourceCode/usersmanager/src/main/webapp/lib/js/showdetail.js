function showdetail() {
			$("#tableaccounts tbody tr").click(
					function() {
						
						id = $(this).find('.id').html();
						var account;
						for (i = 0; i < accounts.length; i++) {
							if (accounts[i].id == id) {
								account = accounts[i];
								break;
							}
						}
						//set value to modal
						$("#accountdetailmodal input[name=id]").val(
								account.id);
						$("#accountdetailmodal input[name=accountStateId]").val(
								account.state.accountStateId);
						$("#accountdetailmodal input[name=number]").val(
								account.number);
						$("#accountdetailmodal input[name=firstName]").val(
								account.firstName);
						$("#accountdetailmodal input[name=lastName]").val(
								account.lastName);
						$("#accountdetailmodal input[name=midName]").val(
								account.midName);
						$("#accountdetailmodal input[name=idCardNumber]").val(
								account.idCardNumber);
						$("#accountdetailmodal input[name=address01]").val(
								account.address01);
						$("#accountdetailmodal input[name=address02]").val(
								account.address02);
						$("#accountdetailmodal input[name=phoneNumber01]").val(
								"0" + account.phoneNumber01);
						if (account.phoneNumber02 != 0) {
							$("#accountdetailmodal input[name=phoneNumber02]")
									.val("0" + account.phoneNumber02);
						}
						$("#accountdetailmodal input[name=email01]").val(
								account.email01);
						$("#accountdetailmodal input[name=email02]").val(
								account.email02);
						$("#accountdetailmodal select").val(
								account.type.accountTypeId);
						$("#accountdetailmodal").modal('show');
						$("#modifybtn").removeAttr('disabled');
						$("#btnmodifycontent").html("Modify");
						$("#btnmodifyi").hide();
						if(account.state.accountState == "Removable"){
							if(!$("#changestatusbtn").length){
								$("#ftmodal").prepend("<button type='button' class='btn btn-danger' id='changestatusbtn'>Remove</button>");
								changestate();
							}
							$("#changestatusbtn").html("Remove");
						}
						if(account.state.accountState != "Removable"){
							$("#changestatusbtn").html("Change Account State");
						}
						validateFormModify();
					});
		}