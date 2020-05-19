<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
<link rel="stylesheet" href="${path}/include/css/carousel.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="${path}/include/js/html5kellycolorpicker.min.js"></script>
<script>
   $(function() {
      //마지막 스크롤 값을 저장할 lastScroll 변수
      var lastScroll = 0;
      $(window).scroll(
            function(event) { //스크롤이 움직일때 마다 이벤트 실행
               //현재 스크롤의 위치를 저장할 st 변수
               var st = $(this).scrollTop();
               //스크롤 상하에 따른 반응 정의
               if (st > lastScroll) {
                  if ($(window).scrollTop() >= 538) { //스크롤이 아래로 538px 이상 내려갔을때 실행되는 이벤트 정의
                     $('header').attr('class',
                           'nav d-xl-block d-lg-block d-none');
                  }
               } else {
                  if ($(window).scrollTop() < 538) { //스크롤이 아래로 538px 이상 올라갔을때 실행되는 이벤트 정의
                     $('header').attr('class', 'nav d-none');
                  }
               }
               //현재 스크롤 위치(st)를 마지막 위치로 업데이트
               lastScroll = st;
            });
      new KellyColorPicker({
         place : 'picker',
         input : 'color'
             
      });
       $("#myBtn").click(function(){
             $('.toast').toast('show');
           });
      //드래그 기본 효과를 막음 .은 클래스 class=fileDrop, #은 id
      $(".fileDrop, .fileDrop1").on("dragenter dragover", function(event) {
         event.preventDefault();
      });
      $(".fileDrop")
            .on(
                  "drop",
                  function(event) {
                     //drop이 될 때 기본 효과를 막음
                     event.preventDefault();
                     //첨부파일 배열(여러개를 동시에 선택해서 드래그 할 수 도 있기때문에 한개만 처리하도록 조치)
                     var files = event.originalEvent.dataTransfer.files;
                     var file = files[0]; //첫번째 첨부파일
                     var formData = new FormData(); //폼 객체
                     formData.append("file", file); //폼에 file 변수 추가
                     //서버에 파일 업로드(백그라운드에서 실행됨)
                     //아래 contentType: false는  multipart/form-data로 처리되는것과 같음
                     $
                           .ajax({
                              type : "post",
                              url : "${path}/upload/uploadBanner",
                              data : formData,
                              dataType : "text",
                              processData : false,
                              contentType : false,
                              success : function(data, status, req) {
                                 console.log("data:"
                                       + getOriginalName1(data)); //업로드된 파일 이름
                                 console.log("status:" + status); //성공,실패 여부
                                 console.log("req:" + req.status);//요청코드값
                                 var str = "";
                                 if (checkImageType(data)) {//이미지 파일
                                    str = "<div><a href='${path}/include/images/main/uploadBanner/displayFile?fileName="
                                          + getImageLink(data)
                                          + "'>";
                                    str += "<img src='${path}/upload/displayFile?fileName="
                                          + data
                                          + "'class='mx-auto d-block' style='height: 18rem;''></a>";
                                    str1 = "<div class='col-12 border mb-3' id='background_div'><h5>"
                                          + getOriginalName1(data)
                                          + "</h5></div><input type='hidden' name='background_img0' value='"+data+"'>";
                                 } else {//이미지가 아닌 경우
                                    str = "";
                                    str += "<a href='${path}/include/images/main/uploadBanner/displayFile?fileName="
                                          + data
                                          + "'>"
                                          + getOriginalName(data)
                                          + "</a>";
                                 }
                                 str += "<span data-src="+data+">[삭제]</span></div>";
                                 var temp = $("img#preImg").detach();
                                 $("img#save").html(temp);
                                 $("#image-container").append(str1);
                                 $(".uploadedList").append(str);
                              }
                           });
                  });//fileDrop 함수
      $(".fileDrop1")
            .on(
                  "drop",
                  function(event) {
                     //drop이 될 때 기본 효과를 막음
                     event.preventDefault();
                     //첨부파일 배열(여러개를 동시에 선택해서 드래그 할 수 도 있기때문에 한개만 처리하도록 조치)
                     var files = event.originalEvent.dataTransfer.files;
                     var file = files[0]; //첫번째 첨부파일
                     var formData = new FormData(); //폼 객체
                     formData.append("file", file); //폼에 file 변수 추가
                     //서버에 파일 업로드(백그라운드에서 실행됨)
                     //아래 contentType: false는  multipart/form-data로 처리되는것과 같음
                     $
                           .ajax({
                              type : "post",
                              url : "${path}/upload/uploadBanner",
                              data : formData,
                              dataType : "text",
                              processData : false,
                              contentType : false,
                              success : function(data, status, req) {
                                 console.log("data:" + data); //업로드된 파일 이름
                                 console.log("status:" + status); //성공,실패 여부
                                 console.log("req:" + req.status);//요청코드값
                                 var str = "";
                                 if (checkImageType(data)) {//이미지 파일
                                    str = "<div><a href='${path}/upload/displayFile?fileName="
                                          + getImageLink(data)
                                          + "'>";
                                    str += "<img src='${path}/upload/displayFile?fileName="
                                          + data
                                          + "'class='mx-auto d-block'style='height: 18rem;''></a>";
                                    str1 = "<div class='col-12 border mb-3' id='background_div1'><h5>"
                                          + getOriginalName1(data)
                                          + "</h5></div><input type='hidden' name='background_img1' value='"+data+"'>";
                                 } else {//이미지가 아닌 경우
                                    str = "";
                                    str += "<a href='${path}/upload/displayFile?fileName="
                                          + data
                                          + "'>"
                                          + getOriginalName(data)
                                          + "</a>";
                                 }
                                 str += "<span data-src="+data+">[삭제]</span></div>";
                                 var temp = $("img#preImg1")
                                       .detach();
                                 $("img#save1").html(temp);
                                 $("#image-container").append(str1);
                                 $(".uploadedList1").append(str);
                              }
                           });
                  });//fileDrop 함수
      //첨부파일 삭제 함수
      $(".uploadedList").on("click", "span", function(event) {//내부적으로 span태그가 클릭되면 삭제
         var that = $(this);//this는 현재 클릭한 태그, 즉 span태그
         $.ajax({
            url : "${path}/upload/deleteFile",
            type : "post",
            data : {//data: "fileName="+$(this).attr("data-src") 아래와 같음   
               fileName : $(this).attr("data-src")
            },
            dataType : "text",
            success : function(result) {
               if (result == "deleted") {
                  that.parent("div").remove();//파일삭제되면 행전체<div>를 삭제처리
                  //that은 span태그를 의미하는데 그 부모인 감싸고 있는 div태그를 지운다는 뜻
                  var temp = $("img#preImg").detach();
                  $("div#imageBanner").html(temp);
                  $("div#background_div").remove();
               }
            }
         });
      });
      $(".uploadedList1").on("click", "span", function(event) {//내부적으로 span태그가 클릭되면 삭제
         var that = $(this);//this는 현재 클릭한 태그, 즉 span태그
         $.ajax({
            url : "${path}/upload/deleteFile",
            type : "post",
            data : {//data: "fileName="+$(this).attr("data-src") 아래와 같음   
               fileName : $(this).attr("data-src")
            },
            dataType : "text",
            success : function(result) {
               if (result == "deleted") {
                  that.parent("div").remove();//파일삭제되면 행전체<div>를 삭제처리
                  //that은 span태그를 의미하는데 그 부모인 감싸고 있는 div태그를 지운다는 뜻
                  var temp = $("img#preImg1").detach();
                  $("div#imageBanner1").html(temp);
                  $("div#background_div1").remove();
               }
            }
         });
      });
      function getOriginalName(fileName) {
         if (checkImageType(fileName)) { //이미지 파일이면 skip
            return;
         }
         var idx = fileName.indexOf("_") + 1; //uuid를 제외한 파일이름만 뽑음
         return fileName.substr(idx);
      }
      function getOriginalName1(fileName) {
         if (checkImageType(fileName)) { //이미지 파일이면 skip
            var idx = fileName.lastIndexOf("_") + 1; //uuid를 제외한 파일이름만 뽑음
            return fileName.substr(idx);
         }
      }
      function getImageLink(fileName) {
         if (!checkImageType(fileName)) {//이미지 파일이 아니면 skip
            return;
         }
         //2018/08/25/s_f53e623b-24db-42f9-b607-9c04528056a5_apple-bg.jpg
         var front = fileName.substr(0, 12);//연월일 경로(0~11번째까지 자르고)
         var end = fileName.substr(14);// 14번째 문자열앞의 s_ 제거
         return front + end;
      }
      function checkImageType(fileName) {
         var pattern = /jpg|png|jpeg/i; //정규표현식(i는 대소문자 무시)
         return fileName.match(pattern); //규칙에 맞으면 true가 리턴
      }
   });

   
