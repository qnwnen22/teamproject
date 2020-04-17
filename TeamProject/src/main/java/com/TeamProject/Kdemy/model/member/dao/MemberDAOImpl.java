package com.TeamProject.Kdemy.model.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.model.cart.dto.CartDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.model.member.dto.CouponDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.BCrypt;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public List<CartDTO> cartList(CartDTO dto) {
		return sqlSession.selectList("member.cartList",dto);
	}
	
	@Override
	public List<LectureBoxDTO> orderDetail(LectureBoxDTO dto) {
		return sqlSession.selectList("member.orderDetail",dto);
	}


	@Override
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember",dto);
	}
	
	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember",dto);
		
	}
	
	@Override
	public void verifyMember(MemberDTO dto) {
		sqlSession.update("member.verifyMember", dto);
		
	}
	
	@Override
	public int idCheck(MemberDTO dto) {
		return sqlSession.selectOne("member.idCheck",dto);
	}
	@Override
<<<<<<< HEAD
	public int couponCheck(CouponDTO dto) {
		return sqlSession.selectOne("member.couponCheck",dto);
	}
	
	@Override
	public String passwdCheck(MemberDTO dto) {
=======
	public String passwdCheck(MemberDTO dto) throws Exception{
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
	    String result="";	
	    MemberDTO dto2=sqlSession.selectOne("member.passwdCheck",dto);
		try {
			if(dto2 !=null) {
				if (dto2.getVerify()=='y') {
					if(BCrypt.checkpw(dto.getPasswd(),dto2.getPasswd())) {
						result="로그인성공";
					}else {
						result="로그인실패";
					}
			}else {
				result="no";
			}
			}else {
				 //관리자 로그인 
				AdminDTO dtoa=sqlSession.selectOne("admin.passwdCheck",dto);
				if(dtoa != null) {
					if(BCrypt.checkpw(dto.getPasswd(),dtoa.getAdmin_passwd())) { 
						result="관리자로그인";
					}else { 
						result="로그인실패";
					}
				}else {
					result="로그인실패";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public MemberDTO searchID(MemberDTO dto) {
		return sqlSession.selectOne("member.searchID",dto);
	}

	@Override
	public void updatePW(MemberDTO dto) {
		sqlSession.update("member.updatePW",dto);
		
	}
	
	@Override
	public MemberDTO kdemyLogin(MemberDTO dto) throws Exception{
	  return sqlSession.selectOne("member.kdemyLogin",dto);
	}

	@Override
	public List<MemberDTO> listAll(String location, String keyword, int start, int end) throws Exception {
		Map<String,Object> map=new HashMap<>();
		map.put("location", location);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);//맵에 자료저장
		map.put("end", end);
		return sqlSession.selectList("member.listAll",map);
	}
	
	@Override
	public int countMember(String keyword, String location) throws Exception {
		Map<String,String> map=new HashMap<>();
		map.put("keyword", "%"+keyword+"%");
		map.put("location", location);
		return sqlSession.selectOne("member.countMember", map);
	}
	@Override
	public List<MemberDTO> listTeacher(){
		return sqlSession.selectList("member.listTeacher");
	}
	
	@Override
	public void approval(String userid) {
		sqlSession.update("member.approval",userid);
	}
	@Override
	public void reject(String userid) {
		sqlSession.delete("member.reject",userid);
		sqlSession.update("member.rejectmember",userid);
	}

	@Override
	public void updateCoupon(MemberDTO dto) {
		sqlSession.update("member.updateCoupon",dto);
		
	}

	@Override
	public void updateCouponPoint(MemberDTO dto) {
		sqlSession.update("member.updateCouponPoint",dto);		
	}
	
	@Override
	public void insertCoupon(CouponDTO dto) {
		sqlSession.insert("member.insertCoupon",dto);
	}

	@Override
	public void update_thumbnail(MemberDTO dto) {
		sqlSession.update("member.update_thumbnail",dto);
		
	}
	

	@Override
	public MemberDTO detailMember(String userid) {
		return sqlSession.selectOne("member.detail_member", userid);
	}

	@Override
	public List<MemberDTO> listMember() {
		return sqlSession.selectList("member.member_list");
	}
	

	@Override
	public List<MemberDTO> chartCount() {
		return sqlSession.selectList("member.chartCount");

	}
	@Override
	public List<MemberDTO> chartCountMonth() {
		return sqlSession.selectList("member.chartCountMonth");
	}

	@Override
	public List<CouponDTO> couponDetail(CouponDTO dto) {
		return sqlSession.selectList("member.couponDetail");
	}
	
}
	
