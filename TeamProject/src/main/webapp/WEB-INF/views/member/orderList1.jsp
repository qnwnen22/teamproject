<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %> 
  <title>구매목록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
.lecture{
    -webkit-transform:scale(1);
	-moz-transform:scale(1);
	-ms-transform:scale(1);	
	-o-transform:scale(1);	
	transform:scale(1);
	-webkit-transition:.3s;
	-moz-transition:.3s;
	-ms-transition:.3s;
	-o-transition:.3s;
	transition:.3s;
}

.lecture:hover {
    transition: all 0.7s; 
    transition-timing-function: ease;
    background-color: #fcf8f7;
   -webkit-transform:scale(1.05);
	-moz-transform:scale(1.05);
	-ms-transform:scale(1.05);	
	-o-transform:scale(1.05);
	transform:scale(1.05);
}

.lecture:active {
  background-color: #eeeeee;
  }
  
.lectureList{
  width: 100px;
  height: 100px;
}

.img {
	-webkit-transform:scale(1);
	-moz-transform:scale(1);
	-ms-transform:scale(1);	
	-o-transform:scale(1);	
	transform:scale(1);
	-webkit-transition:.3s;
	-moz-transition:.3s;
	-ms-transition:.3s;
	-o-transition:.3s;
	transition:.3s;
}

.img:hover {
    -webkit-transform:scale(1.2);
	-moz-transform:scale(1.2);
	-ms-transform:scale(1.2);	
	-o-transform:scale(1.2);
	transform:scale(1.2);
}

</style>
<script type="text/javascript">
function click(page) {location.href = "${path}/lecture/all_list.do?curPage="+page;}
</script>
</head>
<body>
<div class="col-xs-12 col-md-8 offset-md-2">
   <div class="col-xs-12 col-sm-12">
      <div class="col-12 d-flex mb-3">
         <div class="col-xl-12 m-2 h-auto d-inline-block">
              <c:forEach var="dto" items="${list2}">
               <div class="row lecture" style="border-radius:10px;">
                  <div class="col-sm-4" style="max-height:15em;">
                     <a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
                        <img src="${path}/lecture/displayFile?fileName=${dto.main_img}" class="lectureImg" style="width:100%; height:100%;">
                      </a>
                   </div>

                  <div class="col-sm-6">
                     <div class="short-div m-3 h2"><strong>${dto.subject}</strong></div>
                     <div class="short-div text-right">학생 수 : ${dto.cellCount}</div>
                     <div class="short-div text-right">추천 수 : ${dto.upCount}</div>
                     <div class="short-div text-right">담당강사: ${dto.userid}</div>
                   <%--   <div class="short-div">&nbsp;&nbsp;<span>${dto.buy_date}</span></div> --%>
                  </div>
                  
                  <div class="col-sm-2">
                     <c:choose>
                        <c:when test="${dto.up =='up'}">
                            <form method="post" id="lectureDownForm${dto.lecture_idx}" name="lectureDownForm${dto.lecture_idx}"
                            action="${path}/lecture/lectureDown2.do?lecture_idx=${dto.lecture_idx}" class="m-1 text-center">
                              <button type="submit" class="btn btn-primary btn-sm col-12">
                                 <i class="fas fa-thumbs-up"><span class="d-md-none d-sm-none d-xl-inline">추천</span></i>
                              </button>
                           </form>
                        </c:when>
                        
                        <c:when test="${dto.up =='down'}">
                           <form method="post" id="lectureUpForm${dto.lecture_idx}" name="lectureUpForm${dto.lecture_idx}"
                            action="${path}/lecture/lectureUp2.do?lecture_idx=${dto.lecture_idx}" class="m-1 pt-5 text-center">
                              <button type="submit" class="btn btn-outline-primary btn-sm col-12">
                                 <i class="fas fa-thumbs-up"><span class="d-md-none d-sm-none d-xl-inline">&nbsp;&nbsp;추천</span></i>
                              </button>
                           </form>
                        </c:when>
                        
                        <c:otherwise>
                                                               버그
                        </c:otherwise>
                     </c:choose>
                  </div>
         
               </div>
               <br><br>
                 </c:forEach>
         </div>
      </div>
   </div>
</div>


	<div style="position:fixed; top: 30%; right: 13%;">
	 <div class="lectureList">
	   <a href="http://localhost/Kdemy/lecture/all_list.do"><img class="img" src="img/fixed.png" style="width:100%; height:100%; border-radius:50%;"></a>
	 </div>
	</div>

  <%@ include file="../include/footer.jsp"%> 
</body>
</html>