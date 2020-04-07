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
<!-- <script type="text/javascript">
$(document).ready(function(){
	connectStomp();
});
var socket=null;
var isStomp= false;

function connectStomp() {
	var sock = new SockJS("/Kdemy/ws-stomp");
	console.log(sock);
    var client = Stomp.over(sock);
    isStomp = true;
    socket = client;
    
    client.connect({}, function () {
    	console.log("Connected stompTest!");
        // Controller's MessageMapping, header, message(자유형식)
        client.send('/pub/join', {}, "msg:접속하였습니다.");

        // 해당 토픽을 구독한다!
        client.subscribe("/sub/chat/room/", function(message) { 
        	var recv = JSON.parse(message.body);
        	$("#roomchat").html("<b>"+recv+"</b>");
        });
    });
}
</script> -->

<script>
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
<<<<<<< HEAD
	    	  $('input#msg').val();
=======
	    	  $('input#msg').val("");
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
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
    sock.onclose = function (event) {
        console.log('Info: connection closed.');
    };
};
	
}
</script>
<body>
<div class="container">
        <div>
            <h2>${map.dto.chatroom_name}</h2>
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <label class="input-group-text">내용</label>
            </div>
             <div class="input-group-prepend">
                <input type="text" id="msg" name="msg">
            </div>
            <input type="text" class="form-control">
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
    <!-- JavaScript -->
   <!--  <script>
        //alert(document.title);
        // websocket &amp; stomp initialize
        var sock = new SockJS("/ws-stomp");
        var ws = Stomp.over(sock);
        var reconnect = 0;
        // vue.js
        var vm = new Vue({
            el: '#app',
            data: {
                roomId: '',
                room: {},
                sender: '',
                message: '',
                messages: []
            },
            created() {
                this.roomId = localStorage.getItem('wschat.roomId');
                this.sender = localStorage.getItem('wschat.sender');
                this.findRoom();
            },
            methods: {
                findRoom: function() {
                    axios.get('/chat/room/'+this.roomId).then(response => { this.room = response.data; });
                },
                sendMessage: function() {
                    ws.send("/pub/chat/message", {}, JSON.stringify({type:'TALK', roomId:this.roomId, sender:this.sender, message:this.message}));
                    this.message = '';
                },
                recvMessage: function(recv) {
                    this.messages.unshift({"type":recv.type,"sender":recv.type=='ENTER'?'[알림]':recv.sender,"message":recv.message})
                }
            }
        });
 
        function connect() {
            // pub/sub event
            ws.connect({}, function(frame) {
                ws.subscribe("/sub/chat/room/"+vm.$data.roomId, function(message) {
                    var recv = JSON.parse(message.body);
                    vm.recvMessage(recv);
                });
                ws.send("/pub/chat/message", {}, JSON.stringify({type:'ENTER', roomId:vm.$data.roomId, sender:vm.$data.sender}));
            }, function(error) {
                if(reconnect++ <= 5) {
                    setTimeout(function() {
                        console.log("connection reconnect");
                        sock = new SockJS("/ws-stomp");
                        ws = Stomp.over(sock);
                        connect();
                    },10*1000);
                }
            });
        }
        connect();
    </script>
 -->
</body>
</html>