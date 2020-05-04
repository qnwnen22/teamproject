<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 신청</title>
<style type="text/css">
.input-group {
   position: relative;
   display: table;
   border-collapse: separate;
}
.profileImgBox{
 box-sizing:inherit ;
width: auto;
    border-radius: 50%;
    overflow: hidden;
}


.img-circle {
 box-sizing:inherit ;
    width: 100%;
    object-fit: cover;
}

.TJoinForm {
   border-style: solid;
   border-width: 0px 0px 2px 0px;
   border-color: #00111a;
   /*  background: #adebeb; */
}

.TJoinFormCertificate {
   border-style: solid;
   border-width: 0px 0px 2px 0px;
   border-color: #00111a;
}
.TJoinBox1{

}

.TJoinFormImg {
   width: 100%;
}


.teacherJoinBoxIn {
   background-color: #ebebe0;
}

.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #999;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #fdfdfd;
   cursor: pointer;
   border: 1px solid #ebebeb;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

/* .form-group {
   background-color: #ebebe0;
}

.form-control {
   background-color: #ece9df;
} */
</style>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/fixed-topbar.jsp"%>
<script src="${path}/include/js/teacherJoin.js"></script>
</head>
<body>
   <div class="col-xl-8 offset-xl-2 col-lg-12">
      <!-- 큰외곽  -->
      <div class="row teacherJoinBox">
         <!-- 작은 외곽 -->



         <div class="teacherJoinBox col-md-2  mt-5">
            <!-- 옆에 버튼 -->
            <div class="mt-10 TJoinForm">
               <img class="TJoinFormImg teacherJoinBoxIn mt-10" alt="광고 이미지"
                  src="${path}/include/images/teacher/실시간강의.png">
               <h6 class="text-center">광고이미지 (기능 미구현)</h6>
            </div>

            <div class="mt-10 TJoinForm">
               <div class="teacherJoinBoxIn">
                  <div>
                     <img class="TJoinFormImg text-center" alt="" src="">
                     <!-- ${path}/include/images/review/notice.jpg -->
                     <h4 class="text-center">공지 사항</h4>
                  </div>
                  <div class="mt-5">
                     <div class="img-circle">
                        <a type="button" href="#"><img class="TJoinFormImg" alt=""
                           src="">-회원가입시 2000포인트 지급</a>
                        <!-- ${path}/include/images/slide/slide.jpg -->
                     </div>
                  </div>

                  <div class="mt-5">
                     <div class="img-circle">
                        <a type="button" href="#"><img class="TJoinFormImg" alt=""
                           src="">-5월 3일 페이지 정비</a>
                        <!-- ${path}/include/images/chart/강의.jpg -->
                     </div>
                  </div>

                  <div class="mt-5">
                     <div class="img-circle">
                        <a type="button" href="#"><img alt="" src="">-자격증 도용
                           적발시 퇴출</a>
                     </div>
                  </div>
               </div>
            </div>


         </div>









         <div class="col-md-9 col-md-offset-2">
            <!-- main page -->

            <div class="ml-3 TJoinBox1">
               <div class="mt-4 TJoinForm">
                  <h3 class="font-weight-bold ">전문가 등록페이지</h3>
               </div>

               <c:choose>
                  <c:when test="${sessionScope.teacher == 'n'}">
                     <form method="post" name="form1" id="form1"
                        enctype="multipart/form-data"
                        action="${path}/teacher/teacherInsert.do">

                        <div class="mt-3">
                           <div>
                              <!-- 개인정보 -->
                              <div class="TJoinForm">
                                 <h4 class="ml-4">개인정보</h4>

                              </div>
                              <div class="row">
                                 <div class="col-md-6 mt-3 text-center">
                                    <!-- 프로필 사진 -->
                                    <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6 col-md-offset-3 text-center">
                                    <c:choose>
                                       <c:when test="${empty dto.main_img}">
                                          <div class="profileImgBox">
                                             <img id="profileImg"
                                                src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
                                                class="avatar img-circle img-thumbnail" id="img-circle">
                                          </div>
                                       </c:when>
                                    </c:choose>
                                    </div>
                                    </div>
                                    <div class="filebox text-center  mt-1">
                                       <label for="input_img">+ 이미지를 등록하세요 +</label> <input
                                          class=" ml-5 text-center  file-upload" type="file"
                                          name="thumbnailFile" id="input_img"><i
                                          class="glyphicon glyphicon-plus"></i>
                                    </div>

                                 </div>
                                 <div class="col-md-6 mt-2">
                                    <!-- 아이디 입력 -->
                                    <div class="mt-5 " onsubmit="return beforeSubmit()">
                                       <div class="form-group">
                                          <div class="row">
                                             <div class="col-md-4">
                                                <h6>아 이 디 :</h6>
                                             </div>
                                             <div class="col-md-8 text-secondary">
                                                <input type="hidden" value="${sessionScope.userid}"
                                                   readonly name="userid" id="userid">${sessionScope.userid}
                                                   <input type="hidden" name="nickname" id="nickname" value="${sessionScope.nickname}">
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="row">
                                             <div class="col-md-4 ">
                                                <h6>이 &nbsp;&nbsp;&nbsp;&nbsp; 름 :</h6>
                                             </div>
                                             <div class="col-md-8 text-secondary">
                                                <input type="hidden" value="${sessionScope.username}"
                                                   readonly name="username" id="username">${sessionScope.username}
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>

   
                           <div class="mt-3 ">
                              <!-- 학력 -->
                              <div class="TJoinForm">
                                 <h4 class="ml-4">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</h4>
                              </div>
                              <div class="row mt-3 TJoinCertificate">
                                 <div class="col-md-2"></div>
                                 <div class="col-md-8 col-md-offset-3">
                                    <div class="row">
                                       <div class="col-md-4">
                                          <label for="finalEducation"><h6>최&nbsp;종&nbsp;&nbsp;&nbsp;학&nbsp;력</h6></label>
                                       </div>
                                       <div class="col-md-8">
                                          <div class="form-group">
                                             <select id="finalEducation" class="form-control"
                                                name="finalEducation">

                                                <option value="" selected>-학력 선택-</option>
                                                <option value="고등학교 졸업">고등학교 졸업</option>
                                                <option value="대학교(2,3년) 졸업">대학교(2,3년제) 졸업</option>
                                                <option value="대학교 졸업">대학교(4년제) 졸업</option>
                                             </select>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="mt-2 row">
                                       <div class="col-md-4">
                                          <label for="schoolName"><h6>학&nbsp;교&nbsp;&nbsp;&nbsp;&nbsp;이&nbsp;름</h6></label>
                                       </div>
                                       <div class="col-md-8 input-group">
                                          <input class="form-control" type="text" name="schoolName"
                                             placeholder="학교 검색(미구현)" aria-describedby="basic-addon2">
                                          <span class="input-group-addon" id="basic-addon2">
                                             <input class="btn btn-outline-dark " type="button"
                                             value="검색">
                                          </span>
                                       </div>
                                    </div>




                                    <div class="mt-3 row">
                                       <div class="col-md-4"></div>
                                       <div class="col-md-8 mb-4">
                                          <input class="form-control" type="text" name="department"
                                             placeholder="(세부)전공"> <label for="department"></label>
                                       </div>
                                    </div>
                                 </div>

                              </div>
                           </div>
                           <!-- 학력 -->

                           <div class="mt-3 ">
                              <!-- 자격증 -->
                              <div class="TJoinForm">
                                 <h4 class="ml-4">자&nbsp;&nbsp;격&nbsp;&nbsp;증</h4>
                              </div>

                              <div class="row mt-3">
                                 <div class="col-md-2"></div>
                                 <div class="col-md-8 col-offset-md-2">
                                    <div class="row mt-3">
                                       <div class="col-md-4 ">
                                          <label for="spec1" class="control-label"><h6>
                                                자&nbsp;격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;증&nbsp;명</h6> </label>
                                       </div>
                                       <div class="col-md-8 input-group">
                                          <input type="text" class="form-control" name="spec1"
                                             id="spec1" placeholder="(기능 미구현)"
                                             aria-describedby="basic-addon3"> <span
                                             class="input-group-addon" id="basic-addon3"><input
                                             class="btn btn-outline-dark" type="button" value="검색"></span>
                                       </div>
                                    </div>


                                    <div class="mt-3">
                                       <div class="row mt-2">
                                          <div class="col-md-4">
                                             <label for="spec1_date" class="control-label">
                                                <h6>취&nbsp;득&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일&nbsp;자</h6>
                                             </label>
                                          </div>

                                          <span id="spec1_date" class="col-md-8 text-right">
                                             <div class="row">
                                                <select name="spec1_y" id="spec1_y"
                                                   class="col-3 form-control ml-3 input-sm">
                                                   <option value="">--</option>
                                                   <%
                                                      for (int i = 2020; i >= 1900; i--) {
                                                   %>
                                                   <option value="<%=i%>"><%=i%></option>
                                                   <%
                                                      }
                                                   %>
                                                </select>
                                                <h6 class="mt-3 ml-1">년</h6>
                                                <select name="spec1_m" id="spec1_m"
                                                   class="ml-2 col-3 form-control">
                                                   <option value="">--</option>
                                                   <%
                                                      for (int i = 1; i <= 12; i++) {
                                                   %>
                                                   <option value="<%=i%>"><%=i%></option>
                                                   <%
                                                      }
                                                   %>
                                                </select>
                                                <h6 class="mt-3 ml-1">월</h6>
                                                <select name="spec1_d" id="spec1_d"
                                                   class="ml-2 col-3 form-control">
                                                   <option value="">--</option>
                                                   <%
                                                      for (int i = 1; i <= 31; i++) {
                                                   %>
                                                   <option value="<%=i%>"><%=i%></option>
                                                   <%
                                                      }
                                                   %>
                                                </select>
                                                <h6 class="mt-3 ml-1">일</h6>
                                             </div>
                                          </span>
                                       </div>
                                    </div>
                                    <div class="row mt-2">
                                       <div class="col-md-4">
                                          <label for="spec1File"><h6>자&nbsp;격&nbsp;증&nbsp;&nbsp;&nbsp;사&nbsp;진</h6></label>
                                          <span class="spec1_imgJI"></span>
                                       </div>
                                       <div class="col-md-8">
                                          <input class="text-secondary  text-center" type="file"
                                             name="spec1File" id="spec1File">
                                          <!-- 추가할 div영역 -->

                                       </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                       <div class="col-md-12 " id="addSpecDiv"
                                          style="height: auto"></div>
                                       <!-- class="ml-5" -->
                                    </div>
                                    <div class="row">
                                       <div class="col-md-8"></div>
                                       <div class="col-md-4 col-md-offset-8">
                                          <div class="row text-right mt-3">
                                             <div class="col-md-8">
                                                <input class="btn btn-outline-primary btn-sm text-right"
                                                   type="button" value="추가" onclick="addSpec()">
                                             </div>
                                             <div class="col-md-4">
                                                <input class="btn btn-outline-danger btn-sm"
                                                   type="button" value="삭제" onclick="deleteSpec()">
                                             </div>
                                          </div>
                                       </div>
                                    </div>

                                    <div class="offset-md-3">
                                       <div class="mt-3" name="specTable" id="specTable"></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- 자격증 -->


                           <div class="mt-3 ">
                              <!-- 경력사항 -->
                              <div class="TJoinForm">
                                 <h4 class="ml-4">경&nbsp;력&nbsp;&nbsp;&nbsp;사&nbsp;항</h4>
                              </div>

                              <div class="">
                                 <div class="mt-3">
                                    <textarea name="career" id="career"
                                       placeholder="기타 경력사항을 적어주세요." rows="" cols=""
                                       style="width: 100%; height: 200px;"></textarea>
                                    <a class="text-secondary">ex) ##회사 n년근무 등</a>
                                 </div>
                              </div>
                           </div>

                           <div class="mt-3 ">
                              <!-- 경력사항 -->
                              <div class="TJoinForm">
                                 <h4 class="ml-2">이&nbsp;용&nbsp;약&nbsp;관
                                    &nbsp;&nbsp;&nbsp;동&nbsp;의</h4>
                              </div>

                              <div class="">
                                 <!-- offset-md-1 -->
                                 <div class="mt-3">


                                    <div class="form-group" id="provision">
                                       <textarea class="form-control" rows="10" cols="23">
