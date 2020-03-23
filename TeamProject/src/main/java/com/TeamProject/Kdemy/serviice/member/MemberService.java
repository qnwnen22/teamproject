package com.TeamProject.Kdemy.serviice.member;

import javax.servlet.http.HttpSession;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface MemberService {

	public String login(MemberDTO dto, HttpSession session);
}
