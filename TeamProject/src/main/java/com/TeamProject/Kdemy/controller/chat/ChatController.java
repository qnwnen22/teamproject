package com.TeamProject.Kdemy.controller.chat;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;



@Controller
public class ChatController {




	@MessageMapping("/TTT")
	@SendTo("/topic/abc")
	public String msg(String message) throws Exception {
		return message;
	}










}