[약관 동의 및 서명]

크몽 판매/홍보대행 약관

제 1조 [목적]
본 약관은 서비스를 판매 · 홍보하는 주식회사 크몽(이하 “회사")와 크몽에 입점하여 서비스를 판매하는 판매자(이하 “판매자") 사이에 체결된 입점 계약에 따른 권리 · 의무 및 책임사항을 규정하여 신뢰와 협조로써 계약 내용을 준수하여 상호발전에 기여하는데 있습니다.

제 2조 [용어의 정의]
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. "서비스"란 "판매자"가 "계약"에서 약정한 바에 따라 “구매자”에게 제공하는 작업물, 활동, 편익, 만족 등 일체를 포괄합니다.
2. "판매기간"이란 "회사"가 "계약"에서 정한 기간동안 “회사의 웹사이트 및 모바일 앱”(이하"웹사이트")상에서 서비스 판매 · 홍보를 진행하는 기간을 말합니다.
3. “컨텐츠"란 “판매자"가 “서비스"를 판매하기 위해 “웹사이트"에 게재한 정보 일체를 포괄합니다.

제 3조 [계약기간]
계약기간은 계약 체결일로부터 판매기간동안 판매한 모든 서비스의 절차가 완료되는 일까지로 합니다.

제 4조 [약관의 명시, 효력 및 개정]
1. 이 약관은 판매자가 회사와 계약조건에 기재된 거래를 함에 있어 이 약관의 내용이 적용됨을 승인함으로써 효력이 발생합니다.
2. 이 약관의 일부조항에 대한 무효는 다른 조항의 효력에 영향을 미치지 않습니다.
3. 이 약관의 내용 개정은 회사의 서비스 이용약관에 의거합니다. 변경된 약관의 적용일자 및 개정 사유를 명시하여 현행 약관과 함께 그 적용일자 7일(다만, 회원에게 불리한 내용으로 변경하는 경우에는 30일) 이전부터 적용일자 전일까지 공지합니다. 개정된 약관은 개정 약관에서 소급효를 부여하지 않는 이상, 적용일자 이전으로 소급적용 되지 않습니다.

