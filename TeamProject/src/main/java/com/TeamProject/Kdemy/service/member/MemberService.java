package com.TeamProject.Kdemy.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

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

<<<<<<< HEAD
	public void updatePoint(MemberDTO dto);

}
=======
	public void updateCouponPoint(MemberDTO dto);

	public void update_thumbnail(MemberDTO dto);

	public MemberDTO detailMember(String userid);

	public List<MemberDTO> listMember();

	public void update_nik(String userid, String nikname);

	public List<MemberDTO> chartCount();

	public List<MemberDTO> chartCountMonth();

	public MemberDTO checkPw(MemberDTO dto);

	public void updateMember(MemberDTO dto);

	public void logout(HttpSession session);

	public void updatePoint(MemberDTO dto);

	public List<MemberDTO> chartCountMonth();

	public List<MemberDTO> chartCount();

	public void updateCoupon(MemberDTO dto);

}
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
