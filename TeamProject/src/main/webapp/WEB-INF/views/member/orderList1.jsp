<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %> 
  <title>구매목록</title>
 <head>
  <title>Slick Playground</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="${path}/include/css/slick.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/include/css/slick-theme.css"/>
  <style type="text/css">
/* div{border:1px solid black;} */
.fa-heart{color:red;}
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
     transform:rotate(-5eg);
    -ms-transform:rotate(-5deg);
    -webkit-transform:rotate(-5deg);
/*     -webkit-transform:scale(1.2);
	-moz-transform:scale(1.2);
	-ms-transform:scale(1.2);	
	-o-transform:scale(1.2);
	transform:scale(1.2); */
} 
</style>
<script type="text/javascript">
function click(page) {location.href = "${path}/lecture/all_list.do?curPage="+page;}

$(function(){
    var responseMessage = "<c:out value="${message}" />";
    if (responseMessage != ""){
        alert(responseMessage)
    }
})
</script>
</head>
<body class="Kdemy">
<div class="col-xs-12 col-md-8 offset-md-2 Kdemy-content">
   <div class="col-xs-12 col-sm-12">
      <div class="col-12 d-flex mb-3">
         <div class="col-xl-12 m-5 h-auto d-inline-block">
              <c:forEach var="dto" items="${list2}">
                <div class="row lecture shadow m-2 p-5" style="border-radius:10px;">
               
                  <div class="col-sm-5" style="height:15em;">
                    <img src="${path}/lecture/displayFile?fileName=${dto.main_img}" class="lectureImg" style="width:100%; height:100%; border-radius:10px;">
                   </div>
                  <div class="col-sm-7">
                     <div class="short-div m-3 h2"><strong>${dto.subject}</strong></div>
                     <div class="short-div text-left">담당강사: ${dto.userid} 선생님</div>
                     <div class="short-div text-left">강의누적판매 : ${dto.cellCount} 회</div>
                      <div class="short-div text-right"><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;${dto.upCount}&nbsp;&nbsp;</div>
                     <div class="short-div text-right">
                     <c:choose>
                        <c:when test="${dto.up =='down'}">
                            <form method="post" id="lectureDownForm${dto.lecture_idx}" name="lectureDownForm${dto.lecture_idx}"
                            action="${path}/lecture/lectureUp2.do?lecture_idx=${dto.lecture_idx}" class="m-1 text-right">
                              <button type="submit" class="btn btn-danger btn-sm col-3">
                              <i class="fas fa-thumbs-up"><span class="d-md-none d-sm-none d-xl-inline">&nbsp;&nbsp;추천</span></i>
                              </button>
                           </form>
                        </c:when>
                        
                        <c:when test="${dto.up =='up'}">
                           <form method="post" id="lectureUpForm${dto.lecture_idx}" name="lectureUpForm${dto.lecture_idx}"
                            action="${path}/lecture/lectureDown2.do?lecture_idx=${dto.lecture_idx}" class="m-1 text-right">
                              <button type="submit" class="btn btn-outline-dark btn-sm col-3">
                                 <i class="fas fa-thumbs-up"><span class="d-md-none d-sm-none d-xl-inline">&nbsp;&nbsp;취소</span></i>
                              </button>
                           </form>
                        </c:when>
                        
                        <c:otherwise>
                                                               버그
                        </c:otherwise>
                     </c:choose> </div>
                    
                     <div class="short-div text-left">                     
                           <a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
                           <button type="submit" class="btn btn-outline-dark btn-sm col-12"><b>들어가기</b></button></a>
                       </div>
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