</script>
</head>
<body class="m-0 p-0">

   <div id="socketAlert" class="alert alert-primary" role="alert"
      style="display: none;"></div>
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
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=디자인">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img0}');"></div>
                              <div class="iconName">
                                 <span><b>디자인</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=IT,프로그래밍">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img1}');"></div>
                              <div class="iconName">
                                 <span><b>IT,프로그래밍</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=콘텐츠 제작">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img2}');"></div>
                              <div class="iconName">
                                 <span><b>콘텐츠 제작</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=마케팅">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img3}');"></div>
                              <div class="iconName">
                                 <span><b>마케팅</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=번역,통역">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img4}');"></div>
                              <div class="iconName">
                                 <span><b>번역,통역</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=문서,통역">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img5}');"></div>
                              <div class="iconName">
                                 <span><b>문서,통역</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=비즈니스컨설팅">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img6}');"></div>
                              <div class="iconName">
                                 <span><b>비즈니스컨설팅</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=운세,상담">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img7}');"></div>
                              <div class="iconName">
                                 <span><b>운세,상담</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=레슨,실무교육">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img8}');"></div>
                              <div class="iconName">
                                 <span><b>레슨,실무교육</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=주문제작">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img9}');"></div>
                              <div class="iconName">
                                 <span><b>주문제작</b></span>
                              </div>
                           </a>
                        </div>
                        <div class="RootDirectoryThemeItem col-3">
                           <a class="plain"
                              href="${path}/lecture/all_list_search.do?keyword=간판,인쇄">
                              <div class="icon"
                                 style="background: url('${path}/include/images/main/${row.icon_img10}');"></div>
                              <div class="iconName">
                                 <span><b>간판,인쇄</b></span>
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
                        <c:forEach var="row" items="${list}">
                           <div id="mainHeaderContainer"
                              class="position-relative col-xl-12"
                              style="background-color: ${row.color}" id="color1">

                              <c:if
                                 test="${sessionScope.admin_id != null && sessionScope.admin_level == 3}">
                                 <!-- 관리자 메인배너 변경 코드 -->
                                 <button class="btn" data-toggle="modal"
                                    data-target="#mainChange">
                                    <i class="fas fa-cog" data-toggle="Modal"
                                       data-target="#mainChange"></i>
                                 </button>
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
                                                      <div class="col-md-12 col-sm-12 pt-3"
                                                         style="background-color:${row.color}">

                                                         <div class="header position-relative"
                                                            id="kdemiMainHeader">
                                                            <div class="index-opacity-wrap">
                                                               <div
                                                                  class="container-xl col-xl-8 offset-xl-2 col-lg-12">
                                                                  <div class="flex-between-center height-80px row">
                                                                     <div class="flex-left-center col-3 mr-auto">
                                                                        <div class="NavLogo nav-logo-wrapper">
                                                                           <a class="cursor logofont"
                                                                              data-ga-category="header" href="${path}"><b>KDEMY</b></a>
                                                                        </div>
                                                                     </div>
                                                                     <div class="flex-end-center col-auto p-0">
                                                                        <div
                                                                           class="header-right-info NavRight col-xl-12">
                                                                           <c:if test="${sessionScope.admin_id != 'null'}">
                                                                              <div
                                                                                 class="item dropdown col-xl-4 text-center dropdown-toggle"
                                                                                 style="display: initial !important;">
                                                                                 <a class="plain cursor"
                                                                                    data-ga-category="header"><b>관리메뉴</b></a>
                                                                                 <div class="dropdown-menu">
                                                                                    <a class="dropdown-item"
                                                                                       href="${path}/admin/list.do">관리자계정</a> <a
                                                                                       class="dropdown-item" href="#">회원관리</a> <a
                                                                                       class="dropdown-item" href="#">강의관리</a> <a
                                                                                       class="dropdown-item" href="#">패키지관리</a>
                                                                                 </div>
                                                                              </div>
                                                                           </c:if>
                                                                           <div class="item col-xl-4 text-center"
                                                                              style="display: initial !important;">
                                                                              <a class="plain cursor"
                                                                                 data-ga-category="header"><b>전문가 등록</b></a>
                                                                           </div>
                                                                           <div class="item col-xl-4 text-center"
                                                                              style="display: initial !important;">
                                                                              <a class="plain cursor"
                                                                                 data-ga-category="header" data-toggle="modal"
                                                                                 data-target="#kdemyLoginModal"><b>로그인</b></a>
                                                                           </div>
                                                                           <div id=""
                                                                              class="item position-relative col-xl-4"
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
                                                               <div class="d-flex margin-top-15">
                                                                  <div
                                                                     class="col-4 fileDrop uploadedList justify-content-center"
                                                                     id="fileDropDiv">
                                                                     <div class="col-12" id="imageBanner">
                                                                        <img id="preImg"
                                                                           src="${path}/include/images/main/uploadImage.png"
                                                                           class="mx-auto d-block">
                                                                     </div>
                                                                  </div>
                                                                  <div class="col-4 text-align-center"
                                                                     style="text-align: center;">
                                                                     <div>
                                                                        <div class="market-main-description-text">
                                                                           <span>136</span> <span>만건의 거래</span> <span>98.2</span>
                                                                           <span>%의 만족도</span>
                                                                        </div>
                                                                        <div class="hero-title NGM">프리랜서 마켓, KDEMY</div>
                                                                     </div>

                                                                     <div class="margin-top-35">
                                                                        <div class="SearchForm search-form-type-main">
                                                                        </div>
                                                                     </div>

                                                                     <div class="flex padding-top-25">
                                                                        <div class="market-main-or-text">
                                                                           <b>또는</b>
                                                                        </div>
                                                                     </div>
                                                                     <div
                                                                        class="margin-top-30 MarketIndex .flex-center-center">
                                                                        <a
                                                                           class="market-main-link-text .flex-center-center"
                                                                           href="#"> <b>필요한 업무 등록하고 맞춤 견적 받기</b></a>
                                                                     </div>

                                                                  </div>
                                                                  <div
                                                                     class="col-4 fileDrop1 uploadedList1 justify-content-center">
                                                                     <div class="col-12" id="imageBanner1">
                                                                        <img id="preImg1"
                                                                           src="${path}/include/images/main/uploadImage.png"
                                                                           class="mx-auto d-block" id="preImg">
                                                                     </div>
                                                                  </div>
                                                                  <img id="save"> <img id="save1">
                                                               </div>
                                                            </div>
                                                         </div>
                                                      </div>
                                                      <div class="MainThemes">
                                                         <section class="ROOT_DIRECTORY"
                                                            style="margin-top: 70px;"></section>
                                                         <div class="RootDirectoryTheme">
                                                            <div class="background">
                                                               <div style="margin-right: auto; margin-left: auto;"
                                                                  class="col-xl-8 offset-xl-2 col-lg-12 d-none d-xl-block d-lg-block ">
                                                                  <div class="items-container">
                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=디자인">
                                                                           <div class="icon"
                                                                              style="background: url('include/images/main/${row.icon_img0}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>디자인</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=IT,프로그래밍"">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img1}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>IT,프로그래밍</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=콘텐츠 제작">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img2}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>콘텐츠 제작</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=마케팅">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img3}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>마케팅</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=번역,통역">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img4}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>번역,통역</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=문서,통역">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img5}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>문서,통역</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=비즈니스컨설팅">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img6}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>컨설팅</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=운세,상담">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img7}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>운세,상담</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=레슨,실무교육">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img8}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>실무교육</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=레슨,실무교육">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img9}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>주문제작</b></span>
                                                                           </div>
                                                                        </a>
                                                                     </div>

                                                                     <div class="RootDirectoryThemeItem">
                                                                        <a class="plain"
                                                                           href="${path}/lecture/all_list_search.do?keyword=간판,인쇄">
                                                                           <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img10}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>간판,인쇄</b></span>
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
                                                <hr>
                                                <form id="mainChange" name="mainChange"
                                                   action="${path}/main/change.do" method="post"
                                                   enctype="multipart/form-data">
                                                   <div class="d-flex col-12 flex-wrap">
                                                      <div class="setting-items col-4 mb-3">
                                                         <h5>배경색</h5>
                                                         <div id="color-container"
                                                            class="d-flex flex-wrap justify-content-center col-12">
                                                            <canvas id="picker"></canvas>
                                                            <div
                                                               class="col-12 px-auto d-flex justify-content-center mb-3">
                                                               <input id="color" name="color" value="${row.color}">
                                                            </div>
                                                         </div>
                                                         <h5>이미지</h5>
                                                         <div id="image-container"></div>
                                                      </div>
                                                      <div class="setting-items col-8 mb-3">
                                                         <h5>아이콘</h5>
                                                         <div id="icon-container" class="d-flex col-12">
                                                            <div class="RootDirectoryThemeItem col-3">
                                                               <div class="icon"
                                                                              style="background: url('include/images/main/${row.icon_img0}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>디자인</b></span>
                                                                           </div>
                                                               <div
                                                                  class="d-flex justify-content-center form-group">
                                                                  <input type="file" id="file0" name="file0">
                                                               </div>
                                                            </div>
                                                            <div class="RootDirectoryThemeItem col-3">
                                                              <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img1}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>IT,프로그래밍</b></span>
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file1" name="file1">
                                                               </div>
                                                            </div>
                                                            <div class="RootDirectoryThemeItem col-3">
                                                                <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img2}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>콘텐츠 제작</b></span>
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file2" name="file2">
                                                               </div>
                                                            </div>
                                                            <div class="RootDirectoryThemeItem col-3">
                                                                <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img3}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>마케팅</b></span>
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file3" name="file3">
                                                               </div>
                                                            </div>
                                                         </div>
                                                         <div id="icon-container" class="d-flex col-12">
                                                            <div class="RootDirectoryThemeItem col-3">
                                                               <div class="icon"
                                                                  style="background: url('${path}/include/images/main/${row.icon_img4}');"></div>
                                                               <div class="iconName">
                                                                  <span><b>번역,통역</b></span>
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file4" name="file4">
                                                               </div>
                                                            </div>
                                                            <div class="RootDirectoryThemeItem col-3">
                                                                <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img5}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>문서,통역</b></span>
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file5" name="file5">
                                                               </div>
                                                            </div>
                                                            <div class="RootDirectoryThemeItem col-3">
                                                                  <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img6}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>비즈니스컨설팅</b></span>
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file6" name="file6">
                                                               </div>
                                                            </div>
                                                            <div class="RootDirectoryThemeItem col-3">
                                                                 <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img7}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>운세,상담</b></span>
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file7" name="file7">
                                                               </div>
                                                            </div>
                                                         </div>
                                                         <div id="icon-container" class="d-flex col-12">
                                                            <div class="RootDirectoryThemeItem col-3">
                                                                <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img8}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>레슨,실무교육</b></span>
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file8" name="file8">
                                                               </div>
                                                            </div>
                                                            <div class="RootDirectoryThemeItem col-3">
                                                               <div class="icon"
                                                                  style="background: url('${path}/include/images/main/${row.icon_img9}');"></div>
                                                               <div class="iconName">
                                                                  <span><b>주문,제작</b></span>
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file9" name="file9">
                                                               </div>
                                                            </div>
                                                            <div class="RootDirectoryThemeItem col-3">
                                                              <div class="icon"
                                                                              style="background: url('${path}/include/images/main/${row.icon_img10}');"></div>
                                                                           <div class="iconName">
                                                                              <span><b>간판,인쇄</b></span>
                                                                              
                                                               </div>
                                                               <div class="d-flex justify-content-center">
                                                                  <input type="file" id="file10" name="file10">
                                                               </div>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                   <div class="modal-footer">
                                                      <button type="submit" class="btn btn-outline-primary">변경</button>
                                                      <button type="button"
                                                         class="btn btn-outline-secondary"
                                                         data-dismiss="modal">취소</button>
                                                   </div>
                                                </form>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <!-- 메인 변경 끝 -->
                              </c:if>
                              <div class="main-header-gradient"
                                 style="opacity: 0.3
    background-image: linear-gradient(to bottom, ${row.color}, ${row.color})"></div>
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

                                                <!-- 관리자 로그인 -->
                                                <c:if test="${sessionScope.admin_id != null}">
                                                
                                                <a href="#adminAlarmList" data-toggle="collapse" onclick="adminAlarmList()"><i class="far fa-bell"></i></a>
                                                <div class="collapse ml-auto m-2 shadow bg-white adminAlarmList" id="adminAlarmList">
												     <div class="alarmList-header d-flex bg-dark">
												      <div class="text-center col-12 mt-2 p-0">
												        <h5 style="color:white;" class=""><b>알림</b></h5>
												      </div>
												      <input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}">
												     </div>
												     <div class="adminAlarmListBody" id="adminAlarmListBody">
												       
												     </div>
												 </div>
                                                   <div class="item col-xl-4 text-center"
                                                      style="display: initial !important;">
                                                      <a class="plain cursor" data-ga-category="header"
                                                         href="${path}/packages/list.do"><b>패키지 구매</b></a>
                                                   </div>
                                                   <div
                                                      class="item dropdown col-xl-4 text-center dropdown-toggle"
                                                      style="display: initial !important;">
                                                      <a class="plain cursor" data-ga-category="header"
                                                         href="${path}/admin/managementMenu.do"><b>관리메뉴</b></a>
                                                      <div class="dropdown-menu">
                                                         <c:if test="${sessionScope.admin_level == 3}">
                                                            <a class="dropdown-item"
                                                               href="${path}/admin/list.do">관리자계정</a>
                                                         </c:if>
                                                         <a class="dropdown-item"
                                                            href="${path}/member/list.do">회원관리</a> <a
                                                            class="dropdown-item"
                                                            href="${path}/lecture/online_list.do?admin=admin">강의관리</a>
                                                         <a class="dropdown-item"
                                                            href="${path}/packages/adminlist.do">패키지관리</a> <a
                                                            class="dropdown-item"
                                                            href="${path}/member/couponMaker.do">쿠폰관리</a>
                                                       <a class="dropdown-item" href="#" 
						    							onclick="window.open('${path}/chatroom/chatRoomList.do','문의리스트','width=330,height=610,left=500')">문의관리</a>
                                                      </div>
                                                   </div>
                                                   <div
                                                      class="item dropdown col-xl-4 text-center dropdown-toggle"
                                                      style="display: initial !important;">
                                                      <a class="plain" data-ga-category="header"
                                                         href="${path}/chart/statistics.do"><b>통계</b></a>
                                                      <div class="dropdown-menu">
                                                         <a class="dropdown-item"
                                                            href="${path}/chart/memberchart.do">회원통계</a> <a
                                                            class="dropdown-item"
                                                            href="${path}/chart/lecturechart.do">강의통계</a> <a
                                                            class="dropdown-item" href="${path}/chart/saleschart.do">매출통계</a>
                                                      </div>
                                                   </div>
                                                   <a id="userInfo"><b>${sessionScope.admin_id}님</b></a>
                                                   <button data-toggle="modal" data-target="#logOutModal"
                                                      class="btn btn-sm btn-primary font-color-fff btn-normal-silver">
                                                      <b>로그아웃</b>
                                                   </button>
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
                                                            href="${path}/member/join.do"
                                                            data-ga-category="header"> 무료회원가입 </a>
                                                      </div>
                                                   </c:when>

                                                   <c:otherwise>
                                                      <c:choose>
                                                         <c:when
                                                            test="${sessionScope.teacher == 'y' && sessionScope.userid !=null}">
                                                             <a href="#userAlarmList" data-toggle="collapse" onclick="userAlarmList()"><i class="far fa-bell"></i></a>
				                                                <div class="collapse ml-auto m-2 shadow bg-white userAlarmList" id="userAlarmList">
																     <div class="alarmList-header d-flex bg-dark">
																      <div class="text-center col-12 mt-2 p-0">
																        <h5 style="color:white;" class=""><b>알림</b></h5>
																      </div>
																     </div>
																     <div class="userAlarmListBody" id="userAlarmListBody">
																       
																     </div>
																 </div>
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
                                                                     href="${path}/lecture/addLecturePage.do">강의등록</a>
                                                                  <a class="dropdown-item"
                                                                     href="${path}/lecture/myLecturePage.do">등록한 강의</a>
                                                               </div>
                                                            </div>
                                                            <div
                                                               class="item dropdown col-xl-4 text-center dropdown-toggle"
                                                               style="display: initial !important;">
                                                               <a class="plain cursor" data-ga-category="header"><b>나의정보</b></a>
                                                               <div class="dropdown-menu">
                                                                  <a class="dropdown-item"
                                                                     href="${path}/member/mypage.do">나의정보</a>
                                                                  <a class="dropdown-item"
                                                                     href="${path}/cart/cartPage.do">장바구니</a> <a
                                                                     class="dropdown-item"
                                                                     href="${path}/member/updatePointPage.do">쿠폰등록</a>
                                                                  <a class="dropdown-item"
                                                                     href="${path}/member/orderDetail1.do">내 강의목록</a>
                                                               </div>
                                                            </div>

                                                            <a><b>${sessionScope.username}님</b></a>
                                                            <button data-toggle="modal"
                                                               data-target="#logOutModal"
                                                               class="btn btn-sm btn-primary font-color-fff btn-normal-silver">
                                                               <b>로그아웃</b>
                                                            </button>
                                                         </c:when>

                                                         <c:when
                                                            test="${sessionScope.teacher != 'y' && sessionScope.userid !=null}">
                                                            <a href="#userAlarmList" data-toggle="collapse" onclick="userAlarmList()"><i class="far fa-bell"></i></a>
				                                                <div class="collapse ml-auto m-2 shadow bg-white userAlarmList" id="userAlarmList">
																     <div class="alarmList-header d-flex bg-dark">
																      <div class="text-center col-12 mt-2 p-0">
																        <h5 style="color:white;" class=""><b>알림</b></h5>
																      </div>
																     </div>
																     <div class="userAlarmListBody" id="userAlarmListBody">
																       
																     </div>
																 </div>
                                                            <div class="item col-xl-4 text-center"
                                                               style="display: initial !important;">
                                                               <a class="plain cursor" data-ga-category="header"
                                                                  href="${path}/packages/list.do"><b>패키지 구매</b></a>
                                                            </div>
                                                            <div class="item col-xl-4 text-center"
                                                               style="display: initial !important;">
                                                               <a class="plain cursor" data-ga-category="header"
                                                                  href="${path}/teacher/teacherJoinPage.do"><b>전문가
                                                                     등록</b></a>
                                                            </div>
                                                            <div
                                                               class="item dropdown col-xl-4 text-center dropdown-toggle"
                                                               style="display: initial !important;">
                                                               <a class="plain cursor" data-ga-category="header"><b>나의정보</b></a>
                                                               <div class="dropdown-menu">
                                                                  <a class="dropdown-item"
                                                                     href="${path}/member/mypage.do">나의정보</a>
                                                                  <a class="dropdown-item"
                                                                     href="${path}/member/orderDetail1.do">구입한 강의 목록</a>
                                                                      <a class="dropdown-item"
                                                                     href="${path}/cart/cartPage.do">장바구니</a> <a
                                                                     class="dropdown-item" href="#">관심상품</a> <a
                                                                     class="dropdown-item"
                                                                     href="${path}/member/updatePointPage.do">쿠폰등록</a>
                                                               </div>
                                                            </div>
                                                            <a><b>${sessionScope.username}님 </b></a>
                                                            <button data-toggle="modal"
                                                               data-target="#logOutModal"
                                                               class="btn btn-sm btn-primary font-color-fff btn-normal-silver">
                                                               <b>로그아웃</b>
                                                            </button>

                                                         </c:when>

                                                      </c:choose>

                                                   </c:otherwise>
                                                </c:choose>
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
                                             <form action="" id="" class="margin-bottom-0"
                                                method="get" onsubmit="return false">
                                                <div class="search-group text-center cursor">
                                                   <div style="">
                                                      <!-- 0429 9:46 이원혁 추가 -->
                                                      <div class="index-search-bar">
															<input class="pl-5 search-input kdemi" name="keyword" id="keyword" placeholder="보고싶은 강의를 검색해주세요." name="keyword" style="width: 100%; height: 100%; font-size: 1.5rem;">
															<button id="searchBtnNoneTest" class="index-search-btn" onclick="search()" type="submit" style="border: none; background-color: white; outline: 0;"> 
															<img class="width-30px" src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png">
														</button>
														<!--  -->
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

                              <div class="index-header-left d-none d-xl-block mx-auto">
                                 <img class="img-fluid"
                                    src="${path}/include/images/main/${row.background_img0}" onerror="this.style.display='none'">
                              </div>
                              <div class="index-header-right d-none d-xl-block mx-auto">
                                 <img class="img-fluid"
                                    src="${path}/include/images/main/${row.background_img1}"
                                    onerror="this.style.display='none'">
                              </div>
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
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=디자인">
                                          <div class="icon"
                                             style="background: url('include/images/main/${row.icon_img0}');"></div>
                                          <div class="iconName">
                                             <span><b>디자인</b></span>
                                          </div>
                                       </a>
                                    </div>

                                    <div class="RootDirectoryThemeItem">
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=IT,프로그래밍">
                                          <div class="icon"
                                             style="background: url('${path}/include/images/main/${row.icon_img1}');"></div>
                                          <div class="iconName">
                                             <span><b>IT,프로그래밍</b></span>
                                          </div>
                                       </a>
                                    </div>

                                    <div class="RootDirectoryThemeItem">
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=콘텐츠 제작">
                                          <div class="icon"
                                             style="background: url('${path}/include/images/main/${row.icon_img2}');"></div>
                                          <div class="iconName">
                                             <span><b>콘텐츠 제작</b></span>
                                          </div>
                                       </a>
                                    </div>

                                    <div class="RootDirectoryThemeItem">
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=마케팅">
                                          <div class="icon"
                                             style="background: url('${path}/include/images/main/${row.icon_img3}');"></div>
                                          <div class="iconName">
                                             <span><b>마케팅</b></span>
                                          </div>
                                       </a>
                                    </div>

                                    <div class="RootDirectoryThemeItem">
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=번역,통역">
                                          <div class="icon"
                                             style="background: url('${path}/include/images/main/${row.icon_img4}');"></div>
                                          <div class="iconName">
                                             <span><b>번역,통역</b></span>
                                          </div>
                                       </a>
                                    </div>

                                    <div class="RootDirectoryThemeItem">
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=문서,통역">
                                          <div class="icon"
                                             style="background: url('${path}/include/images/main/${row.icon_img5}');"></div>
                                          <div class="iconName">
                                             <span><b>문서,통역</b></span>
                                          </div>
                                       </a>
                                    </div>

                                    <div class="RootDirectoryThemeItem">
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=비즈니스컨설팅">
                                          <div class="icon"
                                             style="background: url('${path}/include/images/main/${row.icon_img6}');"></div>
                                          <div class="iconName">
                                             <span><b>비즈니스컨설팅</b></span>
                                          </div>
                                       </a>
                                    </div>

                                    <div class="RootDirectoryThemeItem">
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=운세,상담">
                                          <div class="icon"
                                             style="background: url('${path}/include/images/main/${row.icon_img7}');"></div>
                                          <div class="iconName">
                                             <span><b>운세,상담</b></span>
                                          </div>
                                       </a>
                                    </div>

                                    <div class="RootDirectoryThemeItem">
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=레슨,실무교육">
                                          <div class="icon"
                                             style="background: url('${path}/include/images/main/${row.icon_img8}');"></div>
                                          <div class="iconName">
                                             <span><b>레슨,실무교육</b></span>
                                          </div>
                                       </a>
                                    </div>

                                    <div class="RootDirectoryThemeItem">
                                       <a class="plain"
                                          href="${path}/lecture/all_list_search.do?keyword=주문제작">
                                          <div class="icon"
                                             style="background: url('${path}/include/images/main/${row.icon_img9}');"></div>
                                          <div class="iconName">
                                             <span><b>주문제작</b></span>
                                          </div>
                                       </a>
                                    </div>


												<div class="RootDirectoryThemeItem">
													<a class="plain"
														href="${path}/lecture/all_list_search.do?keyword=간판,인쇄">
														<div class="icon"
															style="background: url('${path}/include/images/main/${row.icon_img10}');"></div>
														<div class="iconName">
															<span><b>간판,인쇄</b></span>
														</div>
													</a>
												</div>
												</c:forEach>
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
    <div style="width: 63%; margin: auto;">
		<div class="flex-end-center col-auto p-0"></div>
	</div>


	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3">
	
	
      <div class="row">
         <div class="col-6 mr-auto pt-3">
            <h5 class="text-left">
               <br> <a href="${path}/lecture/video_list.do">동영상 강의에서 인기있어요!</a>
            </h5>
            <br>
         </div>
      </div>
         
 <!--  슬라이드 1 : 동영상 강의-->
