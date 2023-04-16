<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
<script>
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
<%@ include file="../includes/footer.jsp" %>