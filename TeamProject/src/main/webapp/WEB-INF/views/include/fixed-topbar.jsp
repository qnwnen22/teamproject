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
												name="keyword" maxlength="20">
											<button class="search-btn" style="border: none; background: white;">
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
										href="${path}/member/teacherIsert.do"><b>전문가 등록</b></a>
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
												<a class="dropdown-item"
													href="${path}/member/mypage/${sessionScope.userid}">나의정보</a>
												<a class="dropdown-item"
													href="${path}/teacher/teacherPage.do">강사 페이지이동</a> <a
													class="dropdown-item" href="${path}/cart/cartPage.do">장바구니</a>
												<a class="dropdown-item"
													href="${path}/member/updatePointPage.do">쿠폰등록</a>
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
													href="${path}/member/mypage/${sessionScope.userid}">나의정보</a>
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
								<button type="button" data-toggle="modal"
									data-target="#logOutModal"
									class="btn btn-sm btn-primary font-color-fff btn-normal-silver">로그아웃</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<br>

			<div class="nav-category-list NavCategoryList col-lg-12">
				<ul class="list-inline margin-all-0 col-lg-12">
					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>


					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="header-list-renewal dropdown col-lg-1">
						<div class="hover-trigger">
							<a class="plain sendGaTriggerClz" href="#" data-ga-label="1"
								data-ga-category="header"> 메뉴 </a>
						</div>
						<div class="border-top-category dropdown-menu" role="menu"
							aria-labelledby="dLabel">
							<div class="category-wrapper">
								<div class="sub-category-chunk-wrapper">
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴1</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴2</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴3</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴4</a>
									</div>
									<div class="sub-category-wrapper">
										<a class="heading-hover sendGaTriggerClz" role="menuitem"
											href="#" data-ga-label="" data-ga-category="header">서브메뉴5</a>
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