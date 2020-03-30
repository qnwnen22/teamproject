package com.TeamProject.Kdemy.service.member;

import java.util.List;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface MemberService {

	public void insertMember(MemberDTO dto);

	public MemberDTO kdemyLogin(MemberDTO dto);

	public int idCheck(MemberDTO dto);

	public String passwdCheck(MemberDTO dto);
	
//	public List<MemberDTO> list();
	
	public int countMember(String keyword,String location) throws Exception;
	
	public List<MemberDTO> listAll(String location, String keyword, int start, int end) throws Exception;
}
