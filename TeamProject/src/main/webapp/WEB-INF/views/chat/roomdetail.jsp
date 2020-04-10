<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	connectStomp();

	$('#btnSend').on('click', function(evt) {
		  evt.preventDefault();
	  if (!isStomp && socket.readyState !== 1) return;
	    	 let msg = $('input#msg').val();
	    	 let sender = $('input#sender').val();
	    	 if(isStomp) {
	    		 socket.send('/talk', {}, JSON.stringify({sender:sender,msg:msg}));
	    	    $('input#msg').val("");
		      	 }
	    	 else {
	    		 socket.send(msg);
		    	 }
	    	 socket.subscribe('/topic/talk', function (msg) {
		        	console.log("!!!!!!!!!!!!event>>", msg)
		        	 $("#roomchat1").append("<b>"+msg+"</b><br>");
		        });
	    	
	    });
});


var socket=null;
var isStomp= false;

function connectStomp() {
	 var sock = new SockJS("/Kdemy/stompTest"); // endpoint
	    var client = Stomp.over(sock);
	    socket=client;
	    isStomp= true;

	    client.connect({}, function () {
	    	console.log("Connected stompTest!");
	    	 let sender = $('input#sender').val();
	    	 let chatroom_id = $('input#chatroom_id').val();
	        // Controller's MessageMapping, header, message(자유형식)
	        client.send('/chatjoin', {}, JSON.stringify({type:'JOIN',sender:sender,chatroom_id:chatroom_id}));
	        // 해당 토픽을 구독한다!
	        client.subscribe('/topic/chat/'+chatroom_id, function (event) {
	        	console.log("!!!!!!!!!!!!event>>", event)
	        	 $("#roomchat").append("<b>"+event.body+"</b><br>");
	        });
	    });

 	   /*  client.connect({}, function () {
	    	console.log("Connected stompTest!");
	        // Controller's MessageMapping, header, message(자유형식)
	        client.send('/TTT', {}, "${sessionScope.userid} 님이 입장하였습니다.");

	        // 해당 토픽을 구독한다!
	        client.subscribe('/topic/abc', function (event) {
	        	console.log("!!!!!!!!!!!!event>>", event)
	        	 $("#roomchat").append("<b>"+event.body+"</b><br>");
	        });
	    });
 */
}

</script> 

<!-- <script>
$(document).ready(function(){
	connect();

	
	$('#btnSend').on('click', function(evt) {
		  evt.preventDefault();
	  if (socket.readyState !== 1) return;
	    	  var msg = $('input#msg').val();
	    	  socket.send(msg);
<<<<<<< HEAD
	    	  $('input#msg').val("");
=======

	    	  $('input#msg').val("");

>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
	    });
		
});

</script>
<script>
var socket=null;
function connect() {
var sock = new SockJS("<c:url value="/chat"/>");
 socket = sock;
sock.onopen = function () {
    console.log('Info: connection opened.');
    sock.onmessage = function (event) {
     	 console.log("ReceiveMessage:", event.data+"\n");
     	 $("#roomchat").append("<b>"+event.data+"</b><br>");
    };
};
function connectclose() {
    sock.onclose = function (event) {
        console.log('Info: connection closed.');
    };
}
	
}
</script> -->
<body>
<div class="container">
        <div>
            <h2>${map.dto.chatroom_name}</h2>
        </div>
        <div class="input-group">
             <div class="input-group-prepend">
                <input type="text" id="msg" name="msg">
                <input type="hidden" id="sender" name="sender" value="${sessionScope.userid}">
                <input type="hidden" id="chatroom_id" name="chatroom_id" value="${map.dto.chatroom_id}">           
            </div>
            <div class="input-group-append">
                <button class="btn btn-primary" id="btnSend">보내기</button>
            </div>
        </div>
        <ul class="list-group">
            <li class="list-group-item">
            </li>
        </ul>
        <div id="roomchat">
        
        </div>
        <div id="roomchat1">
        
        </div>
    </div>

</body>
</html>