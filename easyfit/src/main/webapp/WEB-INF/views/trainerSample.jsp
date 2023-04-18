<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="includes/header.jsp" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
<script>
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";

$(document).ajaxSend(function(e, xhr, options) { 
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
}); 

function dateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();
    
    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day; 

    return date.getFullYear() + '-' + month + '-' + day;
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
			initialView: 'dayGridWeek',
			height: 200,
			Boolean, defalut: true,
			locale: 'ko',
			events: data,
			eventClick: function(info) {
				var mname = info.event.title;
				var edate = info.event.start;
				var tno = <sec:authentication property="principal.trainerVO.tno"/>;
			
				// url 구성
				var url = "/easyfit/lessonGet?prno=" + data[0].prno + "&edate=" + dateFormat(edate) + "&tno=" + tno;
				// 페이지 이동
				window.location.href = url;			
				 
				var eventObj = info.event;
	
   	      		if (eventObj.url) {
   	        		alert('Clicked ' + eventObj.title + '.\n' + 'Will open ' + eventObj.url + ' in a new tab');
   	     	 	}   	      
			}
		});
		calendar.render();		
	});
	request.fail(function( jqXHR, textStatus ){
		alert("Request failed: " + textStatus);
	});
});
</script>
 <div id='calendar'></div>
<%@ include file="includes/footer.jsp" %>