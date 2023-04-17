<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp" %>

<!-- 23.04.15 : 입력한 내용이 DB에 반영되기는 함. 그러나 여러 건이 입력되지 않고 1건만 입력되며, 마지막 건만 입력되는 듯. ergroup이 마지막 숫자로 들어감.
	그리고 lessonGet으로 넘어가면 내용이 출력되지 않는다.
	그리고 register인지 modify인지 정확히 모르겠는데 어디선가 데이터가 DB에 저장되면 다른 데이터의 ergroup 일부도 +1이 된다. -->

<script>
	var ergroupNo = 0;
</script>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>                 
</div>

    
    				<!-- 운동일자, 작성일자, 회원이름 시작  -------------------------------------------------->
					<div class="d-sm-flex align-items-center justify-content-between mb-3 h7 ml-2">
						<div>
							<label class="text-gray-800">운동일자 : </label>
							<input type="date" id="edate" class="box2 width-60 h7 px-2" value='<fmt:formatDate pattern="yyyy-MM-dd" value="" />'> 
						</div>
 						<div>
							<label class="text-gray-800">작성일자 : </label>
							<input type="text" id="erdate" class="box2 width-40 h7 pr-1" disabled>
						</div>
					</div>
					
					<div>
						<div class="mb-3">
							<input type="text" id="mname" value="${exerciseRecordList.mname}" class="text-center box2 width-10" disabled>
							<label class="text-gray-800 h6 ml-1">
								   회원님 운동일지
							</label>
						</div>
					</div>
					<!-- 운동일자, 작성일자, 회원이름 끝 -->
				
				
					<!-- 운동내역 등록 시작 --------------------------------------->
					<div class="card shadow mb-4">
						<div class="card-body px-5 py-4 mt-2">
							<div id="exerciseRecordRepeat">
								<div class="row m-0 exerciseRecordColumn">
									<div class="align-items-center col-lg-12 p-0 m-0">
										<div class="h7 mb-0 text-gray-800 font-weight-bold my-2 ename">
											<span class="ergroup">0</span>번 운동 : <span class="newEname"></span>
										</div>
										<div class="row p-0 m-0">	
											<div class="box text-center col-lg-2 p-0 m-0 h8 text-gray-800 bg-light">세트</div>
											<div class="box text-center col-lg-2 p-0 m-0 h8 text-gray-800 bg-light">무게</div>
											<div class="box text-center col-lg-2 p-0 m-0 h8 text-gray-800 bg-light">횟수</div>
											<div class="box text-center col-lg-4 p-0 m-0 h8 text-gray-800 bg-light">코멘트</div>
											<div class="text-center col-lg-2 p-0 my-0"></div>
										</div> 
									</div>
								</div>
								
								<form role="form" action="/easyfit/lessonRegister" method="post" class="m-0 exerciseRecordRow">
									<div class="row m-0">
										<input type="hidden" name="prno" value="${exerciseRecordList.prno}">
										<input type="hidden" name="ergroup" value="">
										<input type="hidden" name="edate" value="">
										<input type="hidden" name="erno" value="">
										<input type="hidden" name="eno" value="">
										<input type="text" name="erset" class="box text-center col-lg-2 m-0 h8" value="1">
										<input type="text" name="erweight" class="box text-center col-lg-2 m-0 h8">
										<input type="text" name="ernumber" class="box text-center col-lg-2 m-0 h8">
										<textarea name="ermemo" class="box lh-150 text-left col-lg-4 m-0 h8"></textarea> 
										<div class="text-left col-lg-2 d-inline-block p-0 ml-2">
											<button type="button"  id="pbtn" class="btn btn-outline-dark ml-2 mb-0 mt-2 h6"> + </button>
											<button type="button"  id="mbtn" class="btn btn-outline-dark ml-2 mb-0 mt-2 h6"> - </button>
										</div>
										<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
										<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
									</div>
								</form>
							</div>	
							
							<div class="col-lg-10 mt-4">
								<button type="button" id="exerciseAddBtn" class="col-lg-12 btn btn-dark">운동 추가</button>
							</div>
	
							<div class="mt-4 mr-5 float-right">
								<button type="button" class="d-sm-inline-block btn btn-success shadow-sm btn-width pt-1" data-oper="list">
									<span class="fas fa-sm text-white h8">목록</span>
								</button>
								<span>&nbsp;</span>
								<button type="button" class="d-sm-inline-block btn btn-primary shadow-sm btn-width-lg pt-1" data-oper="register">
									<span class="fas fa-sm text-white h8">작성 완료</span>
								</button>
							</div>
						</div>			
					</div>
					<!-- 운동내역 등록 끝 -->
					
					
	 				<!-- 운동종목 모달 시작 ---------------------------------------------------------------------------------->
		            <div class="modal fade" id="exerciseTypeModal" tabindex="-1" role="dialog"
		            	 aria-labelledby="exerciseTypeModalLabel" aria-hidden="true">
		            
		            	<div class="modal-dialog max-width-800">
		            		<div class="modal-content">
		            			<div class="modal-header">
		            				<h4 class="modal-title ml-2" id="exerciseTypeModalLabel">운동 선택</h4>
		            				<button type="button" class="close mr-2" data-dismiss="modal" aria-hidden="true">&times;</button>
		            			</div>
		            			<div class="modal-body mb-2 center">
									<form id='exerciseTypeChoiceForm' action="/exercisetype" method='get'>
										<div class="col-lg-11 ml-4">
											<div class="row p-0 mb-3">
													<button type="button" class="col btn btn-lg btn-white px-0" id="favorite">Favorite</button>
													<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="D">가슴</button>
													<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="E">하체</button>
													<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="F">등</button>
													<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="G">어깨</button>
													<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="H">팔</button>
											</div>
											<div class="row p-1">
												<div class="col-lg-2 d-inline-block">
													<button type="button" class="btn btn-lg btn-white mb-4 ml-1 exerciseTypeMediumGroup d-none" data-type="W">바벨</button>
													<button type="button" class="btn btn-lg btn-white mb-4 ml-1 exerciseTypeMediumGroup d-none" data-type="X">덤벨</button>
													<button type="button" class="btn btn-lg btn-white mb-4 ml-1 exerciseTypeMediumGroup d-none" data-type="Y">기구</button>
													<button type="button" class="btn btn-lg btn-white ml-1 exerciseTypeMediumGroup d-none" data-type="Z">맨몸</button>
												</div>
												<div class="col-lg-10 d-inline-block modal-scroll">
												</div>
											</div>
										</div>
									</form>
		            			</div>
		            			<div class="modal-footer">
									<div class="col-lg-12">
										<span class="col-lg-12 h7 p-1 mb-2 text-black">선택한 운동 목록</span>
										<div class="col-lg-10 mt-2" id="exerciseTypeChoiceList"></div>
									</div>
			            			<button type="button" id="exerciseTypeSaveBtn" class="btn btn-primary btn-width float-right">등록</button>
		            			</div>
		            		</div>
		            	</div>
		            </div> 
	          		<!-- 운동종목 모달 끝 -->
				
				

