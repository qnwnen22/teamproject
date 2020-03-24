package com.TeamProject.Kdemy.controller.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
