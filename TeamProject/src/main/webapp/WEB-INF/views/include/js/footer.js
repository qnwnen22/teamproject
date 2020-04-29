
var w = null;
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
       var cmdNum="chat"+num;
       if(cmd==cmdNum) {
    	   var w = window.open("about:blank","_blank","width=330,height=610,left=100");
    	   $.ajax({
               type: 'POST',
               url: "${path}/chat/popup/"+num+"?sender="+sender+"&target="+target+"&num="+num+"&msg="+msg,
               success : function() {
            	   w.location.href = "${path}/chat/popup/"+num+"?sender="+sender+"&target="+target+"&num="+num+"&msg="+msg;    
               } 
          });
    	        
       }else if(cmd==target+num) {
    	   $("#messageAdmin").append(msg);
    	   $("#admin_chat").scrollTop($("#admin_chat")[0].scrollHeight);
       }else{
           let $kdemyAlert=$("div#kdemyAlert")
           let $socketAlert =$('div#socketAlert');
           $socketAlert.html(event.data);
           $kdemyAlert.css("display","block");
           setTimeout(function(){
        	   $kdemyAlert.css("display","none");
            },100000);
          }
    };
    
    ws.onclose = function (event) {
         console.log('Info: connection closed.');
         setTimeout( function(){
        	 ConectWS(); 
       }, 1000); 
    };
    ws.onerror = function (err) {
         console.log('Error : ');
     };
}

$(document).ready(function(){
	ConectWS();
    $('#searchIdbtn').on('click', function(){
      
        $.ajax({
            type: 'POST',
            url: "${path}/member/searchID.do",
            data: {
                "username" : $('#username').val(),
                "useremail" : $('#useremail').val()
            },
            success: function(result){
                if($.trim(result) =="x"){
					$('#text').html('가입기록이 없습니다.<br>이름 또는 이메일을 다시 한 번 확인해주세요!');
                }
                else{
                	$('#text').html('<br>회원님의 아이디는 <b>'+$.trim(result)+'</b>입니다.');
                }
            }
        });       
    });   
    $('#searchPasswdbtn').on('click', function(){
        $.ajax({
            type: 'POST',
            url: "${path}/member/searchPW.do",
            data: {
                "userid" : $('#userid').val(),
                "useremail" : $('#useremail1').val()
            },
            success: function(data){
            	$('#text').html('이메일이 발송되었습니다. <br>이메일을 확인하세요.');
            }
        });      
    });    
});
