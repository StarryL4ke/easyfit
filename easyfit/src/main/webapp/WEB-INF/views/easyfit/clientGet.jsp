<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>                 
</div>

<form method="post">
	<label>회원번호</label>
	<input type="number" name="mno" value="${client.mno}" disabled/>	
	<label>Email</label>
	<input type="text" name="memail" value="${client.memail}" disabled/><br />	
	<label>이름</label>
	<input type="text" name="mname" value="${client.mname}" disabled/>	
	<label>가입일</label>
	<input type="text" name="mjoindate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${client.mjoindate}"/>' disabled/><br />
	<label>생년월일</label>
	<input type="text" name="mbirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${client.mbirth}"/>' disabled/><br />
	<label>주소</label>
	<input type="text" name="maddress" value="${client.maddress}" disabled/><br />
	<h4>PT 이력</h4>
	<table>
		<thead>
			<tr>
				<!-- <th>PT 번호</th> -->
				<th>PT 회차</th>
				<th>PT 기간</th>
				<th>PT 횟수 / PT 전체 회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach  items="${ptRecordList}" var="ptRecordList">
				<tr class="chat" data-prno="${ptRecordList.prno}" data-prstartdate="${ptRecordList.prstartdate}" data-prenddate="${ptRecordList.prenddate}">
					<%-- <td>${ptRecordList.prno}</td> --%>
					<td>${ptRecordList.prturn}</td>
					<td>
						<a href='/easyfit/lessonDetailList?prno=<c:out value="${ptRecordList.prno}"/>'>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${ptRecordList.prstartdate}" />
								 ~ 
							<fmt:formatDate pattern="yyyy-MM-dd" value="${ptRecordList.prenddate}" />\
						</a>
					</td>
					<td>${ptRecordList.prcount} / ${ptRecordList.prcountall}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->		

	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ptModal">PT 등록</button>	
	<button type="button" onclick="location.href = '/easyfit/clientModify?mno=${client.mno}'">Modify</button>
	<button type="button" onclick="location.href = '/easyfit/clientRemove?mno=${client.mno}&tno=<sec:authentication property="principal.trainerVO.tno"/>'">Remove</button>
</form>

<!-- PT등록 모달 시작 --------------------------------------------------------------------------------------------------------------------------------------->

<div class="modal fade" id="ptModal" tabindex="-1" role="dialog" aria-labelledby="ptModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="ptModalLabel">PT 등록</h5>
				<button type="button" class="close"	data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<!--<div class="form-group">
					<label for="prno">PT등록번호</label>
					<input type="number" class="form-control" id="prno" name="prno">
				</div>-->
				<input type="hidden" name="mno" value="${client.mno}"> <!-- hidden 태그를 사용하여 이전 화면에서 전달된 회원번호를 모달창에서도 사용할 수 있도록 함 -->
				<div class="form-group">
					<label for="mname">회원이름</label>
					<input type="text" class="form-control" name="mname" value="${client.mname}" disabled> 
				</div>
				
				<div class="form-group">
					<label for="tname">담당 트레이너</label>
					<input type="hidden" class="form-control" id="tno" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" disabled>
					<input type="text" class="form-control" id="tname" name="tname" value="<sec:authentication property="principal.trainerVO.tname"/>" disabled>
				</div>
				
				<div class="form-group">
					<label for="ptTurn">PT 횟수</label>
					<input type="number" class="form-control" id="ptTurn" name="prturn">
				</div>
				<div class="form-group">
					<label for="ptStartDate">PT 시작일</label>
					<input type="date" class="form-control" id="ptStartDate" name="prstartdate">
				</div>
				<div class="form-group">
					<label for="ptEndDate">PT 종료일</label>
					<input type="date" class="form-control" id="ptEndDate" name="prenddate">
				</div>
				<div class="form-group">
					<label for="ptCount">PT 진행 회차</label>
					<input type="number" class="form-control" id="ptCount" name="prcount">
				</div>
				<div class="form-group">
					<label for="ptCountAll">PT 전체 회차</label>
					<input type="number" class="form-control" id="ptCountAll" name="prcountall">
				</div>
				<div class="form-group">
					<label for="ptMemo">비고</label>
					<input type="text" class="form-control" id="ptMemo" name="prmemo">
				</div>
