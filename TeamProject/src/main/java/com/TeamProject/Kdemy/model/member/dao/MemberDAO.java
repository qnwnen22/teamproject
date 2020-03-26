package com.TeamProject.Kdemy.model.member.dao;

import javax.servlet.http.HttpSession;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface MemberDAO {

	public void insertMember(MemberDTO dto);

	public void signUp(MemberDTO dto);

	public MemberDTO signIn(MemberDTO dto, HttpSession session);

	public int useridCheck(MemberDTO dto);

	public int idCheck(String userid);

	public int useridC(String userid);
	
}