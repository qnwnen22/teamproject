

var chatPage = document.querySelector('#chat-page');
var messageForm = document.querySelector('#messageForm');
var messageInput = document.querySelector('#message');
var messageArea = document.querySelector('#messageArea');
var connectingElement = document.querySelector('.connecting');

var stompClient = null;
var nickname = null;
var lecture_idx = null;


var colors = [
    '#2196F3', '#32c787', '#00BCD4', '#ff5652',
    '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
];

$(function(){
	connect();
});

function connect() {
	nickname = document.querySelector('#nickname').value.trim();
	userid = document.querySelector('#userid').value.trim();
    if(nickname) {
        var socket = new SockJS('/Kdemy/ws');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, onConnected, onError);
    }
}



function onConnected() {
	lecture_idx=document.querySelector('#lecture_idx').value.trim();
    // Subscribe to the Public Topic
    stompClient.subscribe('/topic/public/'+lecture_idx, onMessageReceived);

    // Tell your username to the server
    stompClient.send("/app/chat.addUser",
        {},
        JSON.stringify({sender: nickname, type: 'JOIN', lecture_idx : lecture_idx, userid:userid})
    )
    connectingElement.classList.add('hidden');
}



function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}


function sendMessage(event) {
	lecture_idx=document.querySelector('#lecture_idx').value.trim();
    var messageContent = messageInput.value.trim();
    if(messageContent && stompClient) {
        var chatMessage = {
            sender: nickname,
            userid:userid,
            lecture_idx: lecture_idx,
            content: messageInput.value,
            type: 'CHAT'
        };
        stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
    event.preventDefault();
}


function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);

    var messageElement = document.createElement('li');
    
    if(message.type === 'JOIN') {
        messageElement.classList.add('event-message');
        message.content = message.sender +"("+message.userid+")"  + '님이 입장하였습니다.';
        $("#userListTbody").empty();
        $.each(message.userList, function (index,item) {
        	var userListTd ='<tr><td>학생</td>';
        	userListTd +='<td>'+item.nickname+'</td>';
        	userListTd +='<td>'+item.userid+'</td>';
        	$("#userListTbody").append(userListTd);
        });
        
    } else if (message.type === 'LEAVE') {
        messageElement.classList.add('event-message');
        message.content = message.sender +"("+message.userid+")" + '님이 퇴장하였습니다.';
        $("#userListTbody").empty();
        $.each(message.userList, function (index,item) {
        	var userListTd ='<tr><td>학생</td>';
        	userListTd +='<td>'+item.nickname+'</td>';
        	userListTd +='<td>'+item.userid+'</td>';
        	$("#userListTbody").append(userListTd);
        });
    } else {
        messageElement.classList.add('chat-message');

        var avatarElement = document.createElement('i');
        var avatarText = document.createTextNode(message.sender[0]);
        avatarElement.appendChild(avatarText);
        avatarElement.style['background-color'] = getAvatarColor(message.sender);

        messageElement.appendChild(avatarElement);

        var usernameElement = document.createElement('span');
        var usernameText = document.createTextNode(message.sender+"("+message.userid+")");
        usernameElement.appendChild(usernameText);
        messageElement.appendChild(usernameElement);
    }

    var textElement = document.createElement('p');
    var messageText = document.createTextNode(message.content);
    textElement.appendChild(messageText);

    messageElement.appendChild(textElement);

    messageArea.appendChild(messageElement);
    messageArea.scrollTop = messageArea.scrollHeight;
}


function getAvatarColor(messageSender) {
    var hash = 0;
    for (var i = 0; i < messageSender.length; i++) {
        hash = 31 * hash + messageSender.charCodeAt(i);
    }
    var index = Math.abs(hash % colors.length);
    return colors[index];
}

messageForm.addEventListener('submit', sendMessage, true)



