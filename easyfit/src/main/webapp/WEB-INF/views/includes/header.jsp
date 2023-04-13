<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- 공통모듈 header 시작 ------------------------------------------------------------------------------->
<!DOCTYPE html>
<html lang="en">
<head>  
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>EasyFit</title>
<!-- 폰트 연결 링크 -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<!-- CSS 연결 링크 -->
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">
<!-- JavaScript 연결 링크 -->
<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.js"></script>
<!-- Page level plugins -->
<script src="/resources/vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
<script src="/resources/js/demo/chart-bar-demo.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jquery datepicker -->
<link rel="stylesheet"
	  href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	  type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- jquery datepicker 끝 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${path}/resources/css/main.css" rel="stylesheet"
	type="text/css">
<script src="${path}/resources/js/board.js"></script>
<script type="text/javaScript" language="javascript"></script>
<script
	src="https://www.lgkids.co.kr/es_all/plugins/jscolor-2.0.5/jscolor.js"></script>
<style TYPE="text/css">

/* 배경색 */
html {
	background-color: #EFEFEF;
}

body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-size: 9pt;
	color: #747474;
}

th {
	font-size: 9pt;
	color: #000000;
}

select {
	font-size: 9pt;
	color: #747474;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

a:link {
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}

a:visited {
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}

a:active {
	font-size: 9pt;
	color: red;
	text-decoration: none;
}

a:hover {
	font-size: 9pt;
	color: red;
	text-decoration: none;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #0030DB;
}

.sun {
	color: #ED0000;
}

.today_button_div {
	float: right;
}

/* 버튼 */
.buttonstyle {
	border: 1px solid #A0D9E2;
	color: #A0D9E2;
	background-color: white;
	margin-bottom: 7px;
	font-weight: bold;
	border-radius: 5px;
	font-size: 10pt;
}

.buttonstyle:hover {
	box-shadow: 0px 15px 20px rgba(131, 131, 131, 0.4);
	transform: translateY(-5px);
	background-color: #A0D9E2;
	color: white;
}

.buttonstyle:focus {
	background-color: #A0D9E2;
	color: white;
	border: 3px solid #c9c9c9;
}

/* 캘린더 사이즈 */
.calendar {
	width: 80%;
	margin: auto;
}

/* 년/월 */
.navigation {
	margin-top: 30px;
	margin-bottom: 5px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

/* 캘린더 꾸미기 */
.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid #A0D9E2;
	margin-bottom: 50px;
	border-collapse: collapse;
}

/* 캘린더 꾸미기 */
.calendar_body .today {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.date {
	margin-bottom: 10px;
}

.sat {
	margin-bottom: 10px;
}

.sun {
	margin-bottom: 10px;
}

/* 캘린더 꾸미기 */
.calendar_body .sat_day {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: white;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #0030DB;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

/* 캘린더 꾸미기 */
.calendar_body .sun_day {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: white;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: #ED0000;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

/* 캘린더 꾸미기 */
.calendar_body .normal_day {
	border: 1px solid #A0D9E2;
	height: 120px;
	background-color: white;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}

.schdule_add_button {
	float: right;
}
/*
      *   게시판 이동 모달
      */
#mask_board_move {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.normal_move_board_modal {
	display: none;
	position: fixed;
	z-index: 10000;
	left: 25% !important;
	top: 15% !important;
	width: 50% !important;
	height: 60% !important;
	border-radius: 12px !important;
	background-color: white !important;
}

.normal_move_board_modal .top {
	background-color: #A0D9E2;
	width: 100%;
	height: 13%;
	border-radius: 12px 12px 0px 0px;
}

.normal_move_board_modal .top .close {
	float: right;
	cursor: pointer;
	color: white;
	font-size: 25px;
	font-weight: bold;
	padding-top: 5px;
	padding-right: 20px;
}

.normal_move_board_modal .top .subject {
	float: left;
	margin-left: 10px;
	margin-top: 20px;
	font-size: 30px;
	font-weight: bold;
	color: white;
	padding-left: 20px;
}

.normal_move_board_modal .bottom {
	width: 100%;
	height: 15%;
	vertical-align: middle;
}

.normal_move_board_modal .bottom .info {
	padding: 10px 15px 10px 15px;
	text-align: left;
	font-size: 12px;
	color: red;
	margin-left: 50px;
}

.normal_move_board_modal .bottom .contents {
	margin: 20px 50px 20px 50px;
	text-align: center;
}

.normal_move_board_modal .bottom .contents .board_select {
	width: 240px;
	height: 40px;
	font-size: 15px;
}

.normal_move_board_modal ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.normal_move_board_modal ul li {
	text-align: left;
	padding: 5px;
	height: 30px;
}

.normal_move_board_modal ul li .text_subject {
	width: 10%;
	height: 100%;
	float: left;
	font-size: 18px;
	vertical-align: middle;
	margin-top: 3px;
}

.normal_move_board_modal ul li .text_desc {
	height: 25px;
	width: 90%;
	float: left;
}

.normal_move_board_modal ul li .text_area_desc {
	width: 90%;
	float: left;
}

.normal_move_board_modal ul li .text_type1 {
	height: 100% !important;
	width: 100%;
	border: 1px solid #A0D9E2;
}

.normal_move_board_modal ul li .textarea_type1 {
	width: 100%;
	font-size: 18px;
	border: 1px solid #A0D9E2;
}

.normal_move_board_modal ul .button_li {
	padding-top: 40px;
	width: 100%;
}

.normal_move_board_modal .bottom .contents .board_move_go {
	width: 100% !important;
	height: 40px;
	font-size: 15px;
}

.date_subject {
	margin: 0px;
	margin-bottom: 5px;
	margin-left: 12px;
	font-size: 12px;
	font-weight: bold;
	border: none;
}

.date_subject:hover {
	border: 1px solid #A0D9E2 !important;
	border-radius: 7px;
}

.radio {
	margin-top: 12px;
	border: 1px solid #A0D9E2;
}

.colorbox {
	margin-top: 5px;
	border: 1px solid #A0D9E2;
}

/********************************일정 삭제 관리***************************************/
#mask_board_manage {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.normal_manage_board_modal {
	display: none;
	position: fixed;
	z-index: 10000;
	left: 25% !important;
	top: 15% !important;
	width: 50% !important;
	height: 60% !important;
	border-radius: 12px !important;
	background-color: white !important;
}

.normal_manage_board_modal .top {
	background-color: #A0D9E2;
	width: 100%;
	height: 13%;
	border-radius: 12px 12px 0px 0px;
}

.normal_manage_board_modal .top .close {
	float: right;
	cursor: pointer;
	color: white;
	font-size: 25px;
	font-weight: bold;
	padding-top: 5px;
	padding-right: 20px;
}

.normal_manage_board_modal .top .subject {
	float: left;
	margin-left: 10px;
	margin-top: 20px;
	font-size: 30px;
	font-weight: bold;
	color: white;
	padding-left: 20px;
}

.normal_manage_board_modal .bottom {
	width: 100%;
	height: 15%;
	vertical-align: middle;
}

.normal_manage_board_modal .bottom .info {
	padding: 10px 15px 10px 15px;
	text-align: left;
	font-size: 12px;
	color: red;
	margin-left: 50px;
}

.normal_manage_board_modal .bottom .contents {
	margin: 20px 50px 20px 50px;
	text-align: center;
}

.normal_manage_board_modal .bottom .contents .board_select {
	width: 240px;
	height: 40px;
	font-size: 15px;
}

.normal_manage_board_modal ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.normal_manage_board_modal ul li {
	text-align: left;
	padding: 5px;
	height: 30px;
}

.normal_manage_board_modal ul li .text_subject {
	width: 10%;
	height: 100%;
	float: left;
	font-size: 18px;
	vertical-align: middle;
	margin-top: 3px;
}

.normal_manage_board_modal ul li .text_desc {
	height: 25px;
	width: 90%;
	float: left;
}

.normal_manage_board_modal ul li .text_area_desc {
	width: 90%;
	float: left;
}

.normal_manage_board_modal ul li .text_type1 {
	height: 100% !important;
	width: 100%;
	border: 1px solid #A0D9E2;
}

.normal_manage_board_modal ul li .textarea_type1 {
	width: 100%;
	font-size: 18px;
	border: 1px solid #A0D9E2;
}

.normal_manage_board_modal ul .button_li {
	padding-top: 40px;
	width: 100%;
}

.normal_manage_board_modal .bottom .contents .board_manage_go {
	width: 45% !important;
	height: 40px;
	font-size: 15px;
	margin: 0 auto;
}

.managebutton {
	width: 60%;
	margin: 0 auto;
	display: flex;
}
</style>
<script>
	var idx;
	var num;
	var subject;
	var desc;
	var date;
	var share;
	var mycolor;
</script>
</head>
<body id="page-top">

<!-- 페이지 전체 영역 시작 -->
	<div id="wrapper">
	
        <!-- 사이드바 시작 -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        
            <!-- 사이드바 - 사이트 로고 -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/trainerPage">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-clipboard"></i>
                </div>
                <div class="sidebar-brand-text mx-3">EasyFit <sup>+</sup></div>
            </a>

            <!-- 구분선 -->
            <hr class="sidebar-divider">

            <!-- 사이드바 - 공지사항 -->
            <li class="nav-item">
                <a class="nav-link" href="/easyfit/noticeList">
                	<i class="fas fa-fw fa-exclamation-circle"></i>
                    <span>공지사항</span>
                </a>
            </li>            
            
            <!-- 사이드바 - 회원관리 -->
            <li class="nav-item">
            	<a class="nav-link" href="/easyfit/allClientList">           		
                    <i class="fas fa-fw fa-user-edit"></i>
                    <span>회원관리</span>
                </a>
            </li>


            <!-- 사이드바 - 운동일지 -->
            <li class="nav-item">
                <a class="nav-link" href="/easyfit/lessonList?tno=<sec:authentication property="principal.trainerVO.tno"/>">
                    <i class="fas fa-fw fa-book"></i>
                    <span>운동일지</span>
                </a>
            </li>
            
            <!-- 사이드바 - 스케줄 -->
            <li class="nav-item">
                <a class="nav-link" href="/easyfit/calendar">
                    <i class="far fa-fw fa-calendar-alt"></i>
                    <span>스케줄</span>
                </a>
            </li>
            
            
            <!-- 사이드바 - 통계 -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>통계</span>
                </a>
            </li>
            
            <!-- 사이드바 토글 버튼 -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- 사이드바 종료 -->

        <!-- 사이드바 제외한 페이지 영역 시작 -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 페이지 영역 시작 -->
            <div id="content">

                <!-- 상단바 -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- 상단 메뉴바 시작 -->
                    <ul class="navbar-nav ml-auto">

                        <!-- 로그인 계정 정보 시작 -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="img-profile rounded-circle" src="/resources/img/undraw_profile.svg">
                                <span class="mr-2 d-none d-lg-inline text-black-600 small">&nbsp;<b><sec:authentication property="principal.trainerVO.tname"/></b> 트레이너 
                                <a href="/logout">
	                                <div>
	                                	<i class="fas fa-sign-out-alt"></i>
	                                </div>
                                </a>
                                </span>
                            </a>
                        </li>
                        <!-- 로그인 계정 정보 종료 -->
                        
                    </ul>
                </nav>
                <!-- 상단 메뉴바 종료 -->

                <!-- 페이지 내용 시작 -->
                <div class="container-fluid">
                
<!-- 공통모듈 header 끝 -->