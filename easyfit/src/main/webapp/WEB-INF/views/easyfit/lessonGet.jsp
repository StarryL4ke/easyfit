<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page trimDirectiveWhitespaces="true" %>
    
<%@ include file="../includes/header.jsp" %>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>                 
</div>

    
    
    				<!-- 운동일자, 작성일자, 회원이름 시작  -------------------------------------------------->
					<div class="d-sm-flex align-items-center justify-content-between mb-3 h7 ml-2">
						<div>
							<label class="text-gray-800">운동일자 : </label>
							<input type="text" id="edate" name="edate" class="box2 width-40 h7 pr-1" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${vo[0].edate}" />' disabled>
						</div>
 						<div id="getErdate">
							<label class="text-gray-800">작성일자 : </label>
							<input type="text" id="erdate" name="erdate" class="box2 width-40 h7 pr-1" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${vo[0].edate}" />' disabled>
						</div>
					</div>
					
					<div>
						<div class="mb-3">
							<input type="text" id="mname" name="mname" value="${vo[0].mname}"class="text-center box2 width-10" disabled>
							<label class="text-gray-800 h6 ml-1">
								   회원님 운동일지
							</label>
						</div>
					</div>
					<!-- 운동일자, 작성일자, 회원이름 끝 -->
				
				
					<!-- 운동내역 조회 시작 --------------------------------------->
					<div class="card shadow mb-4">
						<div class="card-body px-5 py-4">
							
							<div class="row mb-2">
								<div class="d-sm-flex align-items-center col-lg-12">
									<div class="h7 mb-0 text-gray-800 font-weight-bold">
										운동내역
									</div>
								</div>
							</div>
								
							<div class="row p-0">	
								<div class="box text-center col-lg-1 p-0 h8 text-gray-800 bg-light">순서</div>
								<div class="box text-center col-lg-3 p-0 h8 text-gray-800 bg-light">운동</div>
								<div class="box text-center col-lg-1 p-0 h8 text-gray-800 bg-light">세트</div>
								<div class="box text-center col-lg-1 p-0 h8 text-gray-800 bg-light">무게(kg)</div>
								<div class="box text-center col-lg-1 p-0 h8 text-gray-800 bg-light">횟수</div>
								<div class="box text-center col-lg-5 p-0 h8 text-gray-800 bg-light">코멘트</div>
							</div> 
									
							<c:forEach items="${vo}" var="vo">
								<div class="row">
									<input type="text" id="ergroup" name="ergroup"
										   class="box text-center col-lg-1 h8" value="${vo.ergroup}" disabled>
									<input type="text" id="ename" name="ename"
										   class="box text-center col-lg-3 h8" value="${vo.ename}" disabled>
									<input type="text" id="erset" name="erset"
										   class="box text-center col-lg-1 h8" value="${vo.erset}" disabled>
									<input type="text" id="erweight" name="erweight"
										   class="box text-center col-lg-1 h8 p-0" value="${vo.erweight}" disabled>
									<input type="text" id="ernumber" name="ernumber"
										   class="box text-center col-lg-1 h8" value="${vo.ernumber}" disabled>
									<textarea id="ermemo" name="ermemo" class="box text-center col-lg-5 h8" disabled>${vo.ermemo}</textarea>
								</div>
							</c:forEach>
	
							<div class="mt-4 float-right">
								<button type="button" class="d-sm-inline-block btn btn-success shadow-sm btn-width pt-1" data-oper="list">
									<span class="fas fa-sm text-white h8">목록</span>
								</button>
								<span>&nbsp;</span>
								<button type="button" class="d-sm-inline-block btn btn-primary shadow-sm btn-width pt-1" data-oper="modify"
										onclick="location.href='/easyfit/lessonModify?prno=<c:out value="${vo[0].prno}"/>&edate=<fmt:formatDate pattern="yyyy-MM-dd" value="${vo[0].edate}" />'">
									<span class="fas fa-sm text-white h8">수정</span>
								</button>
								<span>&nbsp;</span>
								<button type="button" class="d-sm-inline-block btn btn-danger shadow-sm btn-width pt-1" data-oper="remove">
									<span class="fas fa-sm text-white h8">삭제</span>
								</button>
							</div>
							
							<form id='operForm' action="/easyfit/lessonRemove" method="post">
								<input type='hidden' id='prno' name='prno' value='<c:out value="${vo[0].prno}"/>'>
								<input type='hidden' id='edate' name='edate' value='<c:out value="${vo[0].edate}"/>'>
								
								<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
								<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
								<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
							</form>
								
						</div>			
					</div>
					<!-- 운동내역 조회 끝 -->
					
					
				<!-- 모달 시작 ----------------------------------------------------------------->
				<div class="modal fade" id="lessonGetModal" tabindex="-1" role="dialog"
					 aria-labelledby="lessonGetModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="lessonGetModalLabel">알림</h4>
							</div>
							<div class="modal-body">${result}가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default close" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 끝-->
				
				
<script type="text/javascript">
	$(document).ready(function() {	
		
		/* 목록, 수정, 삭제 버튼 클릭 이벤트 **********************************/
		var operForm = $("#operForm");
		
		$("button[data-oper='list']").on("click", function(e){
			location.href = '/easyfit/lessonDetailList?&prno=<c:out value="${vo[0].prno}"/>';
		});
		
		$("button[data-oper='remove']").on("click", function(e){
			$('#lessonGetModal').modal("show");
			operForm.submit();											
		});
	
		
	});
</script>		


<%@ include file="../includes/footer.jsp" %>				