package com.TeamProject.Kdemy.serviice.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.TeamProject.Kdemy.model.member.dao.MemberDAO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;
	
	@Override
	public String login(MemberDTO dto, HttpSession session) {
		return dao.login(dto, session);
	}

}
