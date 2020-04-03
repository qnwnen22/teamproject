package com.TeamProject.Kdemy.controller.chat;




import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.chat.dto.ChatMessageDTO;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class ChatController {

	private final SimpMessageSendingOperations messagingTemplate;


	@RequestMapping("page") 
	public ModelAndView chatPage(ModelAndView mav) {
		mav.setViewName("chat/chating"); return mav; 
	}


	@MessageMapping("/pub/joins")
	public void messages(ChatMessageDTO message,HttpSession session) throws Exception {
		String sender=(String)session.getAttribute("userid");
		message.setSender(sender);
		message.setMessage(message.getSender() + "님이 입장하셨습니다.");
		messagingTemplate.convertAndSend("/sub/chat/room/"+ "안녕");	    
	}





}
