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


</head>
<body> 

	<h1>New Notification - 새로운 공지사항</h1> 

	<!-- 공지사항 글목록 -------------------------------------------------------------------------->

	
		<form role="form" action="/easyfit/noticeRegister" method="post">
			<input type='hidden' name='nno' value='<c:out value="${notice.nno}"/>'>

	
			<!-- <div>
				<label>글번호</label>
				<input name="nno" value='<c:out value="${notice.nno}"/>' readonly />
			</div> -->
			<div>
				<label>제목</label>
				<input name="ntitle"  />
				<!-- value='<c:out value="${notice.ntitle}"/>' -->
			</div>
			<div>
				<label>공지 내용을 입력하세요</label> <br>
				<textarea name="ncontent" rows="10" cols="50" ></textarea>
			</div>
			
			<div>
				<label>작성자</label>
				<input name="tno" value='1' disabled />  
			</div>
			
			<div>
				<label>작성일자</label>
				<input type="text" name="ndate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.ndate}"/>' disabled/><br />
		
			</div>
			<div> 
				<button type="submit" data-oper="register" class="btn btn-default" >작성완료</button>
				<button type="reset" class="btn btn-default" onclick="location.href = '/easyfit/noticeRegister'">초기화</button>
				<button type="button" data-oper="list" class="btn btn-default" onclick="location.href = '/easyfit/noticeList?nno=${notice.nno}'">목록으로</button>
			</div>	
		
		</form>
		
		
		

		
	
		
			

</body>
</html>

<%@ include file="../includes/footer.jsp" %>
