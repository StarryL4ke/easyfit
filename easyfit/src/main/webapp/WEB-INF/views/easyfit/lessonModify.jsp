<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp" %>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>                 
</div>

    
    				<!-- 운동일자, 작성일자, 회원이름 시작  -------------------------------------------------->
    			
					<div class="d-sm-flex align-items-center justify-content-between mb-3 h7 ml-2">
						<div>
							<label class="text-gray-800">운동일자 : </label>
							<input type="date" id="edate" class="box2 width-60 h7 px-2" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${vo[0].edate}" />'>
						</div>
 						<div id="getErdate">
							<label class="text-gray-800">작성일자 : </label>
							<input type="text" id="erdate" class="box2 width-40 h7 pr-1" disabled>
						</div>
					</div>
					
					<div>
						<div class="mb-3">
							<input type="text" id="mname" value="${vo[0].mname}"class="text-center box2 width-10" disabled>
							<label class="text-gray-800 h6 ml-1">
								   회원님 운동일지
							</label>
						</div>
					</div>
					<!-- 운동일자, 작성일자, 회원이름 끝 -->
				
				
					<!-- 운동내역 수정 시작 --------------------------------------->
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
								<div class="box text-center col-lg-1 p-0 h8 text-gray-800 bg-light">무게</div>
								<div class="box text-center col-lg-1 p-0 h8 text-gray-800 bg-light">횟수</div>
								<div class="box text-center col-lg-3 p-0 h8 text-gray-800 bg-light">코멘트</div>
								<div class="text-center col-lg-2 p-0"></div>
							</div> 

							<c:forEach items="${vo}" var="vo">										
								<div class="row">
									<form role="form" action="/easyfit/lessonModify" method="post">
										<input type="hidden" name="prno" value="${vo.prno}">
										<input type="hidden" name="edate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.edate}" />'>
										<input type="hidden" name="erno" value="${vo.erno}">
										<input type="hidden" name="eno" value="${vo.eno}">
										<input type="text" name="ergroup"
											   class="box text-center col-lg-1 h8 ergroup" value="${vo.ergroup}" readonly>
										<input type="text"
											   class="box text-center col-lg-3 h8 ename" value="${vo.ename}" readonly>
										<input type="text" name="erset"
											   class="box text-center col-lg-1 h8 erset" value="${vo.erset}">
										<input type="text" name="erweight"
											   class="box text-center col-lg-1 h8 erweight" value="${vo.erweight}">
										<input type="text" name="ernumber"
											   class="box text-center col-lg-1 h8 ernumber" value="${vo.ernumber}">
										<textarea name="ermemo"
											   class="box lh-150 text-left col-lg-3 h8 ermemo">${vo.ermemo}</textarea> 
										<div class="text-left col-lg-2 d-inline-block">
											<button type="button"  id="pbtn" class="btn btn-outline-dark mb-0 mx-1 h6"> + </button>
											<button type="button"  id="mbtn" class="btn btn-outline-dark mb-0 mx-1 h6"> - </button>
										</div>
																		
									<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
									<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
									<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
									</form>	
								</div>
							</c:forEach>
							
								<div class="col-lg-10 mt-4">
									<button type="button" id="exerciseAddBtn" class="col-lg-12 btn btn-dark">운동 추가</button>
								</div>
	
								<div class="mt-4 mr-5 float-right">
									<button type="button" class="d-sm-inline-block btn btn-success shadow-sm btn-width pt-1" data-oper="back">
										<span class="fas fa-sm text-white h8">Back</span>
									</button>
									<span>&nbsp;</span>
									<button type="button" class="d-sm-inline-block btn btn-primary shadow-sm btn-width-lg pt-1" data-oper="modify">
										<span class="fas fa-sm text-white h8">수정 완료</span>
									</button>
								</div>
						</div>			
					</div>
					<!-- 운동내역 수정 끝 -->
					
			
					
				<!-- 모달 시작 ----------------------------------------------------------------->
				<div class="modal fade" id="lessonModifyModal" tabindex="-1" role="dialog"
					 aria-labelledby="lessonModifyModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="lessonModifyModalLabel">알림</h4>
							</div>
							<div class="modal-body">${result}이 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default close" data-dismiss="modal" id="lessonModifyModalCloseBtn">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 끝-->
					
					