<section class="center slider">
       <c:forEach var="dto" items="${listv}" begin="1" end="10">
       <div class="card col-2 px-0 mr-3 slide_content d-inline-block p-1" style="width:200px; height:300px;">
       <a href="#" onclick="location.href='${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}'">
       <img src="${path}/lecture/displayFile?fileName=${dto.main_img}"class="card-img-top slide-h3" style="width:100%; height:200px;"></a>
        <p class="card-text font-weight-bold text-center h5" style="width:200px; height:100px;">${dto.subject }</p>
       </div>
       </c:forEach>
  </section>

		<div class="row">
			<div class="col-6 mr-auto pt-3">
				<h5 class="text-left">
			<a href="${path}/lecture/online_list.do">실시간 강의에서 인기있어요!</a>
				</h5>
				<br>
			</div>
		</div>
   
 <!--  슬라이드 2 :실시간 강의 -->
<section class="center slider">
       <c:forEach var="dtoon" items="${liston}" begin="1" end="10">
       <div class="card col-2 px-0 mr-3 slide_content d-inline-block p-1" style="width:200px; height:300px;">
       <a href="#" onclick="location.href='${path}/lecture/lecture_list_view.do?lecture_idx=${dtoon.lecture_idx}'">
       <img src="${path}/lecture/displayFile?fileName=${dtoon.main_img}"class="card-img-top slide-h3" style="width:100%; height:200px;"></a>
        <p class="card-text font-weight-bold text-center h5" style="width:200px; height:100px;">${dtoon.subject }</p>
       </div>
       </c:forEach>
  </section>

      <div class="row">
         <div class="col-6 mr-auto pt-3">
            <h5 class="text-left">
             <a href="${path}/lecture/offline_list.do">현장 강의에서 인기있어요!</a>
            </h5>
            <br>
         </div>
      </div>
   
 <!--  슬라이드 3 : 현장 강의 -->
