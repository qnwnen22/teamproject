package com.TeamProject.Kdemy.service.member;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface MemberService {

	public void insertMember(MemberDTO dto);

	public MemberDTO kdemyLogin(MemberDTO dto);

	public int useridC(String userid);

	public String passwdCheck(MemberDTO dto);
}
