<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
<script>
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";
        
$(document).ajaxSend(function(e, xhr, options) { 
xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
}); 
function addRecord(){

		var schedule = {
				prno:$("#prno").val(),
				edate:$("#edate").val()
		}
		console.log(schedule);
	$.ajax({
		type : 'post',
		url : '/easyfit/calendarRegister?mname='+$("#mname").val(),
		data : JSON.stringify(schedule),
		contentType : "application/json; charset=utf-8",
		success : function(result, status, xhr) {
			location.reload();
		},
		error : function(xhr, status, er) {
		}
	})      

}



document.addEventListener('DOMContentLoaded', function() {
	var request = $.ajax({
		url: "/easyfit/calendarDisplay",
		method: "get",
		dataType: "json"
	});
	request.done(function(data){
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		selectable: true,
		dateClick: function(info) {
	        $('#modal-add-event #edate').val(info.dateStr); // 모달 창에서 날짜 설정
	        $('#modal-add-event').modal('show'); // 모달 창 열기
		},
		events: data
	});
	calendar.render();
	});
	request.fail(function( jqXHR, textStatus ){
		alert("Request failed: " + textStatus);
	});
	
});
</script>
<div id='calendar'></div>

<div class="modal fade" id="modal-add-event" tabindex="-1" role="dialog" aria-labelledby="modal-add-event" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal-add-event-title">일정 추가</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<form>
				<div class="form-group">
					<label for="title" class="col-form-label">이 름:</label>
					<input type="text" class="form-control" id="mname" name="mname" required>
				</div>
				<div class="form-group">
					<label for="title" class="col-form-label">PT 회차:</label>
					<input type="text" class="form-control" id="prno" name="prno" required>
				</div>
				<div class="form-group">
					<label for="description" class="col-form-label">PT 예약 날짜:</label>
					<input type="date" class="form-control" id="edate" name="edate"></input>
				</div>
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="save-event" onclick="addRecord()">저장</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>