<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>공지사항 - Get</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script src="/resources/vendor/jquery/jquery.min.js"></script>

<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></script>

<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>





</head>
<body>  
	<h1>공지사항 안내드립니다</h1>
		


	<form method="post" >
		<label>글번호</label>
		<input type="number" name="nno" value="${notice.nno}" readonly />	



		<div>
			</div>

		<div>
		<label>타이틀</label>
		<input type="text" name="ntitle" value="${notice.ntitle}"  readonly /><br>

		<label class="default">공지 내용</label> <br>
		<textarea name="ncontent" rows="10" cols="100" readonly><c:out value="${notice.ncontent}"/></textarea> <br>
	
		
		<label>작성일자</label>
		<input type="text" name="ndate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.ndate}"/>' readonly/><br />
		
		<label>작성자</label>
		<input type="number" name="tno" value="${notice.tno}" readonly /> <br>	
		
		
		<!-- 수정, 삭제 버튼 -->
		<button type="button" class="btn btn-default" onclick="location.href = '/easyfit/noticeModify?nno=${notice.nno}'">수정·삭제</button>
		
		<button type="button" class="btn btn-default" onclick="location.href = '/easyfit/noticeList?nno=${notice.nno}'">목록으로</button>
	
	
	</form>

	




	
</body>
</html>


<%@ include file="../includes/footer.jsp" %>