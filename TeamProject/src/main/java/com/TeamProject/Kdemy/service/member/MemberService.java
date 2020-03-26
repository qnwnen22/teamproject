package com.TeamProject.Kdemy.service.member;

import javax.servlet.http.HttpSession;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface MemberService {

	public void insertMember(MemberDTO dto);

	public void signUp(MemberDTO dto);

	public boolean signIn(MemberDTO dto, HttpSession session);

	public int idCheck(String userid);

	public int useridC(String userid);
}
