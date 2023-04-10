<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@ include file="../includes/header.jsp" %>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<div>
	<p>TrainerVO : <sec:authentication property="principal.trainerVO" /></p>                 
</div>
			    
<div class="d-sm-flex align-items-center justify-content-between mb-4 ml-2">
	<h1 class="h3 mb-0 text-gray-800"> 모든 회원 목록</h1>	
</div>
<button type="button" class="btn btn-primary custom-select-sm" style="width: 200px;" onclick="location.href='/easyfit/clientList?tno=<sec:authentication property="principal.trainerVO.tno"/>'">나의 회원 조회</button>

<!-- 회원 리스트 시작 -------------------------------------------------------------------------->

<div class="card-body">	
	<table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
	<thead>
		<tr role="row">
			<th class="sorting sorting_desc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" aria-sort="descending" style="width: 86px;">No</th>              
			<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 121px;">회원번호</th>
			<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 65px;">회원이름</th>
			<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 31px;">전화번호</th>
			<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 67px;">가입일</th>
    	</tr>
	</thead>
	<tbody>
		<c:forEach items="${allList}" var="allList">
		<tr>
			<td>${allList.rn}</td>
			<td>${allList.mno}</td>
			<td><a href="/easyfit/allClientGet?mno=${allList.mno}">${allList.mname}</a></td>
			<td>${allList.mtel}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${allList.mjoindate}" /></td>
		</tr>
		</c:forEach> 
	</tbody>
	</table>
</div>

<!-- 회원 리스트 끝 ------------------------------------------------------------------------------->

<!-- 검색 창 시작 --------------------------------------------------------------------------------->	

<form id='searchForm' action="/easyfit/allClientList" method='get'>	
	<select class="form-control" name='type'>
	<%--<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />>----</option>--%>
		<option value="A" <c:out value="${pageMaker.cri.type eq 'A' ? 'selected' : ''}" />>회원이름</option>
		<option value="B" <c:out value="${pageMaker.cri.type eq 'B' ? 'selected' : ''}" />>회원번호</option>	
		<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}" />>전화번호</option>
	</select>	
	<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
	<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
	<input type='hidden' name='amount'	value='<c:out value="${pageMaker.cri.amount}"/>' />
	<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>">
	<button type="submit" class="btn btn-primary custom-select-sm" style="width: 80px;">검색</button>
</form>

<!-- 검색 창 종료 ---------------------------------------------------------------------------------->

<!-- 조회 및 등록 버튼 시작 ------------------------------------------------------------------------>

<div class="ml-4">
	<button type="button" class="btn btn-primary custom-select-sm" style="width: 80px;" onclick="location.href='/easyfit/allClientRegister'">회원등록</button>
</div>

<!-- 조회 및 등록 버튼 종료 ------------------------------------------------------------------------>

<!-- 페이지 시작 ----------------------------------------------------------------------------------->

<ul class="pagination justify-content-center mb-5">
	<c:if test="${pageMaker.prev}">
		<li class="paginate_button page-item previous disabled" id="dataTable_previous">
		<a href="${pageMaker.startPage -1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
	</c:if>	
	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		<li class='paginate_button page-item ${pageMaker.cri.pageNum == num ? "active" : ""}'>
			<a href="/easyfit/allClientList?pageNum=${num}&amount=10" aria-controls="dataTable" data-dt-idx="${num}" tabindex="0" class="page-link">${num}</a>
		</li>
	</c:forEach>				
	<c:if test="${pageMaker.next}">
		<li class="paginate_button page-item next" id="dataTable_next">
			<a href="${pageMaker.endPage +1 }" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
		</li>
 	</c:if>
</ul>

<!-- 페이지 종료 ----------------------------------------------------------------------------------->            	

<%@ include file="../includes/footer.jsp" %>