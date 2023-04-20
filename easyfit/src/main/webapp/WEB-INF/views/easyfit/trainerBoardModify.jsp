<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/resources/vendor/jquery/jquery.min.js"></script>

<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></script>

<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>




</head>
<body>

	<h1>Trainer Board Modification</h1>
	
	<form role="form" action="/easyfit/trainerBoardModify" method="post">

	
		<div>
			<label>글번호</label>
			<input name="tbno" value='<c:out value="${trainerboard.tbno}"/>' readonly />
		</div>
		<div>
			<label>글제목</label>
			<input name="tbtitle" value='<c:out value="${trainerboard.tbtitle}"/>' />
		</div>
		<div>
			<label>공지 내용</label> <br>
			<textarea name="tbcontent" rows="10" cols="100" ><c:out value="${trainerboard.tbcontent}"/></textarea>
		</div>
		
		<!-- <label>최초 공지일</label>
		<input type="text" name="tbdate" value='<fmt:formatDate pattern = "yyyy-MM-dd" value="${trainerboard.tbdate}"/>' /><br />
		-->
		
		
		<div>
			<label>작성자</label>
			<input name="tno" value='<c:out value="${trainerboard.tno}"/>' readonly />
		</div>
		
		<button type="submit" data-oper="modify" class="btn btn-default">수정완료</button>
		<button type="submit" data-oper="remove" class="btn btn-default">삭제하기</button>
		<button type="button" data-oper="list" class="btn btn-default" onclick="location.href = '/easyfit/trainerBoardList?tbno=${trainerboard.tbno}'">목록으로</button>
	
	</form>	
	

	
	
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('button').on('click', function(e) {
				e.preventDefault();
				
				var oper = $(this).data('oper');
				
				console.log(oper);
				
				if(oper == 'remove') {
					$('form').attr('action', '/easyfit/trainerBoardRemove');
				} else if(oper == 'list') {
					$('form').attr('action', '/easyfit/trainerBoardList').attr('method', 'get');
				} 
					
				$('form').submit();
			});
		});
	</script>
	
</body>
</html>


<%@ include file="../includes/footer.jsp" %>