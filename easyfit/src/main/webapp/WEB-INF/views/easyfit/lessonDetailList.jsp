<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>                 
</div>

			    
			    <!-- 페이지 이름 -->
		        <div class="col-lg-9 align-items-center justify-content-start mb-4 d-inline-block">
                	<h1 class="h3 mb-0 text-gray-800">운동일지 (운동내역 기준)</h1>
                </div>
			    
				<!-- 운동일지 (운동내역 기준) 목록 시작 (1행 단위 : 1 운동기록 (특정 PT 계약회차 1건에 한정됨))-------------------------------------------------------------------------->
				<div class="card-body">	
					<table class="table table-bordered">
	                    <thead>
	                        <tr>
		                        <th class="width-10 bg-light">No</th>
		                        <th class="width-30 bg-light">운동일자</th>
		                        <th class="width-40 bg-light">작성일시</th>
		                        <th class="width-20 bg-light">PT 수업회차</th>
	                        </tr>
	                    </thead>
	               
		                    <c:forEach items="${exerciseRecordList}" var="list">
			                    <tr>
		                            <td><c:out value="${list.rn}"/></td>
		                            <td><a href='/easyfit/lessonGet?prno=<c:out value="${list.prno}"/>&edate=<fmt:formatDate pattern="yyyy-MM-dd" value="${list.edate}" />'><fmt:formatDate pattern="yyyy-MM-dd" value="${list.edate}" /></a></td>
		                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${list.erdate}" /></td>
		                            <td><c:out value="${list.rn}"/>회차</td>
		                        </tr>
		                    </c:forEach>
	                </table>
				</div>
				<!-- 운동일지 (운동내역 기준) 목록 끝 -->
				
				
				<!-- 페이징 처리 시작 ----------------------------------------------------------------->
				<div align="center" class="d-sm-flex col-lg-12">
					<div class="col-lg-9">
						<ul class="pagination d-sm-flex justify-content-center">
						
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button privious px-2">
									<a href="${pageMaker.startPage - 1}">이전</a> 
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class='paginate_button px-2  ${pageMaker.cri.pageNum == num ? "active" : ""}'>
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>  
										  
							<c:if test="${pageMaker.next}">
								<li class="paginage_button next px-2">
									<a href="${pageMaker.endPage + 1}">다음</a> 
								</li>
							</c:if>
							
						</ul>			  	
					</div>
					
					<!-- 신규 운동일지 작성 버튼-------------------------------------------------------------->
	        		<div class="col-lg-3 d-inline-block" id="ptRbtn2">
	              		<button type="button" class="h8 btn btn-primary" id="regBtn2">신규 운동일지 작성</button>
	           		</div>
				</div>
				<!-- 페이징 처리 끝 -->
				
				
				<!-- hidden 태그 전송용 폼 시작 -->
				<form id="hiddenForm" action="/easyfit/lessonDetailList" method="get">
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
					
					<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
					<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
					<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
				</form>				            
				<!-- hidden 태그 전송용 폼 끝 -->
				
								

<script type="text/javascript">
	$(document).ready(function() {
		
		/* 신규 운동일지 작성 버튼 클릭 이벤트 시작 ******************************************************************/
		$('#regBtn2').on("click", function() {
				
			if($("input[name=prno]") == 0 || $("input[name=prno]") == null) {
				$("#hiddenForm").append('<input type="hidden" name="prno" value="' + $(this).attr("href") + '">');
			}
			$("#hiddenForm").attr("action", "/easyfit/lessonRegister");
			$("#hiddenForm").submit();
		});
		/* 신규 운동일지 작성 버튼 클릭 이벤트 끝 */
		
		
		/* 페이징 이벤트 시작 ******************************************************************/
		$(".paginate_button a").on("click", function(e) {
			
			e.preventDefault(); 
			console.log('click');
			$("#hiddenForm").find("input[name='pageNum']").val($(this).attr("href"));
			$("#hiddenForm").submit();
		});
		/* 페이징 이벤트 끝 */
		
	});
</script>

           
<%@ include file="../includes/footer.jsp" %> 