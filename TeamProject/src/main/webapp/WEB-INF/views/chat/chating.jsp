<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	connectStomp();
	
	$('#btnSend').on('click', function(evt) {
		  evt.preventDefault();
		  	  if (!isStomp && socket.readyState !== 1) return;
	  
		      var userid = $("#userid").val();
	    	  let msg = $('input#msg').val();
	    	  console.log("mmmmmmm", msg)
	    	  if(isStomp)
	    	  socket.send('/TTT', {}, JSON.stringify({userid:userid,msg:msg}));
	    	  else
		    	  socket.send(msg);
	    });
});

var socket=null;
var isStomp= false;

function connectStomp() {
	var sock = new SockJS("/Kdemy/stompTest");
	console.log(sock);
    var client = Stomp.over(sock);
    isStomp = true;
    socket = client;
    
    client.connect({}, function () {
    	console.log("Connected stompTest!");
        // Controller's MessageMapping, header, message(자유형식)
        client.send('/TTT', {}, "msg: Haha~~~");

        // 해당 토픽을 구독한다!
        client.subscribe('/topic/messages', function (event) {
        	console.log("!!!!!!!!!!!!event>>", event)
        });
    });
}
</script>


</head>
<body>
<div>



<input type="hidden" id="userid" value="${sessionScope.userid}">
<input id="msg" class="form-control" value="1212" type="text">
<button class="btn btn-primary" id="btnSend">send Message</button>

</div>


</body>
</html>