제 5조 [계약상 업무내용]
1. 회사의 업무내용
가. 회사는 판매자가 요청한 컨텐츠를 절차에 의거하여 회사의 웹사이트 등에 노출하여 판매자의 서비스를 판매합니다.
나. 회사는 회사의 웹사이트 등(웹사이트를 포함한 회사의 홍보채널 일체)을 통해 판매자와 판매자의 서비스를 홍보하기 위해 이를 적극 활용하여 홍보합니다.
2. 판매자의 업무내용
가. 판매자는 판매 시점으로 부터 계약에서 정한 계약기간만료일까지 구매자에게 웹사이트에 명시된 서비스를 제공합니다.
나. 판매자는 제공하는 서비스에 대한 품질 관리 및 구매자에 대한 판매 책임을 부담합니다.
라. 회사가 승인한 내용과 판매자가 실제 제공하는 서비스가 다름으로 인하여 발생하는 문제는 전적으로 판매자의 책임으로 합니다.
다. 판매자는 서비스를 임의로 변경, 가공, 교환 등을 하지 않고 회사가 승인한 내용으로 서비스를 제공합니다.

제 6조 [민원처리]
민원처리에 있어 판매자의 귀책사유가 발견될 경우, 해당 민원에 대한 처리 및 관련하여 발생되는 비용과 손해에 대해서는 판매자의 책임으로 합니다.

