console.log("PtRecord Module.....");

var ptRecordService = (function(){
	console.log("test");
	function add(ptRecord, callback, error) {
		console.log("add ptRecord........");
		
		$.ajax({
			type : 'post',
			url : '/ptrecord/new',
			data : JSON.stringify(ptRecord),
			contentType : "application/json; charset=utf-8",
			dataType : "text",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	return{
		add : add
	};
})();
