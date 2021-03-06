<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<title>DingPet.</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="/resources/images/favicon.png" rel="icon" type="image/png">
	
	
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?v=8">
	
	<!--css 추가-->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="https://assets.mypetlife.co.kr/map/wp-content/themes/listify/css/style.min.css?v=3">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css?v=3">
	
	<!-- Font Awesome 아이콘 -->
	<script src="https://kit.fontawesome.com/790887e3ce.js" crossorigin="anonymous"></script>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>

<style>
.container {
	padding: 0px 15px !important;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$( function() {
		if( $('.member_ID').val() == "admin" ){
			$('.admin_menu').css('display','block');
		}else{
			$('.admin_menu').css('display','none');
		}
	});	
});
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>

	<div class="site-wrap">
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>

		<header class="site-navbar js-sticky-header site-navbar-target"
			role="banner">

			<div class="container">
				<div class="row align-items-center">
					<div class="col-6 col-xl-2">
						<h1 class="mb-0 site-logo">
							<a href="/" class="h2 mb-0">
								<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo">
							</a>
						</h1>
					</div>
					<div class="col-12 col-md-10 d-none d-xl-block">
						<nav class="site-navigation position-relative text-right" role="navigation">
							<ul	class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
								<li><a href="/" class="nav-link">Home</a></li>
					           <li>
				                  <a href="#about-section" class="nav-link">About</a>
				                <li class="has-children">
				                  <a href="/lostpets/p001/list" class="nav-link">실종견 찾기</a>
				                  <ul class="dropdown">
				                    <li><a href="/lostpets/p001/list" class="nav-link">실종견 찾기</a></li>
				                    <li><a href="/lostpets/p001/lostList" class="nav-link">주인 찾기</a></li>
				                    <li><a href="/lostpets/p001/findList"  class="nav-link">반려견 찾기</a></li>
				                    <li><a href="/lostpets/p001/completedList"  class="nav-link">찾았어요</a></li>
				                    <c:if test = "${not empty customers.member_id }">
				                    	<li><a href="/lostpets/request/list?member_id=${customers.member_id }"  class="nav-link">내 요청 목록</a></li>
				                    </c:if>
				                  </ul>
				                </li>
								<li class="has-children">
									<a href="#trainers-section" class="nav-link">펫시터</a>
									<ul class="dropdown">
										<li>
											<a href="${pageContext.request.contextPath}/petsitting/p001/profilelist" id="headersitterlist" class="nav-link">펫시터 목록</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/petsitting/p002/reservationlist" id="headerreservedlist" class="nav-link">예약 현황</a></li>
									</ul>
								</li>
								<li class="has-children">
									<a href="#services-section" class="nav-link">동반시설지도</a>
									<ul class="dropdown">
										<li>
											<a href="/facilitymap/p001/facilityMap"	class="nav-link">시설지도</a>
										</li>
										<li>
											<a href="/facilitymap/p001/register" class="nav-link admin_menu" id="admin_menu" >시설지도 등록</a>
										</li>
									</ul>
								</li>
								<li>
									<div class="notice-div" onclick="noticeClick()">
										<img width="25px" src="../../resources/images/icon/notice_bell_img.png">
										<div id="notice_count--div" class="notice_count--div">
											<p class="notice_count--text"></p>
										</div>
									</div>
								</li>
								<li>
									<div class="messege-div">
									<a href="/chat/chatList">
										<img class="messege-icon" height="35px" src="../../resources/images/icon/messege_icon.png">
									</a>
									</div>
								</li>
								<li>
									<div>
										<c:choose>
								 			<c:when test="${isLogOn == true && customers != null}">
								    			<a href="/customers/p001/logout" class="nav-link btn btn-primary" style="color: #fff !important; line-height: 1rem;">로그아웃</a>
								    			<a href="/customers/p001/toMyinfo" class="nav-link btn btn-primary" style="color: #fff !important; line-height: 1rem;">마이페이지</a>
								    			<input type="hidden" class="member_ID" value="${customers.member_id }">
								    			<input type="hidden" class="privilege_ID" value="${customers.privilege_id }">
								    		</c:when>
								    		<c:when test="${adLogOn == true && customers != null}">
								    			<a href="/customers/p001/logout" class="nav-link btn btn-primary" style="color: #fff !important; line-height: 1rem;">로그아웃</a>
								    			<a href="/customers/p001/admin_board" class="nav-link btn btn-primary" style="color: #fff !important; line-height: 1rem;">펫시터신청목록</a>
								    			<input type="hidden" class="member_ID" value="${customers.member_id }">
								    		</c:when>
								 			<c:otherwise>
								 				<a href="/customers/p001/signin" class="nav-link btn btn-primary" style="color: #fff !important; line-height: 1rem;">로그인</a>
								    			<a href="/customers/p001/signup" class="nav-link btn btn-primary" style="color: #fff !important; line-height: 1rem;">회원가입</a>
								    		</c:otherwise>
									 	</c:choose>
									</div>
								</li>
							</ul>
						</nav>
					</div>
					<div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;">
						<a href="#" class="site-menu-toggle js-menu-toggle float-right">
							<span class="icon-menu h3"></span>
						</a>
					</div>
				</div>
			</div>
			<div class="noticeDiv" style="display: none">
				<h2 class="noticeText"></h2>
			</div>
		</header>
		
		<div class="notice_messege-div">
			<img class="notice_messege-img" src="${pageContext.request.contextPath}/resources/images/icon/notice_message.png">
		</div>
		<div class="tl_box">
			<div class="tl_config">
				<dl>
					<dd class="tit_config">
						<a href="https://my.musinsa.com/member/v1/mypage">알 림</a>
					</dd>
					<dd class="dd_center"></dd>
					<dd class="btn_config">
						<a class="close" onclick="xClick()">X</a>
					</dd>
				</dl>
			</div>
			<div class="tl_scroll" max_size="333"></div>
		</div>
