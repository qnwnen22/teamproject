<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<header class="nav d-none">
	<nav id="kdemiNavBar" class="MarketNav is-nav-white is-fixed pb-3">
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
											<button class="search-btn">
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
						<div class="item dropdown col-xl-4 text-center dropdown-toggle"
							style="display: initial !important;">
							<a class="plain cursor" data-ga-category="header"><b>관리메뉴</b></a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${path}/admin/list.do">관리자계정</a>
								<a class="dropdown-item" href="${path}/member/list.do">회원관리</a>
								<a class="dropdown-item" href="${path}/lecture/online_list.do?admin=admin">강의관리</a> <a
									class="dropdown-item" href="${path}/packages/adminlist.do">패키지관리</a>
							</div>
						</div>
						<div class="item dropdown col-xl-4 text-center dropdown-toggle"
							style="display: initial !important;">
							<a class="plain cursor" data-ga-category="header"><b>통계</b></a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">강의통계</a> <a
									class="dropdown-item" href="#">회원관리</a> <a
									class="dropdown-item" href="#">강의관리</a> <a
									class="dropdown-item" href="#">패키지관리</a>
							</div>
						</div>
						<div class="item col-xl-4 text-center"
							style="display: initial !important;">
							<a class="plain cursor" data-ga-category="header"><b>전문가
									등록</b></a>
						</div>
						<div class="item col-xl-4 text-center"
							style="display: initial !important;">
							<a class="plain cursor" data-ga-category="header"><b>로그인</b></a>
						</div>
						<div id="" class="item col-xl-4"
							style="display: initial !important;">
							<a
								class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
								href="${path}/member/write.do" data-ga-category="header">
								무료회원가입 </a>
						</div>
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