제 7 조 [계약의 책임]
1. 판매자는 서비스 내용에 타인의 명예나 권리(지적 재산권 포함), 사회윤리 및 공공의 안녕질서를 침해하는 내용의 정보나 사실과 상이한 정보를 포함시켜서는 안되며, 이를 위반할 경우 발생되는 제반 분쟁 및 문제 해결에 대하여 전적인 책임을 집니다.
2. 판매자는 서비스 내용에 정보통신윤리위원회 강령상 문제가 될 수 있는 일체의 내용이 포함되어 있지 않음을 보장하여야 합니다.
3. 판매자가 본 조항의 의무 위반으로 회사가 민·형사상 분쟁에 처하게 되는 경우, 판매자는 이로 인하여 회사에 손해가 발생하지 않도록 신의와 성의를 다하여 회사를 면책시킵니다.

제 8조 [계약의 이행 불가사항 통지의무]
판매자는 소재지, 연락처 등의 중대한 개인 정보 변경으로 서비스 제공이 불가능하거나 그에 상응하는 변경사항이 발생할 경우 3영업일 이내에 회사에게 반드시 통지합니다. 이를 위반할 경우 회사에 발생한 모든 손해에 대하여 판매자가 일체의 책임을 집니다.

제 9조 [계약의 해제/해지]
1 .회사와 판매자는 이 약관에 명시된 사항을 위반하는 경우 3일 이내에 상대방에게 위반사항에 대해 시정할 것을 요구할 수 있으며, 일방 당사자의 시정요구에도 불구하고 상대방이 위반사항을 시정하지 아니하면 계약을 해지할 수 있습니다.
2. 회사와 판매자는 일방이 다음 각 호의 어느 하나에 해당하는 경우 통지로써 본 계약을 즉시 해지할 수 있습니다.
가. 본 계약상의 의무사항을 위반하여 상대방이 시정을 요구하여도 상당한 기간 내에 위반사항을 완전히 시정하지 않는 경우
나. 당사자의 일방이 가압류, 압류, 가처분, 경매 등 강제 집행을 받아 본 계약의 목적을 달성할 수 없는 재정적 문제가 발생하는 경우.
다. 당사자의 일방이 파산, 화의, 워크아웃 또는 회사정리절차 개시 신청을 한 경우.
라. 당사자의 일방이 상대방의 신용을 훼손하는 등 양 당사자 간에 본 특약의 목적을 달성할 수 없을 정도로 신뢰 관계가 훼손된 경우.
마. 기타 관계법령의 제·개정, 정부의 명령, 법원의 판결 등으로 본 특약을 계속 유지하기 어려운 경우.