<%-- 				<!-- 운동종목 모달 시작 ---------------------------------------------------------------------------------->
		            <div class="modal fade" id="exerciseTypeModal" tabindex="-1" role="dialog"
		            	aria-labelledby="exerciseTypeModalLabel" aria-hidden="true">
		            
		            	<div class="modal-dialog">
		            		<div class="modal-content">
		            			<div class="modal-header">
		            				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		            				<h4 class="modal-title" id="exerciseTypeModalLabel">운동 종류</h4>
		            			</div>
		            			<div class="modal-body">
									<div class="col-lg-6 justify-content-center">
										<input type='text' name='exerciseName' class='custom-select-sm form-control form-control-sm ml-2' placeholder='운동 검색'>
									</div>
									<div class="col-lg-10">
										<div class="col-lg-10">
											<button type="button" class="btn btn-lg" id="chest">가슴</button>
											<button type="button" class="btn btn-lg" id="lowerBody">하체</button>
											<button type="button" class="btn btn-lg" id="back">등</button>
											<button type="button" class="btn btn-lg" id="shoulder">어깨</button>
											<button type="button" class="btn btn-lg" id="arm">팔</button>
										</div>
										<div class="col-lg-10">
											<div class="col-lg-3">
												<button type="button" class="btn btn-lg" id="barbell">바벨</button>
												<button type="button" class="btn btn-lg" id="dumbbell">덤벨</button>
												<button type="button" class="btn btn-lg" id="machine">기구</button>
												<button type="button" class="btn btn-lg" id="bodyworkouts">맨몸</button>
											</div>
											<div class="col-lg-6">
							                    <c:forEach items="${exerciseTypeList}" var="exerciseTypeList">
						                            <button type="button" id='exerciseType' class="btn btn-lg">
						                            	<c:out value="${exerciseTypeList.ename}" />
						                            </button>
							                    </c:forEach>
											</div>
											<div class="col-lg-10">
												<label class="float-left">선택한 운동 목록</label>
												<div class="form-group" id="exerciseTypeChoice"></div>
											</div>
										</div>
									</div>
		            			</div>
		            			<div class="modal-footer">
		            				<button type="button" id='exerciseTypeSaveBtn' class="btn btn-primary btn-width float-right">등록</button>
		            			</div>
		            		</div>
		            	</div>
		            </div> --%>
           			<!-- 운동종목 모달 끝 -->
				

<script type="text/javascript">
	$(document).ready(function() {	
		
		var url = location.search;
		var url2 = url.substring(1);
		var url3 = url2.split("&");
		var url4 = url3[0].split("=");
		var url5 = url3[1].split("=");
		var prnoValue = url4[1];
		var edateValue = url5[1];
		
		
		/* 작성일자에 오늘 날짜 띄우기 **********************************/
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var day = today.getDate();
		
		$("#erdate").val(year + "-" + month + "-" + day);
		
	
		/* Back, 수정 버튼 클릭 이벤트 **********************************/
		$("button[data-oper='back']").on("click", function(e){
			history.back();
		});

		$("button[data-oper='modify']").on("click", function(e){
			$("#lessonModifyModal").modal("show");
			
			$("#lessonModifyModalCloseBtn").on("click", function(e) {
				location.href="/easyfit/lessonGet?prno=<c:out value='${vo[0].prno}'/>&edate=<fmt:formatDate pattern='yyyy-MM-dd' value='${vo[0].edate}' />";
			});
		}); 
		
		
		/* 내용 수정 체인지(focusout) 이벤트 *************************************/
		
		// 운동일자
		$('#edate').on('change', function() {
			$('input[name="edate"]').val($('#edate').val());
			$('input[name="edate"]').parent().submit();
		});

		// 운동내역 (form 태그)
		$('.ermemo').on('focusout', function() {
			$(this).closest("form").submit();
		});
		
		
		
		
		/* 운동 추가 버튼 클릭 이벤트 ***********************************/
/* 		var modal = $("#exerciseTypeModal");
		var modalInputET = modal.find("input[name='exerciseType']");
		var modalSaveBtn = $('#exerciseTypeSaveBtn');
		var enoValue = '<c:out value="${exerciseTypeList.eno}" />';
	    
		$("#exerciseAddBtn").on("click", function(e) {
			modal.modal('show');
		});
		 */
		
		 
		/* 운동종목 검색 이벤트 ******************************************************************/
/* 		$("#exerciseSearchBtn").on("click", function(e) {
						
		}); */
		
		
		
		/* 운동종목 클릭 이벤트 ********************************************/
/* 		$("#chest").on("click", function() {
			
			
			$("#barbell").on("click", function() {
				
			});
		});
		<button type="button" class="btn-sm">&times;</button>
		<input type="button" class="btn" id=> */
		
		
		/* 운동종목 등록 버튼 클릭 이벤트 ********************************************/
/* 		modalSaveBtn.on("click", function(e) {
			
			var exerciseTypeList = {
				exerciseType: modalInputET.val(),
				eno: enoValue
			};
			
			replyService.add(reply, function(result){ 
				
				alert(result);
				
				modal.find('input').val('');
				modal.modal('hide');

			});
		}); */

		
	});
</script>					
<%@ include file="../includes/footer.jsp" %>				