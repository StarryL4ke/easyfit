<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal" var="principal"/>					
<sec:authorize access="hasRole('ROLE_ADMIN')"> 
	<%@ include file="../includes/adminHeader.jsp" %>			        
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MANAGER')"> 		        
	<%@ include file="../includes/header.jsp" %>
</sec:authorize>

<div class="card-body shadow bg-light container">
	<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block ">
		<div class="panel-heading col-lg-9 align-items-center justify-content-start mb-4 d-inline-block"> 
			<h1 class="h3 mb-0 text-gray-800">공지사항 수정</h1>
		</div>
			
			<form role="form" action="/easyfit/noticeModify" method="post">


				<div class="form-group mt-3">
					<label class="form-label h5 mr-3">글 제 목 :</label>
					<input class="box width-25" name="ntitle" value='<c:out value="${notice.ntitle}"/>' />
				</div>
<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	


				<div class="form-group mt-3">
					<label class="form-label h5 mr-3">공지 내용</label> <br>
					<textarea class="form-control z-depth-1" name="ncontent" rows="10" cols="100" ><c:out value="${notice.ncontent}"/></textarea>
				</div>

				
				<!-- 수정, 삭제 버튼 -->
				<div class="float-right">
					<button type="submit" data-oper="modify" class="btn btn-info custom-select-sm mb-4">수정완료</button>					
					<button type="button" data-oper="list" class="btn btn-secondary custom-select-sm mb-4" onclick="location.href = '/easyfit/noticeList?nno=${notice.nno}'">목록으로</button>
				</div>
			</form>	
	</div>
</div>

	
	
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('button').on('click', function(e) {
				e.preventDefault();
				
				var oper = $(this).data('oper');
				
				console.log(oper);
				
				if(oper == 'remove') {
					$('form').attr('action', '/easyfit/noticeRemove');
				} else if(oper == 'list') {
					$('form').attr('action', '/easyfit/noticeList').attr('method', 'get');
				} 
					
				$('form').submit();
			});
		});
	</script>
	
<%@ include file="../includes/footer.jsp" %>