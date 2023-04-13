console.log("Schedule Module.....");

var scheduleService = (function(){
	
	function add(exerciseRecord, callback, error) {
		$.ajax({
			type : 'post',
			url : '/schedule/new',
			data : JSON.stringfy(exerciseRecord),
			contentTupe : "application/json; charset=utf-8",
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
	}
})();