package com.TeamProject.Kdemy.controller.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.TeamProject.Kdemy.model.chat.dto.ChatMessage;



@Controller
public class ChatController {




	@MessageMapping("/TTT")
	@SendTo("/topic/abc")
	public String msg(String message) throws Exception {
		return message;
	}










}
