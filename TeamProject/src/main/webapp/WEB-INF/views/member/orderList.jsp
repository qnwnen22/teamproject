<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <%@ include file="../include/header.jsp" %>
<head>
  <title>구매목록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">   
<link rel="stylesheet" href="https://bootswatch.com/4/simplex/bootstrap.min.css"/>
<style>
  a{color:black;}
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
</style>
<script>
function beforeup(){
	alert("추천되었습니다!" );
}
function beforedown(){
	alert("추천이 취소되었습니다!");
}
</script>
</head>
<body>
	<div class="container" >
	<div class="col-sm-12">
	<br>
	  <c:forEach var="dto" items="${list2}">
			<div class="row lecture" style="border-radius:10px;">
			<div class="shadow col-sm-5" ><a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
			    <img src="${path}/lecture/displayFile?fileName=${dto.main_img}" class="img-responsive" style="height:200px; width:100%; border-radius:10px;"></a></div>
				 <div class="col-sm-7">
                     <div class="short-div m-3 h2"><strong>${dto.subject}</strong></div>
                     <div class="short-div text-left">담당강사: ${dto.userid} 선생님</div>
                     <div class="short-div text-left">강의누적판매 : ${dto.cellCount} 회</div>
                      <div class="short-div text-right"><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;${dto.upCount}</div>
                     <div class="short-div text-right">
                     <c:choose>
                        <c:when test="${dto.up =='down'}">
                            <form method="post" id="lectureDownForm${dto.lecture_idx}" name="lectureDownForm${dto.lecture_idx}"
                            action="${path}/lecture/lectureUp1.do?lecture_idx=${dto.lecture_idx}" class="m-1 text-right" onsubmit="beforeup()">
                              <button type="submit" class="btn btn-primary btn-sm col-3">
                              <i class="fas fa-thumbs-up"><span class="d-md-none d-sm-none d-xl-inline">&nbsp;&nbsp;추천</span></i>
                              </button>
                           </form>
                        </c:when>
                        
                        <c:when test="${dto.up =='up'}">
                           <form method="post" id="lectureUpForm${dto.lecture_idx}" name="lectureUpForm${dto.lecture_idx}"
                            action="${path}/lecture/lectureDown1.do?lecture_idx=${dto.lecture_idx}" class="m-1 text-right" onsubmit="beforedown()">
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
	<script>
	function click(page) {location.href = "${path}/lecture/all_list.do?curPage="+page;}
	</script>
	</body>
</html>