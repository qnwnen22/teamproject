package com.TeamProject.Kdemy.controller.chat;

import java.util.List;

import javax.inject.Inject;

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
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.service.lecture.LectureService;

@Component
public class WebSocketEventListener {
	 private static final Logger logger = LoggerFactory.getLogger(WebSocketEventListener.class);
	 
	    @Inject
	    LectureService lectureService;

	    @Autowired
	    private SimpMessageSendingOperations messagingTemplate;

	    @EventListener
	    public void handleWebSocketConnectListener(SessionConnectedEvent event) {
	        logger.info("Received a new web socket connection");
	        
	    }
	    

	    @EventListener
	    public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
	        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
	        String nickname = (String) headerAccessor.getSessionAttributes().get("nickname");
	        String userid = (String) headerAccessor.getSessionAttributes().get("userid");
	        int lecture_idx =(int)headerAccessor.getSessionAttributes().get("lecture_idx");
	        if(nickname != null) {
	        	logger.info("User Disconnected : " + nickname);
	        	lectureService.onlineVideoCahtOff(userid,lecture_idx);
	        	ChatMessage chatMessage = new ChatMessage();
	        	chatMessage.setType(MessageType.LEAVE);
	        	chatMessage.setSender(nickname);
	        	chatMessage.setUserid(userid);
	        	chatMessage.setLecture_idx(lecture_idx);
	        	List<LectureBoxDTO> userList=lectureService.lectureBoxList(chatMessage.getLecture_idx());
	    		chatMessage.setUserList(userList);
	    		chatMessage.setUserCount(userList.size());
	        	messagingTemplate.convertAndSend("/topic/public/"+chatMessage.getLecture_idx(), chatMessage);        	
	        }
	    }
}
