$('#searchForm').on('submit',  function(e){
	e.preventDefault();
	var formData = JSON.parse(JSON.stringify(jQuery('#searchForm').serializeArray()));
	search = true;
	offset = 0;
	$("#startoffset").html(offset + 1);
	$("#endoffset").html(offset + limit);
	getSearch(formData);
}); 
