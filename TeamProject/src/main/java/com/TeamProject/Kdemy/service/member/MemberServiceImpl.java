package com.TeamProject.Kdemy.service.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.cart.dto.CartDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.model.member.dao.MemberDAO;
import com.TeamProject.Kdemy.model.member.dto.CouponDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

@Service	
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO memberDao;
	
	@Override
	public List<CartDTO> cartList(CartDTO dto) {
		return memberDao.cartList(dto);
	}
	
	@Override
	public List<LectureBoxDTO> orderDetail(LectureBoxDTO dto) {
		return memberDao.orderDetail(dto);
	}	
	

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
	}


	@Override
	public void updateMember(MemberDTO dto) {
		memberDao.updateMember(dto);
		
	}
	
	@Override
	public void verifyMember(MemberDTO dto) {
		 memberDao.verifyMember(dto);
		}

	@Override
	public MemberDTO kdemyLogin(MemberDTO dto) throws Exception{
		MemberDTO dto2=memberDao.kdemyLogin(dto);	
		return dto2;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public int idCheck(MemberDTO dto) {
		return memberDao.idCheck(dto);
	}

	@Override
	public String passwdCheck(MemberDTO dto) throws Exception{
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
	public int countMember(String keyword, String location){
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
	public List<MemberDTO> chartCount(){
		return memberDao.chartCount();
	}
	@Override
	public List<MemberDTO> chartCountMonth(){
		return memberDao.chartCountMonth();
	}
	@Override
	public void updateCoupon(MemberDTO dto) {
		memberDao.updateCoupon(dto);
	}
	
	@Override
	public void insertCoupon(CouponDTO dto) {
		memberDao.insertCoupon(dto);
		
	}

	public void updatePoint(MemberDTO dto) {
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

	@Override
	public List<CouponDTO> couponDetail(CouponDTO dto) {
		return memberDao.couponDetail(dto);
	}

	@Override
	public int couponCheck(CouponDTO dto) {
		return memberDao.couponCheck(dto);
	}

	@Override
	public int emailCheck(MemberDTO dto) {
		return memberDao.emailCheck(dto);
	}

	@Override
	public void minusPoint(int packages_price, MemberDTO dto2) {
		memberDao.minusPoint(packages_price,dto2);
	}

}
