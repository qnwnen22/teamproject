<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/chating.css">


</head>

<body>
<%@ include file="../include/fixed-topbar.jsp"%>

<div class="livevideo_lecture container-fluid">
	<div class="row">
		<div class="video-contianer col-xl-9 col-lg-8">
			<video autoplay="autoplay" muted="muted" loop="loop" height="100%" width="100%">
				<source src="../upload${map.ldto.videofile}" type="video/mp4">
			</video>
			<div class="d-none d-xl-block d-lg-block">
					<h2 class="text-center">${map.ldto.subject}</h2>		
			</div>
		</div>
		<div id="chat-page" class="col-xl-3 col-lg-4 col-sm-12 col-md-12">
		<div class="d-none d-xl-block d-lg-block">
		  <div class="row">
		     <div class="col-2 offset-6 text-center"><a href="#user-container" data-toggle="collapse"><img class="rounded-circle" src="${path}/include/images/chat/joinuser.png"></a></div>
		     <div class="col-2 text-center"><a href="#chat-container" data-toggle="collapse"><img class="rounded-circle" src="${path}/include/images/chat/chating.png"></a></div>
		     <div class="col-2 text-center"><a href="${path}/lecture/online_list.do"><img class="rounded-circle" src="${path}/include/images/chat/chatout.png"></a></div>
		  </div>
		</div>
		<div class="collapse" id="user-container">
			<div class="user-container d-xl-block d-lg-block d-none overflow-auto col-xl-11 col-lg-11">
			<!-- d-xl-block d-lg-block d-none   -->
				<div class="form-group">
					<input type="hidden" id="nickname" value="${sessionScope.nickname}"
						autocomplete="off" /> <input type="hidden" id="userid"
						value="${sessionScope.userid}" autocomplete="off" />
				<input type="hidden" id="lecture_idx" value="${map.ldto.lecture_idx}" autocomplete="off" />
						<table class="table table-sm table-bordered">
						<thead class="thead-dark">
						  <tr class="text-center">
						    <th>권한</th>
						    <th>닉네임</th>
						    <th>아이디</th>
						  </tr>
						</thead>
						<tbody id="userListTbody">
						  
						</tbody>
					</table>	
				</div>


			</div>
  		</div>
			<div class="chat-container collapse show" id="chat-container" >
				<div class="chat-body col-sm-12 col-md-12">
				<div class="connecting">연결중...</div>
				<ul id="messageArea" class="overflow-auto">

				</ul>
			</div>
			<div class="col-sm-12 col-md-12 pt-3">
				<form id="messageForm" name="messageForm">
					<div class="form-group">
						<div class="input-group">
							<input type="text" id="message" placeholder="Type a message..."
								autocomplete="off" class="form-control" />
							<button type="submit" class="btn btn-primary">보내기</button>
						</div>
					</div>
				</form>
			  </div>
			</div>
	 	</div>

	</div>
</div>	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="${path}/include/js/chating.js"></script>
</body>
</html>