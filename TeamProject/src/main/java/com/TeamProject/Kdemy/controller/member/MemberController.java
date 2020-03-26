package com.TeamProject.Kdemy.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.MemberService;

@Controller
@RequestMapping("member/*")
public class MemberController {
	@Inject
	MemberService memberService;
	
	@RequestMapping("write.do")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping("insertMember.do")
	public String insertMember(MemberDTO dto) {
		String birthday=dto.getBirthday1()+"년"+dto.getBirthday2()+"월"+dto.getBirthday3()+"일";
		String phone=dto.getPhone1()+"-"+dto.getPhone2()+"-"+dto.getPhone3();
		dto.setBirthday(birthday);
		dto.setPhone(phone);
		System.out.println(birthday);
		System.out.println(phone);
		memberService.insertMember(dto);
		return "home";
	}
	@RequestMapping("loginPage.do")
	public String loginPage() {
		return "member/login";
	}
	@RequestMapping("teacherPage.do")
	public String teacherPage() {
		return "teacher/teacherPage";
	}
	@RequestMapping("signUpPage.do")
	public String signUpPage() {
		return "member/signUp";
	}
	@RequestMapping("signInPage.do")
	public String signInPage() {
		return "member/signIn";
	}
	@RequestMapping("signIn.do")
	public ModelAndView signIn(MemberDTO dto, HttpSession session) {
		boolean result=memberService.signIn(dto,session);
		System.out.println("result="+result);
		ModelAndView mav=new ModelAndView();
		if(result) {
			mav.setViewName("home");
		}else {
			mav.addObject("message","로그인실패");
			mav.setViewName("member/signIn");
		}
		System.out.println("컨트롤러");
		System.out.println(session.getAttribute("userid"));
		System.out.println(session.getAttribute("username"));
		System.out.println(session.getAttribute("teacher"));
		return mav;
	}
	
	
	@RequestMapping("signUp.do")
	public String signUp(MemberDTO dto) {
		String phone=dto.getPhone1()+dto.getPhone2()+dto.getPhone3();
		dto.setPhone(phone);
		String birthday=dto.getBirthday1()+"년"+dto.getBirthday2()+"월"+dto.getBirthday3()+"일";
		dto.setBirthday(birthday);
		
		memberService.signUp(dto);
		return "home";
	}
	@RequestMapping("signOut.do")
	public String signOut(HttpSession session) {
		session.invalidate();
		return "home";
	}
	@RequestMapping("idCheck.do")
	public String idCheck() {
		return "";
	}
	
	@RequestMapping(value = "idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userid") String userid) {

		return memberService.idCheck(userid);
	}
	
	
	@RequestMapping( value = "useridC.do", method = RequestMethod.GET)
	@ResponseBody
	public String useridC(@RequestParam("userid") String userid) {
		System.out.println("userid="+userid);
		int result=memberService.useridC(userid);
		System.out.println("컨트롤러 result="+result);
		String message;
		if(result==1) {
			message="what the fuck";
			return message; 
		}else {
			message="so sux jsp";
			return message;
		}
	}

}
