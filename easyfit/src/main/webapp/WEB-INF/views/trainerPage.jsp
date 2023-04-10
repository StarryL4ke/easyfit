<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="includes/header.jsp" %>
<!-- 메인 페이지 시작 ------------------------------------------------------------------------>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">This Week</h1>
</div>
<div>
	<p>사용자 : <sec:authentication property="principal.trainerVO.tname" /></p>
	<p>권한 : <sec:authentication property="principal.trainerVO.trainerAuthList" /></p>                   
</div>
<!-- 달력 - 주간 미니 달력 (Weekly) 시작 ----------------------------------------------------->
<div class="row row-cols-1" id="weekly">
	<div class="date-wrap">
		<div class="button_wrap">
			<button type="button" class="btn" id="week-prev" class="week-move" data-weekly="2023-03-19"> < </button>
				<span id="week-this">2023.03 - 5주차</span>
			<button type="button" class="btn" id="week-next" class="week-move" data-weekly="2023-04-02"> > </button>
		</div>
		<div class="table-responsive-sm">
			<table class="table date-week">
				<thead class="theadcolor">
					<tr>
						<td>일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
					</tr>
				</thead>
				<tbody id="tbl_week">
					<tr>
						<td class="sun">26</td>
						<td class="mon">27</td>
						<td class="tue">28</td>
						<td class="wed">29</td>
						<td class="thu">30</td>
						<td class="fri">31</td>
						<td class="sat">1</td>
					</tr>
					<tr>
						<td class="sun"><br><br><br><br></td>
						<td class="mon"><br><br><br><br></td>
						<td class="tue"><br><br><br><br></td>
						<td class="wed"><br><br><br><br></td>
						<td class="thu"><br><br><br><br></td>
						<td class="fri"><br><br><br><br></td>
						<td class="sat"><br><br><br><br></td>
					</tr>
				</tbody>
			</table>
		</div>	
	</div>
</div>
<!-- 달력 - 주간 미니 달력 (Weekly) 끝 -->
				
				
<!-- 그래프 및 미니 공지사항 영역 시작 ----------------------------------------------------------->
	<div class="row">

<!-- 그래프 시작 ----------------------------------------------------------------------------->
                        <div class="col-xl-6 col-lg-6">
                            <div class="card shadow mb-4">
<!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 PT 현황 요약</h6>
                                </div>
<!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
<!-- 그래프 끝 -->

<!-- 공지사항 시작 -------------------------------------------------------------------------->
	                    <div class="col-lg-5 mb-5">
	                        <div class="card shadow mb-4">
	                            <div class="card-header py-3">
	                                <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
	                            </div>
	                            <div class="card-body">
	                            	<table class="table2">
	                            		<thead class="theadcolor">
	                            			<tr>
	                            				<td>No.</td>
	                            				<td>제목</td>
	                            			</tr>
	                            		</thead>
	                            		<tbody>
	                            			<tr>
	                            				<td>1</td>
	                            				<td>3월 휴무 안내</td>
	                            			</tr>
	                            			<tr>
	                            				<td>2</td>
	                            				<td>코로나 방역 대책 변경 안내</td>
	                            			</tr>
	                            		</tbody>
	                            	</table>
	                            </div>
	                        </div>
	                    </div>
<!-- 공지사항 끝 -->
	                    
                    </div>
<!-- 그래프 및 미니 공지사항 영역 끝 -->
            


            
<%@ include file="includes/footer.jsp" %>