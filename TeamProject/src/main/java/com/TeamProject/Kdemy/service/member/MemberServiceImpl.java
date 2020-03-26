package com.TeamProject.Kdemy.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.member.dao.MemberDAO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

@Service	
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO memberDao;

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
	}

	@Override
	public void signUp(MemberDTO dto) {
		memberDao.signUp(dto);
	}

	@Override
	public boolean signIn(MemberDTO dto, HttpSession session) {
		int result=memberDao.useridCheck(dto);
		System.out.println("result="+result);
		if(result==1) {
			MemberDTO dto2=memberDao.signIn(dto, session);
			session.setAttribute("userid", dto2.getUserid());
			session.setAttribute("username", dto2.getUsername());
			session.setAttribute("teacher", dto2.getTeacher());
			System.out.println(session.getAttribute("userid"));
			System.out.println(session.getAttribute("username"));
			System.out.println(session.getAttribute("teacher"));
			
			return true;
		}else {
			
			return false;
		}
	}

	@Override
	public int idCheck(String userid) {
		return memberDao.idCheck(userid);
	}

	@Override
	public int useridC(String userid) {
		return memberDao.useridC(userid);
	}
	
	

}
