package com.TeamProject.Kdemy.service.member;

import java.util.List;

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
	public void verifyMember(MemberDTO dto) {
		 memberDao.verifyMember(dto);
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
	
	@Override
	public MemberDTO searchID(MemberDTO dto) {
		return memberDao.searchID(dto);
	}
	
	@Override
	public void updatePW(MemberDTO dto) {
		memberDao.updatePW(dto);
		
	}

	@Override
	public List<MemberDTO> listAll(String location, String keyword, int start, int end) throws Exception {
		return memberDao.listAll(location, keyword, start,end);
	}
	
	@Override
	public int countMember(String keyword, String location) throws Exception {
		return memberDao.countMember(keyword, location);
	}
	
	@Override
	public List<MemberDTO> listTeacher(){
		return memberDao.listTeacher();
	}
	
	@Override
	public void approval(String userid) {
		memberDao.approval(userid);
	}
	@Override
	public void reject(String userid) {
		memberDao.reject(userid);
	}

	@Override
	public void updateCoupon(MemberDTO dto) {
		memberDao.updateCoupon(dto);
		
	}

	@Override
	public void updateCouponPoint(MemberDTO dto) {
		memberDao.updateCouponPoint(dto);
		
	}

	@Override
	public void update_thumbnail(MemberDTO dto) {
		memberDao.update_thumbnail(dto);
		
	}

	@Override
	public MemberDTO detailMember(String userid) {
		return memberDao.detailMember(userid);
	}

	@Override
	public List<MemberDTO> listMember() {
		return memberDao.listMember();
	}



}
