<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- ↓ HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD ↓ -->
	<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title>Co-Mapping</title> <!-- 이거 페이지마다 다르게 하려면? -->
        
        <!-- 쪽지 style? -->
        <style>
         #content-block {
		    display: inline-block;
			width: 19vw;
 		    height: fit-content;		    
 		    white-space: nowrap;
		    overflow: hidden; 
		    border: none;
		} 
		<!-- 캘린더 -->
		#calendar{
		height:38rem;
		}
		</style>
		
		
		<!-- CDN - Bootstrap 4.6.1 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	    integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	    crossorigin="anonymous"/>
	    
	    <!-- CDN - jQuery 3.6.0 -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
        
        <!-- CDN - font-awesome 5.15.3 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
		<!-- CDN - simple-datatables -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        
        
        <!-- CSS - styles.css : 핵심 -->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        
        <!-- CSS - Bootstrap 별도 파일 -->
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- CSS - MetisMenu -->
		<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet"> 
		
		<!-- CSS - sb-admin-2 -->
		<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
		
		<!-- CSS : upload -->
		<link rel="stylesheet" href="/resources/css/upload.css?after" />
	
		<!-- CSS & JS : Calendar -->
        <link href='/resources/fullcalendar-5.11.0/lib/main.css' rel='stylesheet'/>
		<script src='/resources/fullcalendar-5.11.0/lib/main.js'></script>
		<script type='text/javascript'>
			document.addEventListener('DOMContentLoaded', function() {
	  			var calendarEl = document.getElementById('calendar');
	
	  			var calendar = new FullCalendar.Calendar(calendarEl, {
	    			googleCalendarApiKey: 'AIzaSyBJ6ARqJPy-NrJ0QggzxwBnf_Ternk_bLs',
	    			eventSources: [
	    				{googleCalendarId: 'lk931101@gmail.com',
	          			className: '프로젝트',
	          			color: '#be5683', /* rgb,#ffffff 등의 형식으로 할 수 있어요. textColor: 'black' */}
	    			]
	  			});
	  			calendar.render();
			});</script>
        
    	</head>
<!-- ↑ HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD_HEAD ↑ -->