제 10조 [계약의 양도금지]
회사와 판매자는 상대방의 사전 동의 없이 계약상의 권리 · 의무의 전부 또는 일부를 제3자에게 양도하거나 질권의 목적으로 사용할 수 없습니다.

제 11조 [대금정산]
1. 총판매 대금에서 판매 수수료를 제외한 금액을 판매자에게 수익금으로 정산하고, 판매 수수료의 요율은 내부정책에 따릅니다.
2. 구매자가 구매를 확정한 즉시 수수료를 제외한 금액이 수익금으로 전환됩니다.
3. 판매자는 수익금에 대하여 출금 신청을 할 수 있으며 출금이 신청된 수익금은 2영업일 이내에 등록해주신 판매자의 계좌로 출금됩니다. 단, 출금신청 및 취소 가능 시간은 9시에서 15시까지로 제한됩니다.
4. 판매자가 계약관련 하여 관계법령이나 이 약관의 위반을 포함한 서비스 이행에 문제가 발생한 경우 회사는 해결 시까지 대금지급을 보류 할 수 있습니다.
5. 자연재해 또는 금융사의 전산이슈 발생으로 인한 수익금 입금지연에 대하여서는 회사가 별도 책임을 부담하지 않습니다.

제 12조 [판매 취소]
거래 중 판매자의 귀책 사유로 인해 일방적으로 판매가 취소되어 피해가 발생하는 경우, 판매자는 관계법령에 따라 위약금을 회사에 지급합니다.

제 13조 [환불]
1. 회사는 정당한 사유가 있는 경우, 서비스에 대해 판매자의 동의 절차 없이 구매자에게 환불할 수 있습니다. 이 경우 정당한 사유가 있는지는 회사 내부의 객관적 기준에 따라 회사가 판단합니다.
2. 회사는 정산 완료 이후에 환불이 발생하는 경우 판매자에게 환불 금액을 추가로 청구할 수 있습니다.

제 14조 [보증 및 면책]
1. 판매자가 관련법령을 위반하거나 민원이 제기되어 계약 진행하기 곤란한 사유가 발생하는 경우 위반사항이 시정될 때까지 판매기간이 조정되거나 서비스의 판매가 중지될 수 있습니다.
2. 회사가 판매자로부터 제공받은 정보 또는 제3자의 지적재산권, 개인정보 등 제반 권리 침해를 이유로 분쟁이 발생하거나 발생한 우려가 있는 경우 판매자는 판매자의 비용으로 회사를 면책시키고, 이와 관련하여 회사에 손해가 발생한 경우 이에 대한 모든 책임을 집니다.

