package com.TeamProject.Kdemy.service.member;

import java.util.List;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface MemberService {

	public void insertMember(MemberDTO dto);

	public MemberDTO kdemyLogin(MemberDTO dto);

	public int idCheck(MemberDTO dto);

	public String passwdCheck(MemberDTO dto);
	
	public int countMember(String keyword,String location) throws Exception;
	
	public List<MemberDTO> listAll(String location, String keyword, int start, int end) throws Exception;

	public List<MemberDTO> listTeacher();
	
	public void approval(String userid);
	
	public void reject(String userid);
	
	public void verifyMember(MemberDTO dto);

	public MemberDTO searchID(MemberDTO dto);

	public void updatePW(MemberDTO dto);
	
	public List<MemberDTO> chartCount();
	
	public List<MemberDTO> chartCountMonth();

	public void updateCoupon(MemberDTO dto);

	public void updatePoint(MemberDTO dto);

}