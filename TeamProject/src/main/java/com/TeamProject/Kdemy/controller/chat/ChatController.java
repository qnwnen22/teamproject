package com.TeamProject.Kdemy.controller.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.chat.dto.AdminChatDTO;
import com.TeamProject.Kdemy.model.chat.dto.ChatRoomDTO;
import com.TeamProject.Kdemy.service.chat.ChatRoomService;



@Controller
public class ChatController {
	@Inject
	ChatRoomService chatRoomService;
	
	@RequestMapping("chat/popup/{num}")
	public ModelAndView chatPopup(@PathVariable int num,AdminChatDTO dto,ModelAndView mav) throws Exception {
		int chatroom_id=dto.getNum();
		chatRoomService.clickRoom(chatroom_id);
		ChatRoomDTO roomdto=chatRoomService.chatRoomView(chatroom_id);
		Map<String, Object> map=new HashMap<>();
    	map.put("dto", dto);
    	map.put("roomdto", roomdto);
    	mav.addObject("map",map);
		mav.setViewName("chat/chating");
		return mav;
	}
	
	@RequestMapping("chat/popup/list.do")
	public String chatPopupList() {
		return "chat/roomList";
	}
	
	@RequestMapping("chat/messageList.do")
	@ResponseBody
	public ModelAndView messageList(ChatRoomDTO dto, ModelAndView mav) {
		List<ChatRoomDTO> list=chatRoomService.messageList(dto);
		mav.setViewName("chat/messageList");
		mav.addObject("list",list);
		return mav;
	}


	@MessageMapping("/TTT")
	@SendTo("/topic/abc")
	public String msg(String message) throws Exception {
		return message;
	}










}
