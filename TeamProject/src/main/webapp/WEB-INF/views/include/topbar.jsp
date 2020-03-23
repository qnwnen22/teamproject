<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(function(){
    //마지막 스크롤 값을 저장할 lastScroll 변수
    var lastScroll = 0;
    $(window).scroll(function(event){ //스크롤이 움직일때 마다 이벤트 실행
        //현재 스크롤의 위치를 저장할 st 변수
        var st = $(this).scrollTop();
        //스크롤 상하에 따른 반응 정의
        if (st > lastScroll){
            if ($(window).scrollTop() >= 538) { //스크롤이 아래로 538px 이상 내려갔을때 실행되는 이벤트 정의
                $('header').show();
            }
        }else {
        	if ($(window).scrollTop() < 538) { //스크롤이 아래로 538px 이상 올라갔을때 실행되는 이벤트 정의
                $('header').hide();
            }
        }
        //현재 스크롤 위치(st)를 마지막 위치로 업데이트
        lastScroll = st;
    });
});
</script>

<header class="nav" style="display: none;">
	<nav id="kdemiNavBar" class="MarketNav is-nav-white is-fixed pb-3">
		<div class="container-1170 position-relative">
			<div class="flex-between-center height-80px col-xl-12">
				<div class="flex-left-center col-xl-6">
					<div class="NavLogo nav-logo-wrapper col-xl-3">
						<a class="cursor logofont" data-ga-category="header"
							href="${path}/index/index.do"><b>KDEMY</b></a>
					</div>
					<div class="search-input-type-transparent-header col-xl-7">
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

				<div class="flex-end-center col-xl-5">
					<div class="header-right-info flex-center NavRight col-xl-12">
						<div class="item col-xl-3 offset-xl-2">
							<a class="plain cursor" data-ga-category="header">전문가 등록</a>
						</div>
						<div class="item col-xl-2">
							<a class="plain cursor" data-ga-category="header">로그인</a>
						</div>
						<div id="" class="item position-relative col-xl-5">
							<a
								class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
								href="#" data-ga-category="header"> 무료회원가입 </a>
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








<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
