<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
<!-- ColorPicker codes -->
<script src="${path}/include/js/html5kellycolorpicker.min.js"></script>
<script>
	$(function() {
		//마지막 스크롤 값을 저장할 lastScroll 변수
		var lastScroll = 0;
		$(window)
				.scroll(
						function(event) { //스크롤이 움직일때 마다 이벤트 실행
							//현재 스크롤의 위치를 저장할 st 변수
							var st = $(this).scrollTop();
							//스크롤 상하에 따른 반응 정의
							if (st > lastScroll) {
								if ($(window).scrollTop() >= 538) { //스크롤이 아래로 538px 이상 내려갔을때 실행되는 이벤트 정의
									$('header')
											.attr('class',
													'nav d-xl-block d-lg-block d-md-none d-sm-none');
								}
							} else {
								if ($(window).scrollTop() < 538) { //스크롤이 아래로 538px 이상 올라갔을때 실행되는 이벤트 정의
									$('header').attr('class',
											'nav d-md-none d-sm-none');
								}
							}
							//현재 스크롤 위치(st)를 마지막 위치로 업데이트
							lastScroll = st;
						});
		new KellyColorPicker({
			    place : 'picker',
			    input : 'color'
			});
	});
</script>
</head>
<body>
	<%@ include file="include/topbar.jsp"%>
	<div class="global-body">
		<div class="master-body">
			<div class="MasterBodyDestTop">
				<div class="kdemimobile d-lg-none d-xl-none d-md-block d-sm-block">
					<div class="container-md col-md-12 pt-3">
						<div class="flex-between-center height-80px row">
							<div class="text-center col-md-12 col-sm-12">
								<div class="NavLogo nav-logo-wrapper">
									<a class="cursor logofont" data-ga-category="header"
										href="${path}"><b>KDEMY</b></a>
								</div>
							</div>
						</div>
						<br>
						<div id="carouselExampleCaptions" class="carousel slide"
							data-ride="carousel" style="height: 300px;">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleCaptions" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="${path}/include/images/slide/slide.jpg"
										class="d-block w-100" style="height: 300px;" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<h5>First slide label</h5>
										<p>Nulla vitae elit libero, a pharetra augue mollis
											interdum.</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="${path}/include/images/slide/slide2.jpg"
										class="d-block w-100" style="height: 300px;" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<h5>Second slide label</h5>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit.</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="${path}/include/images/slide/slide3.jpg"
										class="d-block w-100" style="height: 300px;" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<h5>Third slide label</h5>
										<p>Praesent commodo cursus magna, vel scelerisque nisl
											consectetur.</p>
									</div>
								</div>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleCaptions"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<br>
						<div class="col-md-12 col-sm-12 pt-3">
							<div class="items-container row">
								<div class="RootDirectoryThemeItem col-3">
									<a class="plain" href="#">
										<div class="icon icon9"></div>
										<div class="iconName">
											<span><b>콘텐츠제작2</b></span>
										</div>
									</a>
								</div>
								<div class="RootDirectoryThemeItem col-3">
									<a class="plain" href="#">
										<div class="icon icon10"></div>
										<div class="iconName">
											<span><b>IT프로그래밍</b></span>
										</div>
									</a>
								</div>
								<div class="RootDirectoryThemeItem col-3">
									<a class="plain" href="#">
										<div class="icon icon11"></div>
										<div class="iconName">
											<span><b>번역,통역</b></span>
										</div>
									</a>
								</div>
								<div class="RootDirectoryThemeItem col-3">
									<a class="plain" href="#">
										<div class="icon icon1"></div>
										<div class="iconName">
											<span><b>디자인</b></span>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="router-view" class="d-none d-lg-block d-xl-block">
					<div class="home">
						<div class="MarketHome">
							<div class="MarketIndex">
								<div id="mainHeaderContainer"
									class="position-relative col-xl-12">

									<!-- 관리자 메인배너 변경 코드 -->
									<button class="btn"
										data-toggle="modal" data-target="#mainChange"><i class="fas fa-cog" data-toggle="Modal"
										data-target="#MainChange"></i></button>
									<div class="modal" id="mainChange">
										<div class="modal-dialog modal-xl">
											<div class="modal-content">

												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">메인배너 변경</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
														<div class="form-group">
															<label for="now">현재 디자인</label> 
															<div class="global-body">
			<div class="MasterBodyDestTop">
						<div class="col-md-12 col-sm-12 pt-3">
					<div class="main-header-gradient"></div>
									<div class="header position-relative" id="kdemiMainHeader">
										<div class="index-opacity-wrap" style="padding-top: 30px;">
											<div class="container-xl col-xl-8 offset-xl-2 col-lg-12">
												<div class="flex-between-center height-80px row">
													<div class="flex-left-center col-3 mr-auto">
														<div class="NavLogo nav-logo-wrapper">
															<a class="cursor logofont" data-ga-category="header"
																href="${path}"><b>KDEMY</b></a>
														</div>
													</div>
													<div class="flex-end-center col-auto p-0">
														<div class="header-right-info NavRight col-xl-12">
															<c:if test="${sessionScope.userid == 'admin'}">
																<div
																	class="item dropdown col-xl-4 text-center dropdown-toggle"
																	style="display: initial !important;">
																	<a class="plain cursor" data-ga-category="header"><b>관리메뉴</b></a>
																	<div class="dropdown-menu">
																		<a class="dropdown-item" href="${path}/admin/list.do">관리자계정</a>
																		<a class="dropdown-item" href="#">회원관리</a> <a
																			class="dropdown-item" href="#">강의관리</a> <a
																			class="dropdown-item" href="#">패키지관리</a>
																	</div>
																</div>
															</c:if>
															<div class="item col-xl-4 text-center"
																style="display: initial !important;">
																<a class="plain cursor" data-ga-category="header"><b>전문가
																		등록</b></a>
															</div>
															<div class="item col-xl-4 text-center"
																style="display: initial !important;">
																<a class="plain cursor" data-ga-category="header"><b>로그인</b></a>
																
															</div>
															<div id="" class="item position-relative col-xl-4"
																style="display: initial !important;">
																<a
																	class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
																	href="${path}/member/write.do"
																	data-ga-category="header"> 무료회원가입 </a>
															</div>
														</div>
													</div>
												</div>
												<br>
											</div>
											<div class="margin-top-15">
												<div
													class="header-wrapper pading-side-0 col-xl-8 offset-xl-2 col-lg-12 d-none d-xl-block d-lg-block ">
													<div>
														<div class="market-main-description-text">
															<span>136</span> <span>만건의 거래</span> <span>98.2</span> <span>%의
																만족도</span>
														</div>
														<div class="hero-title NGM">프리랜서 마켓, KDEMY</div>
													</div>

													<div class="margin-top-35">
														<div class="SearchForm search-form-type-main">
															<form action="" id="searchKeyword"
																class="margin-bottom-0" method="get"
																onsubmit="return false">
																<div class="search-group text-center cursor">
																	<div style="">
																		<div class="index-search-bar">
																			<span class="typed-element">웹사이트 개발</span> <span
																				class="typed-cursor typed-cursor--blink"></span>
																			<div class="index-search-bar-input"></div>
																			<a id="searchBtnNone" class="index-search-btn"
																				type="submit"> <img class="width-30px"
																				src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png">
																			</a>
																		</div>
																	</div>

																</div>
															</form>
														</div>
													</div>

													<div class="flex padding-top-25">
														<div class="market-main-or-text">
															<b>또는</b>
														</div>
													</div>
													<div class="margin-top-30 MarketIndex .flex-center-center">
														<a class="market-main-link-text .flex-center-center"
															href="#"> <b>필요한 업무 등록하고 맞춤 견적 받기</b></a>
													</div>

												</div>
											</div>
										</div>

										<div class="index-header-left d-none d-xl-block"></div>
										<div class="index-header-right d-none d-xl-block"></div>

									</div>
								</div>

								<div class="MainThemes">
									<section class="ROOT_DIRECTORY" style="margin-top: 70px;"></section>
									<div class="RootDirectoryTheme">
										<div class="background">
											<div style="margin-right: auto; margin-left: auto;"
												class="col-xl-8 offset-xl-2 col-lg-12 d-none d-xl-block d-lg-block ">
												<div class="items-container">
													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon1"></div>
															<div class="iconName">
																<span><b>디자인</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon2"></div>
															<div class="iconName">
																<span><b>마케팅</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon3"></div>
															<div class="iconName">
																<span><b>문서,취업</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon4"></div>
															<div class="iconName">
																<span><b>아이콘</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon5"></div>
															<div class="iconName">
																<span><b>아이콘2</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon6"></div>
															<div class="iconName">
																<span><b>안드로이드</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon7"></div>
															<div class="iconName">
																<span><b>어플</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon8"></div>
															<div class="iconName">
																<span><b>콘텐츠제작</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon9"></div>
															<div class="iconName">
																<span><b>콘텐츠제작2</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon10"></div>
															<div class="iconName">
																<span><b>IT프로그래밍</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon11"></div>
															<div class="iconName">
																<span><b>번역,통역</b></span>
															</div>
														</a>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
														<div class="d-flex">
														<div class="setting-items col-4">
														<label for="color-container">배경색</label>
														<div id="color-container">
														<div id="picker"></div>
														<input id="color" value="">
														</div>
														</div>
														<div class="setting-items col-4">
														<label for="image-container">이미지</label>
														<div id="image-container">
														</div>
														</div>
														<div class="setting-items col-4">
														<label for="icon-container">아이콘</label>
														</div>
														</div>
														</div>
														<!-- Modal footer -->
														<div class="modal-footer">
															<button type="submit" class="btn btn-primary">변경</button>
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">취소</button>
														</div>
												</div>
											</div>
										</div>
									</div>
									<div class="main-header-gradient"></div>
									<div class="header position-relative" id="kdemiMainHeader">
										<div class="index-opacity-wrap" style="padding-top: 30px;">
											<div class="container-xl col-xl-8 offset-xl-2 col-lg-12">
												<div class="flex-between-center height-80px row">
													<div class="flex-left-center col-3 mr-auto">
														<div class="NavLogo nav-logo-wrapper">
															<a class="cursor logofont" data-ga-category="header"
																href="${path}"><b>KDEMY</b></a>
														</div>
													</div>
													<div class="flex-end-center col-auto p-0">
														<div class="header-right-info NavRight col-xl-12">
															<c:if test="${sessionScope.userid == 'admin'}">
																<div class="item dropdown col-xl-4 text-center dropdown-toggle"
																	style="display: initial !important;">
																	<a class="plain cursor" data-ga-category="header"><b>관리메뉴</b></a>
																	<div class="dropdown-menu">
																		<a class="dropdown-item" href="${path}/admin/list.do">관리자계정</a>
																		<a class="dropdown-item" href="#">회원관리</a> <a
																			class="dropdown-item" href="#">강의관리</a> <a
																			class="dropdown-item" href="#">패키지관리</a>
																	</div>
																	</div>
																	<div
																	class="item dropdown col-xl-4 text-center dropdown-toggle"
																	style="display: initial !important;">
																	<a class="plain cursor" data-ga-category="header"><b>통계</b></a>
																	<div class="dropdown-menu">
																		<a class="dropdown-item" href="#">강의통계</a>
																		<a class="dropdown-item" href="#">회원관리</a> <a
																			class="dropdown-item" href="#">강의관리</a> <a
																			class="dropdown-item" href="#">패키지관리</a>
																	</div>
																</div>
															</c:if>
															<div class="item col-xl-4 text-center"
																style="display: initial !important;">
																<a class="plain cursor" data-ga-category="header"><b>전문가
																		등록</b></a>
															</div>
															<div class="item col-xl-4 text-center"
																style="display: initial !important;">
																<c:choose>
																	<c:when test="${sessionScope.userid == null}">
																<a href="${path}/member/loginPage.do" class="plain cursor" data-ga-category="header"><b>로그인</b></a>
																<a href="${path}/member/teacherPage.do" class="plain cursor" data-ga-category="header"><b>강사페이지</b></a>
																	</c:when>
																	<c:otherwise>
																		<a>${sessionScope.username}님 환영합니다.</a>
																		<a style="color: red;">${sessionScope.userid}</a>
																		<a style="color: blue;">${sessionScope.teacher}</a>
																		<a href="${path}/member/logOut.do"><b>로그아웃</b></a>
																</c:otherwise>
																</c:choose>
															</div>
															<div id="" class="item position-relative col-xl-4"
																style="display: initial !important;">
																<a
																	class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
																	href="${path}/member/write.do"
																	data-ga-category="header"> 무료회원가입 </a>
															</div>
														</div>
													</div>
												</div>
												<br>
											</div>
											<div class="margin-top-15">
												<div
													class="header-wrapper pading-side-0 col-xl-8 offset-xl-2 col-lg-12 d-none d-xl-block d-lg-block ">
													<div>
														<div class="market-main-description-text">
															<span>136</span> <span>만건의 거래</span> <span>98.2</span> <span>%의
																만족도</span>
														</div>
														<div class="hero-title NGM">프리랜서 마켓, KDEMY</div>
													</div>

													<div class="margin-top-35">
														<div class="SearchForm search-form-type-main">
															<form action="" id="searchKeyword"
																class="margin-bottom-0" method="get"
																onsubmit="return false">
																<div class="search-group text-center cursor">
																	<div style="">
																		<div class="index-search-bar">
																			<span class="typed-element">웹사이트 개발</span> <span
																				class="typed-cursor typed-cursor--blink"></span>
																			<div class="index-search-bar-input"></div>
																			<a id="searchBtnNone" class="index-search-btn"
																				type="submit"> <img class="width-30px"
																				src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png">
																			</a>
																		</div>
																	</div>

																</div>
															</form>
														</div>
													</div>

													<div class="flex padding-top-25">
														<div class="market-main-or-text">
															<b>또는</b>
														</div>
													</div>
													<div class="margin-top-30 MarketIndex .flex-center-center">
														<a class="market-main-link-text .flex-center-center"
															href="#"> <b>필요한 업무 등록하고 맞춤 견적 받기</b></a>
													</div>

												</div>
											</div>
										</div>

										<div class="index-header-left d-none d-xl-block"></div>
										<div class="index-header-right d-none d-xl-block"></div>

									</div>
								</div>

								<div class="MainThemes">
									<section class="ROOT_DIRECTORY" style="margin-top: 70px;"></section>
									<div class="RootDirectoryTheme">
										<div class="background">
											<div style="margin-right: auto; margin-left: auto;"
												class="col-xl-8 offset-xl-2 col-lg-12 d-none d-xl-block d-lg-block ">
												<div class="items-container">
													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon1"></div>
															<div class="iconName">
																<span><b>디자인</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon2"></div>
															<div class="iconName">
																<span><b>마케팅</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon3"></div>
															<div class="iconName">
																<span><b>문서,취업</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon4"></div>
															<div class="iconName">
																<span><b>아이콘</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon5"></div>
															<div class="iconName">
																<span><b>아이콘2</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon6"></div>
															<div class="iconName">
																<span><b>안드로이드</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon7"></div>
															<div class="iconName">
																<span><b>어플</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon8"></div>
															<div class="iconName">
																<span><b>콘텐츠제작</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon9"></div>
															<div class="iconName">
																<span><b>콘텐츠제작2</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon10"></div>
															<div class="iconName">
																<span><b>IT프로그래밍</b></span>
															</div>
														</a>
													</div>

													<div class="RootDirectoryThemeItem">
														<a class="plain" href="#">
															<div class="icon icon11"></div>
															<div class="iconName">
																<span><b>번역,통역</b></span>
															</div>
														</a>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- content -->
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3">
		<div class="row">
			<div class="col-6 mr-auto pt-3">
				<h5 class="text-left">
					<b>카테고리</b>
				</h5>
				<br>
			</div>
			<div class="pt-4 col-auto">
				<a class="btn btn-xs btn-light">&lt;</a> <a
					class="btn btn-xs btn-light">&gt;</a>
			</div>
		</div>
		<div class="row">
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>

		</div>
	</div>

	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3">
		<div class="row">
			<div class="col-6 mr-auto pt-3">
				<h5 class="text-left">
					<b>카테고리</b>
				</h5>
				<br>
			</div>
			<div class="pt-4 col-auto">
				<a class="btn btn-xs btn-light">&lt;</a> <a
					class="btn btn-xs btn-light">&gt;</a>
			</div>
		</div>
		<div class="row">
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>

		</div>
	</div>

	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3">
		<div class="row">
			<div class="col-6 mr-auto pt-3">
				<h5 class="text-left">
					<b>카테고리</b>
				</h5>
				<br>
			</div>
			<div class="pt-4 col-auto">
				<a class="btn btn-xs btn-light">&lt;</a> <a
					class="btn btn-xs btn-light">&gt;</a>
			</div>
		</div>
		<div class="row">
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>
			<div class="card col-2 px-0 m-auto">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img-top" alt="...">
			</div>

		</div>
	</div>
	<div class="card">
		<div class="card-header">Featured</div>
		<div class="card-body">
			<h5 class="card-title">Special title treatment</h5>
			<p class="card-text">With supporting text below as a natural
				lead-in to additional content.</p>
			<a href="#" class="btn btn-primary">Go somewhere</a>
		</div>
	</div>

	<div class="card">
		<h5 class="card-header">Featured</h5>
		<div class="card-body">
			<h5 class="card-title">Special title treatment</h5>
			<p class="card-text">With supporting text below as a natural
				lead-in to additional content.</p>
			<a href="#" class="btn btn-primary">Go somewhere</a>
		</div>
	</div>
	<div class="card mb-3">
		<img src="..." class="card-img-top" alt="...">
		<div class="card-body">
			<h5 class="card-title">Card title</h5>
			<p class="card-text">This is a wider card with supporting text
				below as a natural lead-in to additional content. This content is a
				little bit longer.</p>
			<p class="card-text">
				<small class="text-muted">Last updated 3 mins ago</small>
			</p>
		</div>
	</div>
	<div class="card mb-3" style="max-width: 540px;">
		<div class="row no-gutters">
			<div class="col-md-4">
				<img
					src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png"
					class="card-img" alt="...">
			</div>
			<div class="col-md-8">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>
</html>
<%@ include file="include/footer.jsp"%>