제 15조 [서비스 품질보증]
1. 계약의 체결과 동시에 판매자는 계약기간 동안 서비스의 품질을 떨어뜨리는 행위나 회사의 경쟁업체 등에 동일 유사한 서비스의 판매대행을 위탁하는 행위를 할 수 없습니다. 단, 판매 특성상 서비스 품질이 현저하게 떨어지지 않는 경우나 구매자가 서비스를 이용하는 데에 있어 불편을 초래하지 않는 경우에는 예외로 합니다.
2. 판매자는 신의성실의 원칙에 입각하여 행동하여야 하며, 연락두절, 직거래 유도 및 구매자가 정상적인 서비스를 받는 과정상에서 회사 및 구매자의 신뢰와 기대를 배반하여서는 안 됩니다.

제 16조 [비밀유지]
1. 계약 체결의 모든 사항은 기밀이며, 회사와 판매자는 본 업무 수행과 관련하여 알게 된 상대방의 영업 비밀, 지적 재산 등 일체의 정보 모두 상대방의 사전 동의 없이 외부로 유출 및 공개하거나 고유 목적 이외의 용도로 사용할 수 없습니다.
2. 본 조항은 계약기간 및 계약 종료 후에도 적용됩니다.
3. 단, 회사는 법원, 수사기관 또는 정부기관이 요청 시 판매자의 정보를 제공할 수 있으며, 판매자로부터 채무를 변제받기 위하여 채권추심업체에 판매자의 정보를 제공할 수 있습니다.

제 17조 [지적재산권]
1. 계약의 이행을 위해 판매자의 컨텐츠를 활용한 회사의 저작물에 대한 저작권 및 소유권은 회사에 귀속하며, 판매자는 계약에서 합의한 용도 이외의 목적으로 회사의 저작물을 사용할 수 없습니다.
2. 회사는 계약의 이행을 위하여 필요한 범위에 한하여 판매자의 컨텐츠 등 지적 재산 사용할 수 있습니다.

제 18조 [개인정보보호]
1. 판매자와 회사는 상대방으로부터 계약의 이행을 위하여 회사의 회원정보를 제공받는 경우 개인정보 보호법 등 관련 법령에 따른 제반 절차와 기준을 준수하여야 하며, 이를 제 3자에게 제공하거나 동의 받은 목적 이외의 용도(예 : 광고성 문자, 이메일 발송 등)로 사용할 수 없습니다.
2. 전항과 관련하여 판매자는 거래완료 즉시 구매자의 정보를 파기하여야 합니다.


제 19조 [손해배상]
1. 회사와 판매자 중 어느 일방의 귀책사유로 이 약관에서 정한 계약 내용을 위반함으로 인하여 구매자 또는 제3자에게 손해가 발생하 경우, 원인을 제공한 귀책사유자는 구매자 또는 제 3자에게 손해발생시 발생한 모든 손해(변호사 보수 등의 방어비용 포함)를 배상할 책임을 집니다.
가. 판매자의 귀책사유로 인한 구매자로부터의 손해배상 청구 및 제소, 기타 관공서로부터의 행정조치에 대해 판매자는 모든 책임을 지며, 또한 이로 인한 회사의 손해에 대해서도 배상하여야 합니다.
나. 판매자의 귀책사유로 발생된 회사의 판매 기회손실 및 이미지 손상은 전적으로 판매자가 책임을 지며, 판매자는 상거래 관계의 손해배상을 별도로 회사에게 지급합니다.
다. 나항의 방법은 회사와 판매자의 별도 합의에 의합니다.
2. 판매자가 회사에 대한 채무가 있는 경우 회사는 판매자에게 지급할 대금으로 즉시 상계 조치 할 수 있습니다.

제 20조 [위약벌]
판매자가 본 약관의 제10조[계약의 양도 금지], 제15조[서비스의 품질 보증] 내지 제18조[개인 정보보호]의 내용을 위배하였을 경우 위약벌이 발생할 수 있으며, 회사는 이와 별도로 손해배상을 청구할 수 있습니다.

제 21조 [공정거래 준수]
판매자와 회사는 공정하고 투명한 거래를 위하여 다음 각호의 사항을 준수 합니다.
1. 판매자와 회사는 본 계약과 관련하여 상대방의 임직원 및 이해관계자에게 금품, 향응 등 경제상의 이익 또는 편의를 요구하거나 제공하지 아니하며, 공정한 거래질서에 반하는 행위를 하여서는 안 됩니다.
2. 판매자는 회사의 임직원으로부터 부당한 이익의 제공을 요청받았을 경우 이를 거부하고 즉시 회사에 알려야 하며, 회사의 관련 조사에 성실히 응해야 합니다.
3. 본조항의 위반 당사자는 모든 민형사상의 법적 책임을 부담하며, 상대방은 계약의 전부 또는 일부를 해제 또는 해지할 수 있습니다.

