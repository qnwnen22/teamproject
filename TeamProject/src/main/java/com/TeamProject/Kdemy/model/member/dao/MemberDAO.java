package com.TeamProject.Kdemy.model.member.dao;

import java.util.List;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface MemberDAO {

	public void insertMember(MemberDTO dto);

	public MemberDTO kdemyLogin(MemberDTO dto);

	public String passwdCheck(MemberDTO dto);

	public int idCheck(MemberDTO dto);
	
//	public List<MemberDTO> list();
	
	public List<MemberDTO> listAll(String location,String keyword, int start, int end) throws Exception;
	
	public int countMember(String keyword, String location) throws Exception;

//	public MemberDTO getMember(MemberDTO dto);

	public void verifyMember(MemberDTO dto);
}