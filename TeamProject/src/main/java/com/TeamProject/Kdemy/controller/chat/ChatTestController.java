package com.TeamProject.Kdemy.controller.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.TeamProject.Kdemy.model.chat.dto.ChatMessage;

@Controller
public class ChatTestController {
	@Autowired
	private SimpMessageSendingOperations messagingTemplate;


	@MessageMapping("/chat.sendMessage")
	public void sendMessage(@Payload ChatMessage chatMessage) throws Exception  {
		messagingTemplate.convertAndSend("/topic/public/"+chatMessage.getChatroom_id(),chatMessage);
	}

	@MessageMapping("/chat.addUser")
	public void addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor)
			throws Exception {
		headerAccessor.getSessionAttributes().put("nikname", chatMessage.getSender());
		headerAccessor.getSessionAttributes().put("userid", chatMessage.getUserid());
		headerAccessor.getSessionAttributes().put("chatroom", chatMessage.getChatroom_id());
		messagingTemplate.convertAndSend("/topic/public/"+chatMessage.getChatroom_id(),chatMessage);
	}
	
}
