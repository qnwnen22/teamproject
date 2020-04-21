$(function() {
	ConectWS();
	$("#chatMsg").keypress(function (e) {
        if (e.which == 13){
        	chatEnter();  // 실행할 이벤트
        }
    });
	
	$('#btnchatSend').on('click', function(evt) {
		var chatMsgExp =document.getElementById("chatMsg");
		if(chatMsgExp.value=="") {
			alert("메시지를 입력해주세요.");
			chatMsgExp.focus();
			return false;
		}
		evt.preventDefault();
			if (socket.readyState !== 1) return;
			let target=$("#target").val();
			let chatNum=$("#chatNum").val();
			let sender=$("#sender").val();
			let chatMsg=$("#chatMsg").val();
			socket.send("usersend,"+sender+","+target+","+chatNum+","+chatMsg);
			var mymessage="<li class='bg-warning text-right ml-auto mb-1'>"+chatMsg+"</li>"
			$("#messageAdmin").append(mymessage);
			$("#chatMsg").val("");
			$("#admin_chat").scrollTop($("#admin_chat")[0].scrollHeight);
	});
});

	var socket = null;
	function ConectWS() {
		var ws = new WebSocket("ws://localhost:80/Kdemy/socket");
		socket = ws;
	    ws.onopen = function () {
	        console.log('Info: connection opened.');
	    };
		
		ws.onmessage = function (event) {
 	       console.log(event.data+'\n');
 	       var strs = new Array();
 	       strs=event.data.split(",");
 	       var cmd=strs[0];
 	       var sender=strs[1];
 	       var target=strs[2];
 	       var msg=strs[3];
 	       var num=strs[4];
 	        if(cmd=="adminsend") {
 	         $("#messageAdmin").append(msg);
 	        $("#admin_chat").scrollTop($("#admin_chat")[0].scrollHeight);
 	       }
 	    };
 	    
 	   ws.onclose = function (event) {
 	         console.log('Info: connection closed.');  // retry connection!! 
 	    };
 	   ws.onerror = function (err) {
 	         console.log('Error : ');
 	     };	   
	}
	function chatEnter() {
		var chatMsgExp =document.getElementById("chatMsg");
		if(chatMsgExp.value=="") {
			alert("메시지를 입력해주세요.");
			chatMsgExp.focus();
			return false;
		}
		if (socket.readyState !== 1) return;
				let target=$("#target").val();
				let chatNum=$("#chatNum").val();
				let sender=$("#sender").val();
				let chatMsg=$("#chatMsg").val();
				socket.send("usersend,"+sender+","+target+","+chatNum+","+chatMsg);
				var mymessage="<li class='bg-warning text-right ml-auto mb-1'>"+chatMsg+"</li>"
				$("#messageAdmin").append(mymessage);
				$("#chatMsg").val("");
				$("#admin_chat").scrollTop($("#admin_chat")[0].scrollHeight);
	}