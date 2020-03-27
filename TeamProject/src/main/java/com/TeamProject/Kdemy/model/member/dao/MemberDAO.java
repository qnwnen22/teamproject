package com.TeamProject.Kdemy.model.member.dao;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface MemberDAO {

	public void insertMember(MemberDTO dto);

	public MemberDTO kdemyLogin(MemberDTO dto);

	public String passwdCheck(MemberDTO dto);

	public int idCheck(MemberDTO dto);
	
}