<script type="text/javascript">
	$(document).ready(function() {
		
		var url = location.search;
		var url2 = url.substring(1);
		var url3 = url2.split("&");
		var url4 = url3[0].split("=");
		var url5 = url3[1].split("=");
		var prnoValue = url4[1];
		
		
		/* 작성일자, 운동일자에 오늘 날짜 띄우기 **********************************/
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var day = today.getDate();
		
		// 작성일자
		$("#erdate").val(year + "-" + month + "-" + day);
		
		// 운동일자
		$("#edate").on("change", function() {
			
			$("input[name='edate']").val($("#edate").val());
		});
		
	
		/* 목록, 작성 완료 버튼 클릭 이벤트 **********************************/
		$("button[data-oper='list']").on("click", function(){
			
			history.back();
		});

		$("button[data-oper='register']").on("click", function(){
			
			if($("#edate").val() == null || $("#edate").val().length == 0) {
				alert("운동일자를 선택해주세요.");
				return false;
			}
			
			// var form2 = $("form[role='form']").serializeArray();
			
			var formList = new Array();
			$("form[role='form']").each(function(i, item) {
				
				formList.push($(item).val());
			});
			
			$("form[role='form']").submit();
			
		}); 
		
		
		/* 운동종목 모달 관련 변수 선언 *********************************/
 		var modal = $("#exerciseTypeModal");
		var modalSaveBtn = $('#exerciseTypeSaveBtn');
	    
		var split = [];
		var ename = [];
		var enameValue = [];
		
		
		/* 운동 추가 버튼 클릭 이벤트 ***********************************/
		$("#exerciseAddBtn").on("click", function() {
			
			modal.modal("show");
		});

		
		/* 운동종목 클릭 이벤트 ********************************************/
		var type = "";
		var saveType = "";
		var str = "";

		
  		$(".exerciseTypeLargeGroup").on("click", function() {
  			
			type = $(this).data("type");
			saveType = type;
			
			$.getJSON("/exercisetype/" + saveType + ".json", function(data) { 
				
				$(".exerciseTypeMediumGroup").removeClass("d-none");
				
				$.each(data, function(i, item) {
					str += "<button type='button' class='col btn btn-lg btn-white exerciseTypeSmallGroup'>" + item.ename + "</button>"; 
				});
				
				$(".modal-scroll").append(str);

				
			}).fail(function(xhr, status, err) { 
				if(error) { error(); }
				
			});
		});
  		
  		
		$(".exerciseTypeMediumGroup").on("click", function() {
			
			type = $(this).data("type");
			saveType += type;
			
			console.log("saveType : " + saveType);
			
			$.getJSON("/exercisetype/" + saveType + ".json", function(data) {
				
				$(".modal-scroll").children().remove();
				str = "";
				
				$.each(data, function(i, item) {
					str += "<button type='button' class='col btn btn-lg btn-white exerciseTypeSmallGroup'>" + item.ename + "</button>"; 
				});
				
				$(".modal-scroll").append(str);
				
			}).fail(function(xhr, status, err) { 
				if(error) { error(); }
				
			});
		});
		
		
		var chosenExerciseTypeValue = [];
		
		$(".modal-scroll").on("click", "button", function() {
			
			$("#exerciseTypeChoiceList").append("<div class='d-inline-block bg-dark text-white border rounded p-2 h8 append-bg-dark'>" + $(this).html() + "</div>");
			
			chosenExerciseTypeValue.push($(this).html());
			
			$(".exerciseTypeMediumGroup").addClass("d-none");
			
			$(".modal-scroll").children().remove();
			
			str = "";
			
		});
		
		/* 운동종목 저장(등록) 버튼 클릭 이벤트 (모달에 있는 데이터를 register input 태그로 이동) **********************************/
		modalSaveBtn.on("click", function() {

			$.each(chosenExerciseTypeValue, function(i, value) {
	
				var exerciseRecordColumn = $(".exerciseRecordColumn").eq(0).clone();
				var exerciseRecordRow = $(".exerciseRecordRow").eq(0).clone();
				
				
				console.log("ergroupNo : " + ergroupNo);
				console.log(value);
				
				ergroupNo++;
				
				exerciseRecordColumn.find(".ergroup").html(ergroupNo);
				exerciseRecordColumn.find(".newEname").html(value);
				
				exerciseRecordRow.find("input[name='ergroup']").val(ergroupNo);
				exerciseRecordRow.find("input[name='erno']").val("");
				exerciseRecordRow.find("input[name='erweight']").val("");
				exerciseRecordRow.find("input[name='ernumber']").val("");
				exerciseRecordRow.find("input[name='ermemo']").val("");
				
				
				$.getJSON("/exercisetype/eno/" + value + ".json", function(data) {
					
					exerciseRecordRow.find("input[name='eno']").val(data.eno);
					
				}).fail(function(xhr, status, err) { 
					
					if(error) { error(); }
					
				});
			
				
				$("#exerciseRecordRepeat").append(exerciseRecordColumn);
				$("#exerciseRecordRepeat").append(exerciseRecordRow);

			});
			
			$(".exerciseRecordColumn").eq(0).remove();
			$(".exerciseRecordRow").eq(0).remove();
			
			modal.modal("hide");  
		});
		
	
	});
</script>					
<%@ include file="../includes/footer.jsp" %>				