<section class="center slider">
       <c:forEach var="dtooff" items="${listoff}" begin="1" end="10">
       <div class="card col-2 px-0 mr-3 slide_content d-inline-block p-1" style="width:200px; height:300px;">
       <a href="#" onclick="location.href='${path}/lecture/lecture_list_view.do?lecture_idx=${dtooff.lecture_idx}'">
       <img src="${path}/lecture/displayFile?fileName=${dtooff.main_img}"class="card-img-top slide-h3" style="width:100%; height:200px;"></a>
        <p class="card-text font-weight-bold text-center h5" style="width:200px; height:100px;">${dtooff.subject }</p>
       </div>
       </c:forEach>
  </section>

<hr>

      <div class="d-flex">
         <div class="col-6 m-0 p-1">
           <div class="col-12 justify-content-between">
            <div class="h4 float-left ">
               <b>공지사항</b>
           </div>
            <div class="h6 float-right hoverplus"><a href="${path}/notice/list.do"><더보기></a></div>
            </div>
            <table class="table table-bordered table-hover text-center">
               <thead class="thead-dark">
                  <tr>
                     <th>제목</th>
                  </tr>
               </thead>
               <tbody>
               <c:forEach var="notice" items="${listnotice}" begin="0" end="3">
                  <tr style="cursor: pointer;" onclick="location.href='${path}/notice/view.do?bno=${notice.bno}'">
                     <td>${notice.title }</td>
                  </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
         <div class="col-6 m-0 p-1">
            <div class="col-12 justify-content-between">
            <div class="h4 float-left ">
               <b>베스트 후기</b>
            </div>
            <div class="h6 float-right hoverplus"><a href="${path}/review/list.do"><더보기></a></div>
            </div>
            <table class="table table-bordered table-hover text-center">
               <thead class="thead-dark">
                  <tr>
                     <th>과목 &gt; 강사</th>
                        <th>제목</th>
                        <th>조회수</th>
                  </tr>
               </thead>
               <tbody>
               <c:forEach var="review" items="${listreview}" begin="0" end="3">
                  <tr style="cursor: pointer;" onclick="location.href='${path}/review/view.do?bno=${review.bno}'">
                     <td>${review.subject} &gt; ${review.teacher}</td>
                        <td>${review.title}</td>
                           <td>${review.viewcnt}</td>
                  </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div>
   </div>
    

