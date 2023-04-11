<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>

    
    
    				<!-- 운동일자, 작성일자, 회원이름 시작  -------------------------------------------------->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<div>
							<label class="h6">운동일자 : </label>
							<input type="text" id="edate" name="edate" class="h6 text-center">
							<span class="h5">여기 페이지는 아직 기능 구현 전입니다.(23/4/9 16:00)</span>
						</div>
						<span>
							작성일자 : 2023-03-07
						</span>
					</div>
							
					<div>
						<div class="mb-3">
							<label>
							<select>
								<option value="">이영희  0001</option>
								<option value="">이성연  0002</option>
								<option value="">이종우  0003</option>
							</select>
								 님의 운동일지
							</label>
						</div>
					</div>
					<!-- 운동일자, 작성일자, 회원이름 끝 -->
				
					<!-- 운동내역 등록 시작 --------------------------------------->
					<div class="card shadow mb-4">
						<div class="card-body">
						
							<div class="row mb-2">
								<div class="d-sm-flex align-items-center col-lg-10">
									<div class="h6 mb-0 text-gray-900">1번 운동</div>
								</div>
								<div class="col-lg-2 d-inline-block">
									<button class="d-inline-block btn btn-sm btn-primary shadow-sm offset-2">
										<i class="fas text-white-50"></i>
										Favorite(기능X)
									</button>
								</div>
							</div>
							
							
							<div class="row col-lg-12 p-0">	
								<div class="text-center col-lg-3 col-md-3 col-sm-3 col-3 p-0 box">운동</div>
								<div class="text-center col-lg-3 col-md-3 col-sm-3 col-3 p-0 box">세트</div>
								<div class="text-center col-lg-3 col-md-3 col-sm-3 col-3 p-0 box">무게(kg)</div>
								<div class="text-center col-lg-3 col-md-3 col-sm-3 col-3 p-0 box">횟수</div>
							</div>
							
							<div class="row col-lg-12 mb-3">			
								<div class="box text-center col-lg-3 col-md-3 col-sm-3 col-3 p-0 h7">
										<input type="text" id="ename" name="ename"
											   class="text-center h7" disabled>
								</div>
								<div class="box text-center col-lg-3 col-md-3 col-sm-3 col-3 p-0 h7">
										<input type="text" id="erset" name="erset" 
											   class="text-center h7">
								</div>
								<div class="box text-center col-lg-3 col-md-3 col-sm-3 col-3 p-0 h7">
										<input type="text" id="erweight" name="erweight"
											   class="text-center h7">
								</div>
								<div class="box text-center col-lg-3 col-md-3 col-sm-3 col-3 p-0 h7">
										<input type="text" id="ernumber" name="ernumber"
											   class="text-center h7">
								</div>
							</div>
							
							<div class="row">
								<button class="btn btn-primary btn-user btn-block col-lg-12">
									<h5 class="text-center text-white pt-1 px-1">운동 추가(기능X)</h5>
								</button>
							</div>
							<div class="mt-4 float-right">
								<button class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm" onclick="location.href='/easyfit/lessonDetailList?prno=1'">
									<span class="fas fa-sm text-white">목록</span>
								</button>
								<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="location.href='/easyfit/lessonGet?prno=1&edate=2023-03-07'">
									<span class="fas fa-sm text-white">운동 완료</span>
								</button>
							</div>
						</div>			
					</div>
					<!-- 운동내역 등록 끝 -->
				
				
<%@ include file="../includes/footer.jsp" %>				