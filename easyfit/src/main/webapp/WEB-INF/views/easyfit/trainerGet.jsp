<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/adminHeader.jsp" %>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>                 
</div>

<form method="post">
	<label>트레이너 번호</label>
	<input type="number" name="tno" value="${trainer.tno}" disabled/>	
	<label>ID</label>
	<input type="text" name="tid" value="${trainer.tid}" disabled/><br />	
	<label>이름</label>
	<input type="text" name="tname" value="${trainer.tname}" disabled/>	
	<label>전화번호</label>
	<input type="text" name="ttel" value="${trainer.ttel}" disabled/><br />
	<label>생년월일</label>
	<input type="date" name="tbirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainer.tbirth}"/>' disabled/><br />
	<label>주소</label>
	<input type="text" name="taddress" value="${trainer.taddress}" disabled/><br />
	
<!-- 
	<h4>PT 이력</h4>
	<table>
		<thead>
			<tr>
				<th>PT 회차</th>
				<th>PT 기간</th>
				<th>PT 횟수 / PT 전체 횟수</th>
				<th>담당트레이너</th>
			</tr>
		</thead>		
		<tbody>
			<c:forEach items="${ptRecordList}" var="ptRecordList">
				<tr class="chat" data-prno="${ptRecordList.prno}" data-prstartdate="${ptRecordList.prstartdate}" data-prenddate="${ptRecordList.prenddate}">
					<td>${ptRecordList.prturn}</td>
					<td><a href='/easyfit/lessonDetailList?prno=<c:out value="${ptRecordList.prno}"/>'>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${ptRecordList.prstartdate}" />
								 ~ 
							<fmt:formatDate pattern="yyyy-MM-dd" value="${ptRecordList.prenddate}" />
						</a>
					</td>					
					<td>${ptRecordList.prcount} / ${ptRecordList.prcountall}</td>				
				</tr>
			</c:forEach>
		</tbody>
	</table>
 -->	
		
<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
<%-- <input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br /> --%>
<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
		
	<!-- 
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ptModal">PT 등록</button>
	<button type="button" onclick="location.href = '/easyfit/allClientModify?mno=${client.mno}'">Modify</button>
	<button type="button" onclick="location.href = '/easyfit/allClientRemove?mno=${client.mno}'">Remove</button>
	-->
</form>


<%@ include file="../includes/footer.jsp" %>