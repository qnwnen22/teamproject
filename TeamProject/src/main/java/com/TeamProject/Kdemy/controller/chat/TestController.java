package com.TeamProject.Kdemy.controller.chat;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class TestController {
	
	@MessageMapping("/TTT")
	@SendTo("/topic/messages")
	public String ttt(String message) throws Exception {
		System.out.println("/TTT"+message);
		return message;
	}

}
