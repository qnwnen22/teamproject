<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="${path}/include/css/admin_chating.css">
	<div class="ml-auto m-2 shadow bg-white mini-chat" id="miniChat">
	     <div class="miniChat-header d-flex bg-dark">
	      <div class="text-center col-12 mt-2 p-0">
	        <h5 style="color:white;"><b>실시간 문의</b></h5>
	      </div>
	     <div class="col-2 p-0">
	       
	     </div>
	     </div>
	   	 <div class="p-3 shadow bg-silver mx-auto mt-2 mini-chat-screen overflow-auto" id="admin_chat">
	   	   <ul id="messageAdmin" class="overflow-auto">
			</ul>
	  	 </div>
	  	 <div class="input-group p-4 mini-chat-send">
	   	   <input type="text" class="form-control" id="chatMsg" placeholder="Type a message...">
	   	   <input type="hidden" id="sender" value="${dto.target}">
	   	   <input type="hidden" id="chatNum" value="${dto.num}">
		   <input type="hidden" id="target" value="${dto.sender}">
  				<div class="input-group-append">
    				<button class="btn btn-success" id="btnchatSend" type="submit">SEND</button>
 				 </div>
	  	 </div>
	 </div>
<script src="${path}/include/js/adminChat.js"></script>

</body>
</html>
