<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
label{width:20%;}
.form-control{width:80%;}
/* div{border: 1px solid black;} */
</style>
</head>
<body>
 <div class="container">
     <div class="row">
     <!-- 5만 포인트 -->
	       <c:forEach var="dto" items="${couponList}">
	        	<br>
      <div class="col-sm-3 mb-5 ">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body">
            <h5 class="card-title text-muted text-uppercase text-center">${dto.point}포인트</h5>
            <h6 class="card-price text-center">$${dto.point}</h6>
            <hr>
         <!--    <form name="form" id="form" action="makeCoupon.do" method="post"> -->
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰이름${dto.coupon_name}</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰번호는 ${dto.coupon}입니다.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>${dto.point}포인트</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>${dto.coupon_text}</li>
        <!--       <li><span class="fa-li"><i class="fas fa-check"></i></span>  -->
         <!--      <input type="text" maxlength="50" class="siInputTextBox_Email" id="useremail" name="useremail" placeholder="이메일"> -->
         <!--     </li> -->
            </ul>
            <input type="hidden" value="${dto.coupon}" id="coupon" name="coupon">
            <button data-toggle="modal" data-target="#emailModal" type="button" class="btn btn-block btn-primary text-uppercase">쿠폰 보내기</button>

<!--         </form>     -->     
          </div>
        </div>
      </div>
            </c:forEach>
               </div>
               </div>
               
               
	<!-- email Modal -->
<div class="modal" id="emailModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">Send Coupon</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <h6>쿠폰을 보낼 이메일을 입력하세요.</h6>
        <form name="form" id="form" action="makeCoupon.do" method="post">
        <input type="hidden" value="${dto.coupon}" id="coupon" name="coupon">
        <input type="text" class="form-control mb-3" id="useremail" name="useremail" placeholder="이메일">
        <button type="submit" type="button" class="btn btn-outline-primary pull-right">쿠폰 보내기</button>
        <button type="button" class="btn btn-outline-secondary pull-right" data-dismiss="modal">취소</button>
        <p class="m-2" style="text-align:center; color:red;">${message}</p>
         </form>  
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      
      </div>

    </div>
  </div>
</div>

               
</body>
</html>

