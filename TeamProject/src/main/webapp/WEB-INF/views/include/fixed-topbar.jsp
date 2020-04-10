<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="nav d-xl-block d-lg-block d-md-none d-sm-none" style="margin-bottom: 170px;">
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
					<div class="item dropdown col-xl-4 text-center dropdown-toggle" style="display: initial !important;">
						    <a class="plain cursor" data-ga-category="header"><b>관리메뉴</b></a>
						  <div class="dropdown-menu">
						    <a class="dropdown-item" href="${path}/admin/list.do">관리자계정</a>
						    <a class="dropdown-item" href="${path}/member/list.do">회원관리</a>
						    <a class="dropdown-item" href="${path}/lecture/online_list.do?admin=admin">강의관리</a>
						    <a class="dropdown-item" href="${path}/packages/adminlist.do">패키지관리</a>
						  </div>
						</div>
						<div class="item dropdown col-xl-4 text-center dropdown-toggle"
							style="display: initial !important;">
							<a class="plain cursor" data-ga-category="header" href="${path}/chart/statistics.do"><b>통계</b></a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${path}/chart/memberchart.do">회원통계</a> <a
									class="dropdown-item" href="${path}/chart/lecturechart.do">강의통계</a> <a
									class="dropdown-item" href="${path}/chart/saleschart.do">매출통계</a> <a
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
							<a class="plain cursor" data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal"><b>로그인</b></a>
						</div>
						<div id="" class="item col-xl-4"
							style="display: initial !important;">
							<a
								class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
								href="${path}/member/join.do" data-ga-category="header">
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
<div class="modal fade kdemy-login-form" id="kdemyLoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center">KDEMY LOGIN</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form method="post" id="signInForm" name="signInForm" action="${path}/member/login.do" class="form-horizontal">
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요.">
					<div><c:if test="${message!=null}"><b>${message}</b></c:if></div>			
				</div>
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
				</div>
			<div class="form-check pt-2 pb-1">
				  <input class="form-check-input" type="checkbox" name="loginsave" id="loginsave" value="option1" checked>
				  <label class="form-check-label" for="exampleRadios1">
				   <b>로그인유지</b>
				  </label>
		    </div>
				<div class="input-group input-group-lg text-center pt-2 pb-1">
					<button type="submit" id="join-submit" class="btn btn-outline-dark btn-lg btn-block">
						로그인
					</button>
				</div>

					<div class="float-left pt-2 pb-1">
					  <a href="${path}/member/searchId.do" class="more"><b>아이디 찾기</b></a>
					</div>
					<div class="float-right pt-2 pb-1">
				 	 <a href="${path}/member/searchpass.do" class="more"><b>비밀번호 찾기</b></a>
					</div>
					
				<br><br>
				<div class="text-center pt-2 pb-2">
				   <b>SNS계정으로 편한하게 로그인하세요.</b>
				</div>
				
			   <div class="d-flex row justify-content-md-center pt-2 pb-1">
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_fb.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_ist.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_tw.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_yt.png"></a></div>
 			   </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-dark btn-lg btn-block">신규 가입하기</button>
      </div>
    </div>
  </div>
</div>