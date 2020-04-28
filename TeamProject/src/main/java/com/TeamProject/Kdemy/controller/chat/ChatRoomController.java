package com.TeamProject.Kdemy.controller.chat;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.chat.dto.ChatRoomDTO;
import com.TeamProject.Kdemy.service.chat.ChatRoomService;


@Controller
@RequestMapping("chatroom/*")
public class ChatRoomController {
	
	@Inject
	ChatRoomService chatRoomService;
	
	    @GetMapping("createRoomInsert.do")
	    @ResponseBody
	    public void createRoom(ChatRoomDTO dto) throws Exception {
	    	int result=chatRoomService.checkRoom(dto);
	    	if(result==0) {
	    		chatRoomService.createRoom(dto);	    		
	    	}else {
	    		chatRoomService.roomUpdate(dto);
	    	}
	    	
	    }
	    
	 // 채팅 리스트 화면
	    @RequestMapping("/chatRoomList.do")
	    public ModelAndView roomList(ModelAndView mav) throws Exception{
	    	List<ChatRoomDTO> list = chatRoomService.chatRoomListAll();
	    	mav.setViewName("chat/roomList");
	    	mav.addObject("list",list);
	        return mav;
	    }
	       
}
