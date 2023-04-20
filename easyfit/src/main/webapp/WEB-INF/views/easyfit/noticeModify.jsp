<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
    
<%@ include file="../includes/header.jsp" %>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<body>

	<h1>Notice Board Modification</h1>
	
	<form role="form" action="/easyfit/noticeModify" method="post">

	
		<div>
			<label>글번호</label>
			<input name="nno" value='<c:out value="${notice.nno}"/>' disabled />
		</div>
		<div>
			<label>글제목</label>
			<input name="ntitle" value='<c:out value="${notice.ntitle}"/>' />
		</div>
		<div>
			<label>공지 내용</label> <br>
			<textarea name="ncontent" rows="10" cols="50" ><c:out value="${notice.ncontent}"/></textarea>
		</div>
		
		<!-- <label>최초 공지일</label>
		<input type="text" name="ndate" value='<fmt:formatDate pattern = "yyyy-MM-dd" value="${notice.ndate}"/>' /><br />
		-->
		
		
		<div>
			<label>작성자</label>
			<input name="tno" value='<c:out value="${notice.tno}"/>' disabled />
		</div>
		
		<button type="submit" data-oper="modify" class="btn btn-default">수정완료</button>
		<button type="submit" data-oper="remove" class="btn btn-default">삭제하기</button>
		<button type="button" data-oper="list" class="btn btn-default" onclick="location.href = '/easyfit/noticeList?nno=${notice.nno}'">목록으로</button>
	
	</form>	
	

	
	
	
	
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
	
</body>



<%@ include file="../includes/footer.jsp" %>