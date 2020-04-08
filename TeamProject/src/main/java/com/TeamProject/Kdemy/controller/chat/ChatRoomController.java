package com.TeamProject.Kdemy.controller.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.chat.dto.ChatRoomDTO;
import com.TeamProject.Kdemy.service.chat.ChatRoomService;


@Controller
@RequestMapping("chatroom/*")
public class ChatRoomController {
	
	@Inject
	ChatRoomService chatRoomService;
	
	    // 채팅 리스트 화면
	    @RequestMapping("/room")
	    public String rooms(Model model) {
	        return "/chat/room";
	    }
	    
	    @RequestMapping("createRoomInsert.do")
	    public String createRoom(ChatRoomDTO dto) throws Exception{
	    	
	    	dto.setCreate_user_id(dto.getUserid());
	    	chatRoomService.createRoom(dto);
	    	return "redirect:/chatroom/chatRoomList.do";
	    }
	    
	 // 채팅 리스트 화면
	    @RequestMapping("/chatRoomList.do")
	    public ModelAndView roomList(ModelAndView mav) throws Exception{
	    	List<ChatRoomDTO> list = chatRoomService.chatRoomListAll();
	    	mav.setViewName("chat/roomList");
	    	mav.addObject("list",list);
	        return mav;
	    }
	    
	    @RequestMapping("/chatRoomView.do")
	    public ModelAndView roomList(ModelAndView mav,int chatroom_id) throws Exception {
	    	ChatRoomDTO dto=chatRoomService.chatRoomView(chatroom_id);
	    	Map<String, Object> map=new HashMap<>();
	    	map.put("dto", dto);
	    	mav.addObject("map",map);
	    	mav.setViewName("chat/roomdetail");
	    	return mav;
	    }
	    
	    @RequestMapping("chatTest.do")
	    public ModelAndView roomTest(ModelAndView mav) throws Exception {
	    	mav.setViewName("chat/chatTest");
	    	return mav;
	    }
	    
}
