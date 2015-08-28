$('#searchLogForm').on('submit', function(e){
	e.preventDefault();
	statusSearch = false;
	var formData = JSON.parse(JSON.stringify(jQuery('#searchLogForm').serializeArray()));
	search = true;
	offset = 0;
	$("#startoffset").html(offset + 1);
	$("#endoffset").html(offset + limit);
	getSearchLog(formData);
}); 