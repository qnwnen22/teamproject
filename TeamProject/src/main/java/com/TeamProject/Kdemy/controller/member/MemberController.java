package com.TeamProject.Kdemy.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//github.com/qnwnen22/teamproject.git
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.BCrypt;
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
		String passwd=BCrypt.hashpw(dto.getBpasswd(), BCrypt.gensalt());
		dto.setPasswd(passwd);
		dto.setBirthday(birthday);
		dto.setPhone(phone);
		memberService.insertMember(dto);
		return "home";
	}

	@RequestMapping("teacherPage.do")
	public String teacherPage() {
		return "teacher/teacherPage";
	}
	
	@RequestMapping("loginPage.do")
	public String loginPage() {
		return "member/login";
	}
	
	@RequestMapping("logOut.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "member/login";
	}


	@RequestMapping("login.do")
	public ModelAndView kdemyLogin(MemberDTO dto, HttpSession session) {
		String result=memberService.passwdCheck(dto);
		ModelAndView mav=new ModelAndView();
		if(result.equals("로그인성공")) {
			MemberDTO dto2=memberService.kdemyLogin(dto);
			session.setAttribute("userid", dto2.getUserid());
			session.setAttribute("username", dto2.getUsername());
			session.setAttribute("teacher", dto2.getTeacher());
			mav.setViewName("home");
		}else {
			mav.addObject("message","로그인실패");
			mav.setViewName("member/login");
		}
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping( value = "useridC.do", method = RequestMethod.GET,produces="text/plain;charset=utf-8")
	public String useridC(@RequestParam("userid") String userid) {
		int result=memberService.useridC(userid);
		String message;
		if(result==1) {
			message="중복아이디입니다";
			return message; 
		}else {
			message="중복아이디가 아닙니다.";
			return message;
		}
	}

}
