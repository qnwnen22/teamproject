package com.TeamProject.Kdemy.model.member.dao;

import java.sql.Date;
import java.util.List;

import com.TeamProject.Kdemy.model.cart.dto.CartDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.model.member.dto.CouponDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public interface MemberDAO {

	public void insertMember(MemberDTO dto);

	public MemberDTO kdemyLogin(MemberDTO dto) throws Exception;

	public String passwdCheck(MemberDTO dto) throws Exception;

	public int idCheck(MemberDTO dto);
	
	public List<MemberDTO> listAll(String location,String keyword, int start, int end) throws Exception;
	
	public int countMember(String keyword, String location);
	
	public List<MemberDTO> listTeacher();
	
	public void approval(String userid);
	
	public void reject(String userid);

	public void verifyMember(MemberDTO dto);

	public MemberDTO searchID(MemberDTO dto);

	public void updatePW(MemberDTO dto);

	public List<MemberDTO> chartCount();
	
	public List<MemberDTO> chartCountMonth();

	public void updateCoupon(MemberDTO dto);

	public void updateCouponPoint(MemberDTO dto);

	public void update_thumbnail(MemberDTO dto);

	public MemberDTO detailMember(String userid);

	public List<MemberDTO> listMember();

	public void updateMember(MemberDTO dto);

    public List<LectureBoxDTO> orderDetail(LectureBoxDTO dto);
	
	public List<CartDTO> cartList(CartDTO dto);

	public void insertCoupon(CouponDTO dto);

	public List<CouponDTO> couponDetail(CouponDTO dto);

	public int couponCheck(CouponDTO dto);

	public int emailCheck(MemberDTO dto);

	public void minusPoint(int packages_price, MemberDTO dto2);
	
	public int checkNick(MemberDTO dto);

	public void deleteCoupon(String coupon);
}