<!-- ↓ BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY_BODY ↓ -->  
		<!-- 헤더 영역 잡는 부분 -->  	
		<body class="sb-nav-fixed">
			<!-- 헤더 상단 영역 nav 잡는 구간 -->
        	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        	
	            <!-- 좌 상단 회사 이름 -->
	            <a class="navbar-brand ps-3" href="/">Co-Mapping</a>
	            
	            <!-- 메뉴 여닫는 버튼 -->
	            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
	            <i class="fas fa-bars"></i></button>
	            
	            <!-- 헤더 검색 영역 : form 제거 후 레이아웃 유지 가능한 지 확인 -->
	            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></form>
	            
	            <!-- 우 상단 비밀번호 변경, 로그아웃 드롭다운 메뉴 -->
	            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
	                <li class="nav-item dropdown">
	                	
	                	<!-- 비밀번호 변경, 로그아웃 드롭다운 메뉴 펼치고 닫는 버튼 -->
	                    <a class="nav-link dropdown-toggle" 
	                    id="navbarDropdown" 
	                    href="#" 
	                    role="button" 
	                    data-bs-toggle="dropdown" 
	                    aria-expanded="false">
	                    <i class="fas fa-user fa-fw"></i></a>
	                    
	                    <!-- 드롭다운 메뉴 내 항목 -->
	                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                       <li><a class="dropdown-item" href="/pwdChange">비밀번호 변경</a></li>
	                        <!-- <li><hr class="dropdown-divider" /></li> -->
	                        <li><sec:authorize access="isAuthenticated()">
									<form action="/logout" method="post" class="dropdown-item">
										<button type="submit" class="dropdown-item">로그아웃</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></form>
								</sec:authorize></li>
	                    </ul>
	                </li>
	            </ul>
	            
	       	</nav>
	        <!-- 헤더 상단 영역 nav 닫는 태그 -->
        
        <!-- 좌측 펼치기 메뉴 -->
		<div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                        	<!-- 좌측 메뉴 전체 헤더
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                             -->
                             
                            <!-- 전자결재 메뉴 -->
                            <!-- 전자결재 메뉴 포괄 헤더 내용 -->
                            <div class="sb-sidenav-menu-heading">전자결재</div>
                            <!-- 전자결재 상위 메뉴 -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseApprovals" aria-expanded="false" aria-controls="collapseApprovals">
                                <div class="sb-nav-link-icon"><i class="fas fa-file-alt"></i></div>
                                전자결재
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <!-- 전자결재 하위 메뉴 -->
                            <div class="collapse" id="collapseApprovals" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/approvalInsert">결재 기안</a>
                                    <a class="nav-link" href="/user/approvalList">결재 조회</a>
                                    <a class="nav-link" href="/user/approvalCommitList">결재 수신</a>
                                </nav>
                            </div>
                            
                            <!-- 업무지원 메뉴 -->
                            <!-- 업무지원 메뉴 포괄 헤더 내용 -->
                            <div class="sb-sidenav-menu-heading">업무지원</div>
                            <!-- 업무지원-인사 상위 메뉴 -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSupports" aria-expanded="false" aria-controls="collapseSupports">
                                <div class="sb-nav-link-icon"><i class="fas fa-building"></i></div>
                                인사
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <!-- 업무지원-인사 하위 메뉴 -->
                            <div class="collapse" id="collapseSupports" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/support/hr/att">근태 리스트</a>
                                </nav>
                            </div>
                            <!-- 업무지원-파견 상위 메뉴 -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseDSupports" aria-expanded="false" aria-controls="collapseDSupports">
                                <div class="sb-nav-link-icon"><i class="fas fa-briefcase"></i></div>
                                파견
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <!-- 업무지원-파견 하위 메뉴 -->
                            <div class="collapse" id="collapseDSupports" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/support/dispatch/att">근태 리스트</a>
                                </nav>
                            </div>
                            
                            <!-- 공지메일 메뉴 -->
                            <!-- 공지메일 메뉴 포괄 헤더 내용 -->
                            <div class="sb-sidenav-menu-heading">메일</div>
                            <!-- 공지메일 상위 메뉴 -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMail" aria-expanded="false" aria-controls="collapseMail">
                                <div class="sb-nav-link-icon"><i class="fas fa-envelope"></i></div>
                                공지메일
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <!-- 공지메일 하위 메뉴 -->
                            <div class="collapse" id="collapseMail" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/email/noticeList">메일 리스트</a>
                                </nav>
                            </div>
                            
                            <!-- 게시판 메뉴 -->
                            <!-- 게시판 메뉴 포괄 헤더 내용 -->
                            <div class="sb-sidenav-menu-heading">게시판</div>
                            <!-- 게시판 상위 메뉴 -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBoards" aria-expanded="false" aria-controls="collapseBoards">
                                <div class="sb-nav-link-icon"><i class="fas fa-clipboard"></i></div>
                                게시판
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <!-- 게시판 하위 메뉴 -->
                            <div class="collapse" id="collapseBoards" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/board/list">커뮤니티</a>
                                </nav>
                            </div>
                           
                            <!-- 관리자 메뉴 -->
                            <!-- 관리자 메뉴 포괄 헤더 내용 -->
                        	<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal" var="info" />
								<c:if test="${info.username == 'admin'}">
                           			<div class="sb-sidenav-menu-heading">관리자</div>
                           			<!-- 관리자 상위 메뉴 -->
		                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseAdmin" aria-expanded="false" aria-controls="collapseAdmin">
		                                <div class="sb-nav-link-icon"><i class="fas fa-certificate"></i></div>
		                                	관리자페이지
		                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
		                            </a>
		                            <!-- 관리자 하위 메뉴 -->
		                            <div class="collapse" id="collapseAdmin" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
		                                <nav class="sb-sidenav-menu-nested nav">
		                                  	 <a class="nav-link" href="/admin/mem/memInsert">사용자 추가하기</a>
		                                   	 <a class="nav-link" href="/admin/mem/memList">사용자 조회하기</a>
		                                   	 <a class="nav-link" href="/admin/company/companyList">원청 조회하기</a>
		                                   	 <a class="nav-link" href="/admin/email/write.do">메일 전송하기</a>
		                                </nav>
		                            </div>
                            	</c:if>
							</sec:authorize>
                            
                        </div>
                    </div>
                    <!-- 좌측 하단 내용: 수정 필요! -->
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as: <div><sec:authentication property="principal.user.mem_name"/></div></div>
                        co-mapping
                    </div>
                </nav>
            </div>