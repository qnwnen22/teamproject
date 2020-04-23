package com.TeamProject.Kdemy.controller.chat;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.TeamProject.Kdemy.model.chat.dto.AdminChatDTO;
import com.TeamProject.Kdemy.model.chat.dto.ChatMessage;
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.service.lecture.LectureService;

@Controller
public class ChatTestController {
	@Inject
	LectureService lectureService;
	
	@Autowired
	private SimpMessageSendingOperations messagingTemplate;
	
	@MessageMapping("/chat.sendMessage")
	public void sendMessage(@Payload ChatMessage chatMessage) throws Exception  {
		
		messagingTemplate.convertAndSend("/topic/public/"+chatMessage.getLecture_idx(),chatMessage);
	}

	@MessageMapping("/chat.addUser")
	public void addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor)
			throws Exception {
		headerAccessor.getSessionAttributes().put("nickname", chatMessage.getSender());
		headerAccessor.getSessionAttributes().put("userid", chatMessage.getUserid());
		headerAccessor.getSessionAttributes().put("lecture_idx", chatMessage.getLecture_idx());
		lectureService.onlineVideoCaht(chatMessage.getUserid(),chatMessage.getLecture_idx());
		List<LectureBoxDTO> userList=lectureService.lectureBoxList(chatMessage.getLecture_idx());
		chatMessage.setUserList(userList);
		System.out.println("userList.size()"+userList.size());
		chatMessage.setUserCount(userList.size());
		messagingTemplate.convertAndSend("/topic/public/"+chatMessage.getLecture_idx(),chatMessage);
	}
	
	
	@MessageMapping("/app/chatAdmin")
	public void adminChatUser(@Payload AdminChatDTO adminChat, SimpMessageHeaderAccessor headerAccessor)
			throws Exception {
		headerAccessor.getSessionAttributes().put("sender", adminChat.getSender());
		headerAccessor.getSessionAttributes().put("num", adminChat.getNum());
		messagingTemplate.convertAndSend("/topic/admin/"+adminChat.getNum(),adminChat);	
	}
	
	@MessageMapping("/chat.adminMessage")
	public void sendMessage(@Payload AdminChatDTO adminChat) throws Exception  {
		messagingTemplate.convertAndSend("/topic/admin/"+adminChat.getNum(),adminChat);
	}
}
