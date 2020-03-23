<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
</head>
<body>
<%@ include file="include/topbar.jsp"%>
	<div class="global-body">
		<div class="master-body">
			<div class="MasterBodyDestTop">
				<div class="kdemimobile"></div>
				<div id="router-view">
					<div class="home">
						<div class="MarketHome">
							<div class="MarketIndex">
								<div id="mainHeaderContainer" class="position-relative">
									<div class="main-header-gradient"></div>
									<div class="header position-relative" id="kdemiMainHeader">
										<div class="index-opacity-wrap" style="padding-top: 30px;">
											<div class="container-xl">
												<div class="flex-between-center height-80px col-xl-12">
													<div class="flex-left-center col-xl-3">
														<div class="NavLogo nav-logo-wrapper">
															<a class="cursor logofont" data-ga-category="header" href="${path}"><b>KDEMY</b></a>
														</div>
													</div>
													<div class="flex-end-center col-xl-4 p-0">
														<div
															class="header-right-info flex-center NavRight col-xl-12">
															<div class="item col-xl-4 text-center"  style="display: initial !important;">
																<a class="plain cursor" data-ga-category="header"><b>전문가
																		등록</b></a>
															</div>
															<div class="item col-xl-4 text-center" style="display: initial !important;">
																<a href="${path}/member/loginPage.do" class="plain cursor" data-ga-category="header"><b>로그인</b></a>
															</div>
															<div id="" class="item position-relative col-xl-4"  style="display: initial !important;">
																<a
																	class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
																	href="${path}/member/write.do" data-ga-category="header"> 무료회원가입 </a>
															</div>
														</div>
													</div>
												</div>
												<br>
											</div>
											<div class="margin-top-15">
											  <div class="header-wrapper pading-side-0">
											    <div>
											      <div class="market-main-description-text">
											        <span>136</span>
											        <span>만건의 거래</span>
											        <span>98.2</span>
											        <span>%의 만족도</span>
											      </div>
											      <div class="hero-title NGM">
											       프리랜서 마켓, KDEMY
											      </div>
											    </div>
											    
											    <div class="margin-top-35"> 
											      <div class="SearchForm search-form-type-main">
											        <form action="" id="searchKeyword" class="margin-bottom-0" method="get" onsubmit="return false" >
											          <div class="search-group text-center cursor">
											            <div style="">
											              <div class="index-search-bar">
											                <span class="typed-element">웹사이트 개발</span>
											                <span class="typed-cursor typed-cursor--blink"></span>
											                <div class="index-search-bar-input"></div>
											                <a id="searchBtnNone" class="index-search-btn" type="submit">
											                 <img class="width-30px" src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png">
											                </a>
											              </div>
											            </div>
											          
											          </div>
											        </form>
											      </div>
											    </div>
											    
											    <div class="flex padding-top-25">
											        <div class="market-main-or-text"><b>또는</b></div>										    
											    </div>
											    <div class="margin-top-30 MarketIndex .flex-center-center">
											      <a class="market-main-link-text .flex-center-center" href="#">
											      <b>필요한 업무 등록하고 맞춤 견적 받기</b></a>											     
											    </div>
											    
											  </div>
											</div>
										</div>
										
										<div class="index-header-left">

										</div>
										<div class="index-header-right">
										
										</div>
										
									</div>
								</div>
								
								<div class="MainThemes">
								  <section class="ROOT_DIRECTORY" style="margin-top: 70px;"></section>
								    <div class="RootDirectoryTheme">
								      <div class="background">
								        <div style="margin-right: auto; margin-left: auto;">
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
<h2><카드를 골라보장></h2>
<div class="row">
<div class="card col-3 px-0">
  <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
<div class="card col-3 px-0" >
  <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
<div class="card col-3 px-0">
  <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
<div class="card col-3 px-0">
  <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</div>
<div class="card">
  <div class="card-header">
    Featured
  </div>
  <div class="card-body">
    <h5 class="card-title">Special title treatment</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>

<div class="card">
  <h5 class="card-header">Featured</h5>
  <div class="card-body">
    <h5 class="card-title">Special title treatment</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
<div class="card mb-3">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
  </div>
</div>
<div class="card mb-3" style="max-width: 540px;">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png" class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
      </div>
    </div>
  </div>
</div>
</body>
</html>
<%@ include file="include/footer.jsp"%>