<c:if test="${sessionScope.userid != null}">
   <div class="mini-chat-button panel-group fixed-bottom ml-auto mr-5 mb-5 shadow bg-white d-none d-xl-block" id="adminChat">
      <a href="#miniChat" data-toggle="collapse" id="btnMiniChatJoin"><img src="${path}/include/images/main/chaticon.png" class="mx-auto d-block mt-3 mb-3"></a>
   </div>
   </c:if>
   <div class="collapse fixed-bottom ml-auto m-2 shadow bg-white mini-chat" id="miniChat">
        <div class="miniChat-header d-flex bg-dark">
         <div class="text-center col-10 mt-2 p-0">
           <h5 style="color:white;" class="pl-5"><b>실시간 문의</b></h5>
         </div>
        <div class="col-2 p-0">
          <a href="#miniChat" data-toggle="collapse"><img src="${path}/include/images/main/chatOut.png" class="ml-auto d-block mr-1.5"></a>
        </div>
        </div>
          <div class="p-3 shadow bg-silver mx-auto mt-2 mini-chat-screen overflow-auto" id="admin_chat">
            <ul id="messageAdmin" class="overflow-auto">
              <li class="col-12" style="width: 100%;">KDEMY 상담 시간은 (월요일~금요일) 10:00~18:00까지 입니다.</li>
         </ul>
         </div>
         <div class="input-group p-4 mini-chat-send">
            <input type="text" class="form-control" id="chatMsg" placeholder="Type a message...">
            <input type="hidden" id="admin_id" value="admin">
                 <input type="hidden" id="userid" value="${sessionScope.userid}"> 
                 <input type="hidden" id="chatNum" value="${sessionScope.usernum}">
                 <input type="hidden" id="sender" value="${sessionScope.userid}">
                  <input type="hidden" id="num" value="${sessionScope.usernum}">
              <div class="input-group-append">
                <button class="btn btn-success" id="btnchatSend" type="submit">SEND</button>
              </div>
         </div>
    </div>
    
