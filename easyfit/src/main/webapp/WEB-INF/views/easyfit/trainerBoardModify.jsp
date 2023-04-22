<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>


<div class="card-body shadow bg-light container">
	<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block ">
		<div class="panel-heading col-lg-9 align-items-center justify-content-start mb-4 d-inline-block"> 
			<h1 class="h3 mb-0 text-gray-800">게시판 글 수정</h1>
		</div>
	
			<form role="form" action="/easyfit/trainerBoardModify" method="post">
				<div>
					<div class="form-group mt-3" style="display:flex; align-items: baseline;">
						<label class="form-label h5 mr-3">글번호</label>
						<input class="box width-10" name="tbno" value='<c:out value="${trainerboard.tbno}"/>' readonly />\
					</div>
				</div>
				<div>
					<div class="form-group mt-3">
						<label class="form-label h5 mr-3">글제목</label>
						<input class="box width-25" name="tbtitle" value='<c:out value="${trainerboard.tbtitle}"/>' />
					</div>
				</div>
				<div>
					<div class="form-group mt-3">	
						<label class="form-label h5 mr-3">작성자</label>
						<input class="box width-10" name="tno" value='<c:out value="${trainerboard.tno}"/>' readonly />
					</div>
				</div>
				<div>
					<div class="form-group mt-3">
						<label class="form-label h5 mr-3">공지 내용</label> <br>
						<textarea class="form-control z-depth-1" name="tbcontent" rows="10" cols="100" ><c:out value="${trainerboard.tbcontent}"/></textarea>
					</div>
				</div>
				
				<!-- 수정, 삭제 버튼 -->
				<div class="float-right">
					<button type="submit" data-oper="modify"  class="btn btn-info custom-select-sm mb-4">수정완료</button>
					<button type="submit" data-oper="remove" class="btn btn-danger custom-select-sm mb-4">삭제하기</button>
					<button type="button" data-oper="list" class="btn btn-secondary custom-select-sm mb-4" onclick="location.href = '/easyfit/trainerBoardList?tbno=${trainerboard.tbno}'">목록으로</button>
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
			$('form').attr('action', '/easyfit/trainerBoardRemove');
		} else if(oper == 'list') {
			$('form').attr('action', '/easyfit/trainerBoardList').attr('method', 'get');
		} 
			
		$('form').submit();
	});
});
</script>

<%@ include file="../includes/footer.jsp" %>