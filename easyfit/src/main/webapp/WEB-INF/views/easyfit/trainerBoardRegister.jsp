<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

<div class="card-body shadow bg-light container">
	<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block ">
		<div class="panel-heading col-lg-9 align-items-center justify-content-start mb-4 d-inline-block">
			<h1 class="h3 mb-0 text-gray-800">트레이너 게시판 등록</h1> 
		</div>
		
		<!-- 공지사항 글목록 -------------------------------------------------------------------------->
		<form role="form" action="/easyfit/trainerBoardRegister" method="post">
			<div>
				<div class="form-group mt-3" style="display:flex; align-items: baseline;">
					<label class="form-label h5 mr-3">제목</label>
					<input class="box width-25" name="tbtitle"  />
				</div>
			</div>
			<div>
				<div class="form-group mt-3">
					<label class="form-label h5 mr-3">작성자</label>
					<input class="box width-10" type="text" name="tname" value='<sec:authentication property="principal.trainerVO.tname"/>'readonly />
					<input type="hidden" name="tid" value='<sec:authentication property="principal.trainerVO.tid"/>' />    
				</div>
			</div>
			<div>
				<div class="form-group mt-3">
					<label class="form-label h5 mr-3">공지 내용</label> <br>
					<textarea  class="form-control z-depth-1" name="tbcontent" rows="10" cols="50" ></textarea>
				</div>
			</div>
			<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
			<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
			<div> 
				<div class="float-right"> 
					<button type="submit" data-oper="register" class="btn btn-primary custom-select-sm mb-4">작성완료</button>
					<button type="reset" class="btn btn-warning custom-select-sm mb-4" onclick="location.href = '/easyfit/trainerBoardRegister'">초기화</button>
					<button type="button" data-oper="list" class="btn btn-secondary custom-select-sm mb-4" onclick="location.href = '/easyfit/trainerBoard?tbno=${trainerboard.tbno}'">목록으로</button>
				</div>
			</div>	
		</form>
	</div>
</div>
		
<%@ include file="../includes/footer.jsp" %>
