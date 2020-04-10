package com.TeamProject.Kdemy.controller.chat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import com.TeamProject.Kdemy.model.chat.dto.ChatMessage;
import com.TeamProject.Kdemy.model.chat.dto.ChatMessage.MessageType;

@Component
public class WebSocketEventListener {
	 private static final Logger logger = LoggerFactory.getLogger(WebSocketEventListener.class);

	    @Autowired
	    private SimpMessageSendingOperations messagingTemplate;

	    @EventListener
	    public void handleWebSocketConnectListener(SessionConnectedEvent event) {
	        logger.info("Received a new web socket connection");
	    }

	    @EventListener
	    public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
	        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
	        String nikname = (String) headerAccessor.getSessionAttributes().get("nikname");
	        String userid = (String) headerAccessor.getSessionAttributes().get("userid");
	        int chatroom_id =(int)headerAccessor.getSessionAttributes().get("chatroom");
	        if(nikname != null) {
	        	logger.info("User Disconnected : " + nikname);
	        	
	        	ChatMessage chatMessage = new ChatMessage();
	        	chatMessage.setType(MessageType.LEAVE);
	        	chatMessage.setSender(nikname);
	        	chatMessage.setUserid(userid);
	        	chatMessage.setChatroom_id(chatroom_id);
	        	messagingTemplate.convertAndSend("/topic/public/"+chatMessage.getChatroom_id(), chatMessage);        	
	        }
	    }
	        

}
