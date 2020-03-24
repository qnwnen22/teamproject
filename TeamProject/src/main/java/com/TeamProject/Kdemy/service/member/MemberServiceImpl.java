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

}
