<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>





<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>공지사항 - Get</title>


</head>
<body>  
	<h1>공지사항 안내드립니다</h1>

	<form method="post" >
		<label>글번호</label>
		<input type="number" name="nno" value="${notice.nno}" disabled />	



		<div>
			</div>

		<div>
		<label>타이틀</label>
		<input type="text" name="ntitle" value="${notice.ntitle}"  disabled /><br>

		<label class="default">공지 내용</label> <br>
		<textarea name="ncontent" rows="10" cols="50" disabled><c:out value="${notice.ncontent}"/></textarea> <br>
	
		
		<label>작성일자</label>
		<input type="text" name="ndate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.ndate}"/>' disabled/><br />
		
		<label>작성자</label>
		<input type="number" name="tno" value="${notice.tno}" disabled /> <br>	
		
		
		<!-- 수정, 삭제 버튼 -->
		<button type="button" class="btn btn-default" onclick="location.href = '/easyfit/noticeModify?nno=${notice.nno}'">수정·삭제</button>
		
		<button type="button" class="btn btn-default" onclick="location.href = '/easyfit/noticeList?nno=${notice.nno}'">목록으로</button>
	
	
	</form>

	




	
</body>
</html>


<%@ include file="../includes/footer.jsp" %>