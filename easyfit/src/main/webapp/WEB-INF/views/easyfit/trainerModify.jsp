<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/adminHeader.jsp" %>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>                 
</div>

<form method="post">
	<label>트레이너 번호</label>
	<input type="number" name="tno" value="${trainer.tno}" readonly/>	
	<label>ID</label>
	<input type="text" name="tid" value="${trainer.tid}" /><br />	
	<label>이름</label>
	<input type="text" name="tname" value="${trainer.tname}" />	
	<label>전화번호</label>
	<input type="text" name="ttel" value="${trainer.ttel}" /><br />
	<label>생년월일</label>
	<input type="date" name="tbirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainer.tbirth}"/>' /><br />
	<label>주소</label>
	<input type="text" name="taddress" value="${trainer.taddress}" /><br />
	
<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
<%-- <input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br /> --%>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	
			
	<button type="submit" class="btn btn-default">Modify</button>
</form>


<%@ include file="../includes/footer.jsp" %>