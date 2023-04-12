<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/adminHeader.jsp" %>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>               
</div>

<form method="post">	
	<label>이름</label>
	<input type="text" name="tname" /><br />	
	<label>생년월일</label>
	<input type="date" name="tbirth" /><br />		
	<label>성별</label>
	<input type="text" name="tgen" /><br />	
	<label>전화번호</label>
	<input type="text" name="ttel" /><br />		
	<label>주소</label>
	<input type="text" name="taddress" placeholder="(선택)"/><br />	
	<label>ID</label>
	<input type="text" name="tid" /><br />	
	<label>Password</label>
	<input type="text" name="tpassword" /><br />	

<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
<%-- <input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br /> --%>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	

	<button type="submit">작성</button>	
</form>

<%@ include file="../includes/footer.jsp" %>