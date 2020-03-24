package com.TeamProject.Kdemy.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.serviice.member.MemberService;

@Controller
@RequestMapping("member/*")
public class MemberController {

	@Inject
	MemberService service;
	
	@RequestMapping("loginPage.do")
	public String loginPage() {
		return "LeeWonHuckTest/loginPage";
	}
	
	@RequestMapping("login.do")
	public ModelAndView login(MemberDTO dto, HttpSession session) {
		String name=service.login(dto, session);
//		session.getAttribute(dto.);
		ModelAndView mav=new ModelAndView();
		mav.addObject("name", name);
		mav.setViewName("home");
		return mav;
	}
		
	
}
