package com.TeamProject.Kdemy.controller.chat;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.chat.dto.AdminChatDTO;



@Controller
public class ChatController {
	
	@RequestMapping("chat/popup")
	public ModelAndView chatPopup(AdminChatDTO dto,Model model,ModelAndView mav) {
		model.addAttribute("dto",dto);
		mav.setViewName("chat/chating");
		return mav;
	}


	@MessageMapping("/TTT")
	@SendTo("/topic/abc")
	public String msg(String message) throws Exception {
		return message;
	}










}