<script>

$(document).ready(function() {
 $('.slider').slick({
	slide: 'div',		//슬라이드 되어야 할 태그 
	infinite : true, 	//무한 반복 옵션	 
    slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
	slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
	speed : 1500,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
    index: 1,
    focusOnSelect:true,
    pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
	vertical : false,		// 세로 방향 슬라이드 옵션
	prevArrow : "<button type='button' class='slick-prev btn btn-sm' style='float:left; height:300px;'> < </button>",	// 이전 화살표 모양 설정	
	nextArrow : "<button type='button' class='slick-next btn btn-sm' style='position:absolute; top:0; left:100%; height:300px;'> > </button>",		// 다음 화살표 모양 설정
	draggable : true, 
    responsive: [{
       breakpoint: 960,
       settings: {        
         slidesToShow: 3
       }
     },
       {
     breakpoint: 768,
     settings: {
      
       slidesToShow: 2
     }
   }]
 });
});

$(function () {
   $('#btnMiniChatJoin').on('click', function(evt) {
      evt.preventDefault();
     if (socket.readyState !== 1) return;
             let target=$("#admin_id").val();
             let chatNum=$("#chatNum").val();
             let sender=$("#userid").val();
             let chat="chat"+chatNum;
             
             socket.send(chat+","+sender+","+target+","+chatNum+",대화신청");
    var chatroom_name= $('#userid').val();
    var chatroom_id = $('#chatNum').val();
    $.ajax({
           data : {
              chatroom_name : chatroom_name,
               chatroom_id : chatroom_id               
           },
           url : "${path}/chatroom/createRoomInsert.do"
    });
});

   $("#chatMsg").keypress(function (e) {
        if (e.which == 13){
           chatEnter();  // 실행할 이벤트
        }
    });

   $('#btnchatSend').on('click', function(evt) {
      var chatMsgExp =document.getElementById("chatMsg");
      if(chatMsgExp.value=="") {
         alert("메시지를 입력해주세요.");
         chatMsgExp.focus();
         return false;
      }
      evt.preventDefault();
        if (socket.readyState !== 1) return;
                let target=$("#admin_id").val();
                let chatNum=$("#chatNum").val();
                let sender=$("#userid").val();
                let chatMsg=$("#chatMsg").val();
                socket.send(sender+chatNum+","+sender+","+target+","+chatNum+","+chatMsg);
                $("#chatMsg").val("");
                var mymessage="<li class='bg-light text-left mr-auto mb-1'><b>"+sender+" :</b><br>"+chatMsg+"</li>";
                $("#messageAdmin").append(mymessage);
                $("#admin_chat").scrollTop($("#admin_chat")[0].scrollHeight);
    });
});

function chatEnter() {
   var chatMsgExp =document.getElementById("chatMsg");
   if(chatMsgExp.value=="") {
      alert("메시지를 입력해주세요.");
      chatMsgExp.focus();
      return false;
   }
     if (socket.readyState !== 1) return;
             let target=$("#admin_id").val();
             let chatNum=$("#chatNum").val();
             let sender=$("#userid").val();
             let chatMsg=$("#chatMsg").val();
             
             socket.send(sender+chatNum+","+sender+","+target+","+chatNum+","+chatMsg);
             $("#chatMsg").val("");
             var mymessage="<li class='bg-light text-left mr-auto mb-1'><b>"+sender+" :</b><br>"+chatMsg+"</li>";
             $("#messageAdmin").append(mymessage);
             $("#admin_chat").scrollTop($("#admin_chat")[0].scrollHeight);
}
</script>

   <%@ include file="include/footer.jsp"%>
</body>
</html>