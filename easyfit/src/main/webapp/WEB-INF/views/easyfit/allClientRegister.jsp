<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>

<div class="card-body shadow bg-light">
<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block ">
		<div class="col-lg-9 align-items-center justify-content-start mb-4 d-inline-block">
			<h1 class="h3 mb-0 text-gray-800">회원 등록</h1>
		</div>
			<form method="post" class="table table-bordered">
				<div class="form-group mt-3">	
					<label class="width-10">이름 : </label>
					<input class="box" type="text" name="mname" /><br />
				</div>
				<div class="form-group mt-3">	
					<label class="width-10">생일 : </label>
					<input class="dateBox"type="date" name="mbirth" />
				</div>
				<div class="form-group mt-3">	
					<label class="width-10 mr-4">성별 : </label>
					 <div class="custom-control custom-radio custom-control-inline ml-4 mr-5">
					    <input class="custom-control-input" type="radio" name="mgen" id="mgen_m" value="M">
					    <label class="custom-control-label" for="mgen_m">남성</label>
					  </div>
					  <div class="custom-control custom-radio custom-control-inline mr-4">
					    <input class="custom-control-input" type="radio" name="mgen" id="mgen_f" value="F">
					    <label class="custom-control-label" for="mgen_f">여성</label>
					  </div>
				</div>
				<div class="form-group mt-3">	
					<label class="width-10">전화번호 : </label>
					<input class="box" type="text" name="mtel" /><br />
				</div>
				<div class="form-group mt-3">	
					<label class="width-10">주소 : </label>
					<input class="box" type="text" name="maddress" placeholder="(선택)"/><br />	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">가입일 : </label>
					<input class="dateBox" type="date" name="mjoindate" /><br />		
				</div>
				<div class="form-group mt-3">
					<label class="width-10">탈퇴일 : </label>
					<input class="dateBox" type="date" name="mdeldate" placeholder="(선택)"/><br />		
				</div>
				<div class="form-group mt-3">
					<label class="width-10">비고 : </label>
					<input class="box" type="text" name="mmemo" placeholder="(선택)"/><br />	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">이메일</label>
					<input class="box" type="text" name="memail" placeholder="(선택)"/><br />	
				</div>
				<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
				<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	
				<div class="text-center">
					<button class="btn btn-primary custom-select-sm btn-width mb-4" type="submit">등록</button>
				</div>	
			</form>
		</div>
	</div>

<%@ include file="../includes/footer.jsp" %>