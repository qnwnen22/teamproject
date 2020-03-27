package com.TeamProject.Kdemy.service.member;

import javax.inject.Inject;

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
	public MemberDTO kdemyLogin(MemberDTO dto) {
		MemberDTO dto2=memberDao.kdemyLogin(dto);	
		return dto2;
	}

	@Override
	public int idCheck(MemberDTO dto) {
		return memberDao.idCheck(dto);
	}

	@Override
	public String passwdCheck(MemberDTO dto) {
		return memberDao.passwdCheck(dto);
	}
	
	

}
