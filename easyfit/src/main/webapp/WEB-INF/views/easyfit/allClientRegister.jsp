<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>               
</div>

<form method="post">	
	<!-- <label>회원번호</label>
	<input type="text" name="mno"/> -->
	<label>이름</label>
	<input type="text" name="mname" /><br />	
	<label>생일</label>
	<input type="date" name="mbirth" />	
	<label>성별</label>
	<input type="text" name="mgen" /><br />	
	<label>전화번호</label>
	<input type="text" name="mtel" /><br />	
	<label>주소</label>
	<input type="text" name="maddress" placeholder="(선택)"/><br />	
	<label>가입일</label>
	<input type="date" name="mjoindate" /><br />		
	<label>탈퇴일</label>
	<input type="date" name="mdeldate" placeholder="(선택)"/><br />		
<!--<label>활동여부</label>
	<input type="text" name="misactivity" /><br />-->	
	<label>비고</label>
	<input type="text" name="mmemo" placeholder="(선택)"/><br />	
	<label>이메일</label>
	<input type="text" name="memail" placeholder="(선택)"/><br />	
	
<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	

	<button type="submit">작성</button>	
</form>

<%@ include file="../includes/footer.jsp" %>