<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
<%-- <input type="hidden" name="${_csrf.parameterName}" id="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning" data-dismiss="modal">Modify</button>
		        <button id='modalRemoveBtn' type="button" class="btn btn-danger" data-dismiss="modal">Remove</button>
		        <button id='modalRegisterBtn' type="button" class="btn btn-primary" data-dismiss="modal">Register</button>
		        <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- PT등록 모달 종료 --------------------------------------------------------------------------------------------------------------------------------------->

<script type="text/javascript" src="/resources/js/ptrecord.js"></script><!-- 모달 적용을 위한 JS 파일 -->

<script>
$(document).ready(function() {
	
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";        
	
	$(document).ajaxSend(function(e, xhr, options) { 
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	}); 
	

	var modal = $(".modal");
    /* var modalInputPrno = modal.find("input[name='prno']"); */
	var mnoValue = '<c:out value="${client.mno}"/>';
    var modalInputTno = modal.find("input[name='tno']");
    var modalInputPrTurn = modal.find("input[name='prturn']");
    var modalInputPrStartDate = modal.find("input[name='prstartdate']");
    var modalInputPrEndDate = modal.find("input[name='prenddate']");
    var modalInputPrCount = modal.find("input[name='prcount']");
    var modalInputPrCountAll = modal.find("input[name='prcountall']");
    

    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
	
    modalRegisterBtn.on("click",function(e){
    e.preventDefault();
    
        var ptRecord = {

	            tno:modalInputTno.val(),
	            prturn:modalInputPrTurn.val(),
	            prstartdate:modalInputPrStartDate.val(),
	            prenddate:modalInputPrEndDate.val(),
	            prcount:modalInputPrCount.val(),
	            prcountall:modalInputPrCountAll.val(),

	            mno:mnoValue
            };
        	console.log(ptRecord);
        	// PT 추가
        	ptRecordService.add(ptRecord, function(result){
          
          		alert(result);
          
	          	modal.find("input").val("");
	          	modal.modal("hide");
          		
	          	location.reload();
        	});
        
      });
    
    // PT 내역 상세보기
    $(".chat").on("click", function(e){
        
        var prno = $(this).data("prno");
        var prstartdate = $(this).data("prstartdate");
        var prenddate = $(this).data("prenddate");
        $(".modal").modal("show");
        
        
  		console.log($(this).data("prno"));
        console.log(prno);
        console.log($(this).data("prstartdate"));
        console.log(prenddate);
    	ptRecordService.get(prno, function(ptRecord){
    		modalInputTno.val(ptRecord.tno);
            modalInputPrTurn.val(ptRecord.prturn);
            modalInputPrStartDate.val(prstartdate);
            modalInputPrEndDate.val(prenddate);
            modalInputPrCount.val(ptRecord.prcount);
            modalInputPrCountAll.val(ptRecord.prcountall);
	    	modal.data("prno", ptRecord.prno);
    		
            
            modal.find("button[id !='modalCloseBtn']").hide();
            modalModBtn.show();
            modalRemoveBtn.show();
            
            
            
            $(".modal").modal("show");
    	});
    });
    
    // PT 내역 수정하기
    modalModBtn.on("click", function(e){
        
        var ptRecord = {prno:modal.data("prno"), 
		        		prturn:modalInputPrTurn.val(),
			            prstartdate:modalInputPrStartDate.val(),
			            prenddate:modalInputPrEndDate.val(),
			            prcount:modalInputPrCount.val(),
			            prcountall:modalInputPrCountAll.val()};
        
        ptRecordService.update(ptRecord, function(result){
              
          alert(result);
          modal.modal("hide");
          location.reload();
          
        });
        
      });
    
    // PT 내역 삭제하기
    modalRemoveBtn.on("click", function (e){
    	  var prno = modal.data("prno");
    	  console.log($(this).data("prno"));
  	  	  console.log(prno);
    	  
    	  ptRecordService.remove(prno, function(result){
    	        
    	      alert(result);
    	      modal.modal("hide");
    	      location.reload();
    	      
    	  });    	  
    });
});
</script>

<%@ include file="../includes/footer.jsp" %>