제 22조 [관할법원]
본 계약에 대한 소송의 관할법원은 한국내의 “회사”의 주소지 관할 법원으로 합니다.

제 23조 [분쟁의 해결]
이 약관에서 명시되지 않은 사항, 해석상 이견이 있는 경우 관련 법규 및 상관습에 따르기로 하며, 합의가 이루어지지 않을 경우 본 약관의 22조의 내용에 따라 관할 법원을 통하여 분쟁을 해결합니다.

부칙
1. 이 약관은 2018년 1월 29일 부터 시행합니다.

.
               </textarea>
                                       <div class="form-check form-check-inline">
                                          <div class="radio">
                                             <label> <input type="radio" id="provisionYn"
                                                name="provisionYn" value="Y" autofocus="autofocus"
                                                checked> 동의합니다.
                                             </label>
                                          </div>
                                          <div class="radio">
                                             <label> <input type="radio" id="provisionYn"
                                                name="provisionYn" value="N"> 동의하지 않습니다.
                                             </label>
                                          </div>
                                       </div>
                                    </div>




                                 </div>
                              </div>
                           </div>






                           <div class="col-md-3 offset-md-9 ">
                              <div class="row">
                                 <div class="col-md-7 ">
                                    <h5>
                                       <input class="btn btn-outline-primary" type="button"
                                          onclick="insertTeacher()" value="강사 신청">
                                    </h5>
                                 </div>
                                 <div class="col-md-5">
                                    <h5>
                                       <input class="btn btn-outline-danger" type="button"
                                          value="취소" onclick="history.back()">
                                    </h5>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </form>
                  </c:when>

                  <c:when test="${sessionScope.teacher == 'w'}">
                     <h1>신청 대기중 입니다...</h1>

                  </c:when>

                  <c:when test="${sessionScope.teacher == 'y'}">
                     <h1>이미 강사 회원입니다.</h1>
                  </c:when>
                  <c:otherwise>
                     <h2>세션이 없습니다. 다시 로그인 해주세요.</h2>
                  </c:otherwise>
               </c:choose>
            </div>
         </div>

      </div>
      <!-- 작은 와곽  -->

   </div>








   <%@ include file="../include/footer.jsp"%>
   <!-- 부스 스트랩 4.4.1 -->
   <script>
      $(document).ready(function() {
         $("#profileImg").click(function() {
            $("#input_img").click();
         })
      })

      var sel_file;

      $(document).ready(function() {
         $("#input_img").on("change", fileChange);
      });

      function fileChange(e) {
         e.preventDefault();

         var files = e.target.files;
         var filesArr = Array.prototype.slice.call(files);

         filesArr.forEach(function(f) {
            if (!f.type.match("image.*")) {
               alert("확장자는 이미지 확장자만 가능합니다.");
               return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
               $(".avatar").attr("src", e.target.result);
               $(".avatar").css("height", "200px")
            }
            reader.readAsDataURL(f);
         });

         var file = files[0]
         console.log(file)
         var formData = new FormData();

         formData.append("file", file);

         $.ajax({
            url : '${path}/lecture/uploadAjax.do',
            enctype : 'multipart/form-data',
            data : formData,
            dataType : 'text',
            processData : false,
            contentType : false,
            type : 'POST',
            success : function(data) {
               alert("프로필 이미지가 변경 되었습니다.")
            }
         })

         function checkImageType(fileName) {
            var pattern = /jpg$|gif$|png$|jpeg$/i;
            return fileName.match(pattern);
         }

         function getOriginalName(fileName) {
            if (checkImageType(fileName)) {
               return;
            }

            var idx = fileName.indexOf("_") + 1;
            return fileName.substr(idx);

         }

         function getImageLink(fileName) {

            if (!checkImageType(fileName)) {
               return;
            }
            var front = fileName.substr(0, 12);
            var end = fileName.substr(14);

            return front + end;
         }
      }
   </script>
</body>
</html>