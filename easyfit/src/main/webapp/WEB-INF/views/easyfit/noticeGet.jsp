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
				<h1 class="h3 mb-0 text-gray-800">공지사항</h1>
			</div>
			
			<form method="post" >
				<div >
					<div class="form-group mt-3" style="display:flex; align-items: baseline;">
						<label class="form-label h5 mr-3">글 번 호 : </label>
						<input class="box width-10" type="number" name="nno" v alue="${notice.nno}" readonly />	
					</div>
					<div class="form-group mt-3">
						<label class="form-label h5 mr-3">타 이 틀 : </label>
						<input class="box width-25" type="text" name="ntitle" value="${notice.ntitle}"  readonly /><br>
					</div>
					<div class="form-group mt-3">
						<label class="form-label h5 mr-3">작 성 일 : </label>
						<input class="dateBox width-20" type="text" name="ndate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.ndate}"/>' readonly/><br />
					</div>
					<div class="form-group mt-3">
						<label class="form-label h5 mr-3">작 성 자 : </label>
						<input class="box width-10" type="text" name="tname" value="${notice.tname}" readonly /> <br>	
					</div>
					<div class="form-group mt-3">
						<label class="form-label h5 mr-3">공지 내용</label> <br>
						<textarea class="form-control z-depth-1" name="ncontent" rows="3"  readonly><c:out value="${notice.ncontent}"/></textarea> <br>
					</div>
				</div>
				<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
				<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
				<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
				<!-- 수정, 삭제 버튼 -->
				<div class="float-right">
				<sec:authentication property="principal" var="principal"/>					
		        <sec:authorize access="hasRole('ROLE_ADMIN')">			        
					<button type="button" class="btn btn-info custom-select-sm mb-4" onclick="location.href = '/easyfit/noticeModify?nno=${notice.nno}'">수정·삭제</button>
		        </sec:authorize>
					<button type="button" class="btn btn btn-secondary custom-select-sm mb-4" onclick="location.href = '/easyfit/noticeList?nno=${notice.nno}'">목록으로</button>
				</div>
			</form>
		</div>
	</div>		

<%@ include file="../includes/footer.jsp" %>