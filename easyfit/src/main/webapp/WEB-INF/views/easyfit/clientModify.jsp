<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>

<form method="post">
	<label>회원번호</label>
	<input type="number" name="mno" value="${client.mno}" disabled/>	
	<label>Email</label>
	<input type="text" name="memail" value="${client.memail}" /><br />	
	<label>이름</label>
	<input type="text" name="mname" value="${client.mname}" />	
	<label>가입일</label>
	<input type="date" name="mjoindate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${client.mjoindate}"/>' disabled/><br />
	<label>생년월일</label>
	<input type="date" name="mbirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${client.mbirth}"/>'/><br />
	<label>주소</label>
	<input type="text" name="maddress" value="${client.maddress}" /><br />
	
<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	
			
	<button type="submit" class="btn btn-default">Modify</button>
</form>
	

<%@ include file="../includes/footer.jsp" %>