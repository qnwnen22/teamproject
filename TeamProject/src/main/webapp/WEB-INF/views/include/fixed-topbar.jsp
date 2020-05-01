<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="nav d-xl-block d-lg-block d-none" style="margin-bottom: 160px;">
	<nav id="kdemiNavBar" class="MarketNav is-nav-white is-fixed d-block pb-3">
		<div class="container-xl col-xl-8 offset-xl-2 col-lg-12">
			<div class="flex-between-center height-80px row">
				<div class="flex-left-center col-2">
					<div class="NavLogo nav-logo-wrapper">
						<a class="cursor logofont" data-ga-category="header"
							href="${path}"><b>KDEMY</b></a>
					</div>
				</div>
				<div class="flex-left-center col-3 mr-auto">
					<div class="search-input-type-transparent-header">
						<div class="search-result-wrapper col-xl-12">
							<div class="searchForm search-form-type-header">
								<form action="" id="searchKeyword" class="margin-bottom-0"
									method="get" action="" autocomplete="off"
									onsubmit="return false;">
									<div class="search-group text-center cursor">
										<div class="index-search-bar">
											<input class="search-input kdemi" placeholder="키워드를 입력해주세요." 
												name="keyword1" id="keyword1" maxlength="20">
											<button class="search-btn" style="border: none; background: white;" onclick="search()">
												<img class="width-20px cursor search-input-glass"
													style="vertical-align: inherit;"
													src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png">
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="flex-end-center col-auto p-0">
					<div class="header-right-info flex-center NavRight col-xl-12">
					<!-- 관리자 로그인 -->
						<c:if test="${sessionScope.admin_id != null}">
							<div class="item col-xl-4 text-center"
								style="display: initial !important;">
								<a class="plain cursor" data-ga-category="header"
									href="${path}/packages/list.do"><b>패키지 구매</b></a>
							</div>
							<div class="item dropdown col-xl-4 text-center dropdown-toggle"
								style="display: initial !important;">
								<a class="plain cursor" data-ga-category="header"
									href="${path}/admin/managementMenu.do"><b>관리메뉴</b></a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="${path}/admin/list.do">관리자계정</a>
									<a class="dropdown-item" href="${path}/member/list.do">회원관리</a>
									<a class="dropdown-item"
										href="${path}/lecture/online_list.do?admin=admin">강의관리</a> <a
										class="dropdown-item" href="${path}/packages/adminlist.do">패키지관리</a>
									<a class="dropdown-item" href="${path}/member/couponMaker.do">쿠폰관리</a>
								</div>
							</div>
							<div class="item dropdown col-xl-4 text-center dropdown-toggle"
								style="display: initial !important;">
								<a class="plain" data-ga-category="header"
									href="${path}/chart/statistics.do"><b>통계</b></a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="${path}/chart/memberchart.do">회원통계</a>
									<a class="dropdown-item" href="${path}/chart/lecturechart.do">강의통계</a>
									<a class="dropdown-item" href="#">매출통계</a> <a
										class="dropdown-item" href="#">방문자</a>
								</div>
							</div>
							<a><b>${sessionScope.admin_id}님</b></a>
						</c:if>
						<!-- 관리자 로그인 끝 -->
						<c:choose>
							<c:when
								test="${sessionScope.userid == null && sessionScope.admin_id == null}">
								<div class="item col-xl-4 text-center"
									style="display: initial !important;">
									<a class="plain cursor" data-ga-category="header"
										href="${path}/packages/list.do"><b>패키지 구매</b></a>
								</div>
								<div class="item col-xl-4 text-center"
									style="display: initial !important;">
									<a class="plain cursor" data-ga-category="header"
										data-toggle="modal" data-target="#kdemyLoginModal"><b>로그인</b></a>
								</div>
								<div id="" class="item position-relative col-xl-4"
									style="display: initial !important;">
									<a
										class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
										href="${path}/member/join.do" data-ga-category="header">
										무료회원가입 </a>
								</div>
							</c:when>

							<c:otherwise>
								<c:choose>
									<c:when
										test="${sessionScope.teacher == 'y' && sessionScope.userid !=null}">
										<div class="item col-xl-4 text-center"
											style="display: initial !important;">
											<a class="plain cursor" data-ga-category="header"
												href="${path}/packages/list.do"><b>패키지 구매</b></a>
										</div>
										<div
											class="item dropdown col-xl-4 text-center dropdown-toggle"
											style="display: initial !important;">
											<a class="plain cursor" data-ga-category="header"><b>강의관리</b></a>
											<div class="dropdown-menu">
												<a class="dropdown-item"
													href="${path}/lecture/addLecturePage.do">강의등록</a> <a
													class="dropdown-item"
													href="${path}/lecture/myLecturePage.do?userid=${sessionScope.userid}">등록한
													강의</a>
											</div>
										</div>
										<div
											class="item dropdown col-xl-4 text-center dropdown-toggle"
											style="display: initial !important;">
											<a class="plain cursor" data-ga-category="header"><b>나의정보</b></a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="${path}/member/mypage.do">나의정보</a>
												<a class="dropdown-item" href="${path}/cart/cartPage.do">장바구니</a>
												<a class="dropdown-item" href="${path}/member/updatePointPage.do">쿠폰등록</a>
												<a class="dropdown-item" href="${path}/member/orderDetail1.do">내강의목록</a> 
											</div>
										</div>

										<a><b>${sessionScope.username}님</b></a>
									</c:when>

									<c:when
										test="${sessionScope.teacher != 'y' && sessionScope.userid !=null}">
										<div class="item col-xl-4 text-center"
											style="display: initial !important;">
											<a class="plain cursor" data-ga-category="header"
												href="${path}/packages/list.do"><b>패키지 구매</b></a>
										</div>
										<div class="item col-xl-4 text-center"
											style="display: initial !important;">
											<a class="plain cursor" data-ga-category="header"
												href="${path}/teacher/teacherJoinPage.do"><b>전문가 등록</b></a>
										</div>
										<div
											class="item dropdown col-xl-4 text-center dropdown-toggle"
											style="display: initial !important;">
											<a class="plain cursor" data-ga-category="header"><b>나의정보</b></a>
											<div class="dropdown-menu">
												<a class="dropdown-item"
													href="${path}/member/mypage.do">나의정보</a>
												<a class="dropdown-item"
													href="${path}/lecture/myLectureListPage.do">구입한 강의 목록</a> <a
													class="dropdown-item" href="${path}/cart/cartPage.do">장바구니</a>
												<a class="dropdown-item" href="#">관심상품</a> <a
													class="dropdown-item"
													href="${path}/member/updatePointPage.do">쿠폰등록</a>
											</div>
										</div>
										<a><b>${sessionScope.username}님</b></a>
									</c:when>
								</c:choose>
										<button type="button" data-toggle="modal" data-target="#logOutModal"
																				class="btn btn-sm btn-primary font-color-fff btn-normal-silver">로그아웃</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<br>
			<div class="nav-category-list NavCategoryList col-lg-12 TopBarMenuWarpper pl-0 pr-0">
				<ul class="list-inline margin-all-0 col-lg-12 pl-0 pr-0">
					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=디자인" data-ga-label="1"
								data-ga-category="header">디자인</a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=로고브랜딩" data-ga-label="" data-ga-category="header">로고브랜딩</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=인쇄물" data-ga-label="" data-ga-category="header">인쇄물</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=제품,패키지" data-ga-label="" data-ga-category="header">제품.패키지</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=공간디자인" data-ga-label="" data-ga-category="header">공간디자인</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=북,앨범디자인" data-ga-label="" data-ga-category="header">북.앨범디자인</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=웹,모바일" data-ga-label="" data-ga-category="header">웹&nbsp;.&nbsp;모바일
												디자인</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=블로그,SNS디자인" data-ga-label="" data-ga-category="header">블로그.SNS디자인</a>
										</div>
									</div>
									<div>									
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=게임,VR" data-ga-label="" data-ga-category="header">게임&nbsp;.&nbsp;VR</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=PPT,인포그래픽" data-ga-label="" data-ga-category="header">PPT.인포그래픽</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=일러스트,캐리커쳐" data-ga-label="" data-ga-category="header">일러스트.캐리커쳐</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=블로그,SNS디자인" data-ga-label="" data-ga-category="header">블로그.SNS디자인</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=현수막,배너" data-ga-label="" data-ga-category="header">현수막.배너</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=의류디자인" data-ga-label="" data-ga-category="header">의류디자인</a>
										</div>
										<div class="sub-category-wrapper">
											<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
												href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown ">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=IT,프로그래밍" data-ga-label="1"
								data-ga-category="header"> IT.프로그래밍 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=워드프레스" data-ga-label="" data-ga-category="header">워드프레스</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=쇼핑몰,커머스" data-ga-label="" data-ga-category="header">쇼핑몰&nbsp;.&nbsp;커머스</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=웹사이트" data-ga-label="" data-ga-category="header">웹사이트
											개발</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=모바일앱,웹" data-ga-label="" data-ga-category="header">모바일앱&nbsp;.&nbsp;웹</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=프로그램개발" data-ga-label="" data-ga-category="header">프로그램개발</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=게임" data-ga-label="" data-ga-category="header">게임</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=데이터베이스" data-ga-label="" data-ga-category="header">데이터베이스</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=데이터분석,리포트" data-ga-label="" data-ga-category="header">데이터분석.리포트</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=보안" data-ga-label="" data-ga-category="header">보안</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=서버 및 기술지원" data-ga-label="" data-ga-category="header">서버 및 기술지원</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=콘텐츠 제작" data-ga-label="1"
								data-ga-category="header"> 콘텐츠제작 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=영상촬영,편집" data-ga-label="" data-ga-category="header">영상촬영&nbsp;.&nbsp;편집</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=유튜브제작" data-ga-label="" data-ga-category="header">유튜브제작</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=애니메이션" data-ga-label="" data-ga-category="header">애니메이션</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=3D,VR" data-ga-label="" data-ga-category="header">3D&nbsp;.&nbsp;VR</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=사진촬영" data-ga-label="" data-ga-category="header">사진촬영</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=더빙,녹음" data-ga-label="" data-ga-category="header">더빙&nbsp;.&nbsp;녹음</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=음악,사운드" data-ga-label="" data-ga-category="header">음악&nbsp;.&nbsp;사운드</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=모델,MC" data-ga-label="" data-ga-category="header">모델&nbsp;.&nbsp;MC</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=마케팅" data-ga-label="1"
								data-ga-category="header"> 마케팅 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=종합광고대행" data-ga-label="" data-ga-category="header">종합광고대행</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=블로그,카페" data-ga-label="" data-ga-category="header">블로그.카페</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=영상마케팅" data-ga-label="" data-ga-category="header">영상마케팅</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=SNS마케팅" data-ga-label="" data-ga-category="header">SNS마케팅</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=쇼핑몰,스토어" data-ga-label="" data-ga-category="header">쇼핑몰.스토어</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=유튜브크리에이터" data-ga-label="" data-ga-category="header">유튜브크리에이터</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=블로그체험단" data-ga-label="" data-ga-category="header">블로그체험단</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=앱마케팅" data-ga-label="" data-ga-category="header">앱마케팅</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=오프라인광고" data-ga-label="" data-ga-category="header">오프라인광고</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=마케팅노하우" data-ga-label="" data-ga-category="header">마케팅노하우</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=번역,통역" data-ga-label="1"
								data-ga-category="header">번역.통역</a>
						</div>
						<div class="TopBarMenuList border-top-category  dropdown-menu container " role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper ">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper ">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=번역" data-ga-label="" data-ga-category="header">번역</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=통역" data-ga-label="" data-ga-category="header">통역</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=영상번역" data-ga-label="" data-ga-category="header">영상번역</a>
									</div>
									<div class="sub-category-wrapper ">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=감수" data-ga-label="" data-ga-category="header">감수</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=번역공증" data-ga-label="" data-ga-category="header">번역공증</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=문서,통역" data-ga-label="1"
								data-ga-category="header"> 문서.취업</a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=면접,취업코치" data-ga-label="" data-ga-category="header">면접.취업코치</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=자소서,이력서" data-ga-label="" data-ga-category="header">자소서.이력서</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=글작성,대본" data-ga-label="" data-ga-category="header">글작성.대본</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=카피라이딩" data-ga-label="" data-ga-category="header">카피라이딩</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=노하우,전자책" data-ga-label="" data-ga-category="header">노하우.전자책</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=타이핑" data-ga-label="" data-ga-category="header">타이핑</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=논문" data-ga-label="" data-ga-category="header">논문</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=비즈니스컨설팅" data-ga-label="1"
								data-ga-category="header"> 컨설팅 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper" style="width: 200px;">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=투잡,부업" data-ga-label="" data-ga-category="header">투잡.부업</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=세무회계" data-ga-label="" data-ga-category="header">세무회계</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=창업,경영컨설팅" data-ga-label="" data-ga-category="header">창업.경영컨설팅</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=리서치,서베이" data-ga-label="" data-ga-category="header">리서치.서베이</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=HR,인사" data-ga-label="" data-ga-category="header">HR.인사</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=자산관리,재태크" data-ga-label="" data-ga-category="header">자산관리.재태크</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=사업계획서,투자제안서" data-ga-label="" data-ga-category="header">사업계획서.투자제안서</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=해외사업" data-ga-label="" data-ga-category="header">해외사업</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=보고서작성,업무지원" data-ga-label="" data-ga-category="header">보고서작성.업무지원</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=법율,법무" data-ga-label="" data-ga-category="header">법율.법무</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=운세,상담" data-ga-label="1"
								data-ga-category="header"> 운세.상담 </a>
						</div>
						<div class="border-top-category dropdown-menu " role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=신점" data-ga-label="" data-ga-category="header">신점</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=사주,운세" data-ga-label="" data-ga-category="header">사주.운세</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=타로" data-ga-label="" data-ga-category="header">타로</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=작명" data-ga-label="" data-ga-category="header">작명</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=심리상담" data-ga-label="" data-ga-category="header">심리상담</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=연애상담" data-ga-label="" data-ga-category="header">연애상담</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=여행,생활" data-ga-label="" data-ga-category="header">여행.생활</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=레슨,실무교육" data-ga-label="1"
								data-ga-category="header"> 레슨.실무 </a>
						</div>
						<div class="border-top-category dropdown-menu " role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=마케팅" data-ga-label="" data-ga-category="header">마케팅</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=프로그래밍" data-ga-label="" data-ga-category="header">프로그래밍</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=그래픽디자인" data-ga-label="" data-ga-category="header">그래픽디자인</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=데이터분석" data-ga-label="" data-ga-category="header">데이터분석</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=유투브,영상.사진" data-ga-label="" data-ga-category="header">유투브.영상.사진</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=외국어" data-ga-label="" data-ga-category="header">외국어</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=프레젠테이션" data-ga-label="" data-ga-category="header">프레젠테이션</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=취미,라이프" data-ga-label="" data-ga-category="header">취미.라이프</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>


					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=주문제작" data-ga-label="1"
								data-ga-category="header"> 주문제작 </a>
						</div>
						<div class="border-top-category dropdown-menu " role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=3D프린팅" data-ga-label="" data-ga-category="header">3D프린팅</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=패키지제작" data-ga-label="" data-ga-category="header">패키지제작</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=가게용품제작" data-ga-label="" data-ga-category="header">가게용품제작</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=굿즈제작" data-ga-label="" data-ga-category="header">굿즈제작</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=모형제작" data-ga-label="" data-ga-category="header">모형제작</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=제품제작" data-ga-label="" data-ga-category="header">제품제작</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=시스템제작" data-ga-label="" data-ga-category="header">시스템제작</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=인테리어시공" data-ga-label="" data-ga-category="header">인테리어시공</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger TopBarMenuTitleBox">
							<a class="TopBarMenuTitle plain sendGaTriggerClz" href="${path}/lecture/all_list_search.do?keyword=간판,인쇄" data-ga-label="1"
								data-ga-category="header"> 간판.인쇄 </a>
						</div>
						<div class="border-top-category dropdown-menu " role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper" >
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=간판" data-ga-label="" data-ga-category="header">간판</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=인쇄" data-ga-label="" data-ga-category="header">인쇄</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=인쇄물홍보" data-ga-label="" data-ga-category="header">인쇄물홍보</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=간판 제작" data-ga-label="" data-ga-category="header">간판 제작</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz TopBarMenuList" role="menuitem"
											href="${path}/lecture/all_list_search.do?keyword=기타" data-ga-label="" data-ga-category="header">기타</a>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<script type="text/javascript">
function search(){
	var keyword1=document.getElementById("keyword1").value;
	location.href = "${path}/lecture/all_list_search.do?keyword="+keyword1;
}
</script>