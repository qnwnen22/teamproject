package com.TeamProject.Kdemy.model.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.BCrypt;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	SqlSession sqlSession;

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
	public String passwdCheck(MemberDTO dto) {
	    String result="";	
		MemberDTO dto2=sqlSession.selectOne("member.passwdCheck",dto);
		try {
			 if (dto2.getVerify() == 'y') {
				if(BCrypt.checkpw(dto.getPasswd(),dto2.getPasswd())) {		
					result="로그인성공";
				}else {
					result="로그인실패";
				}
			}else {
				result="no";
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
	public MemberDTO kdemyLogin(MemberDTO dto) {
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
<<<<<<< HEAD

=======
	public void update_nik(String userid,String nikname) {
		Map<String,String> map=new HashMap<>();
		map.put("userid", userid);
		map.put("nikname", nikname);
		sqlSession.update("member.update_nik",map);
	}
<<<<<<< HEAD
=======


>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
	public void updateCoupon(MemberDTO dto) {
		sqlSession.update("member.updateCoupon",dto);
		
	}

	@Override
	public void updateCouponPoint(MemberDTO dto) {
		sqlSession.update("member.updateCouponPoint",dto);
		
		
	}

<<<<<<< HEAD
=======
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
	

>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
	@Override
	public List<MemberDTO> chartCount() {
		return sqlSession.selectList("member.chartCount");

	}
	@Override
	public List<MemberDTO> chartCountMonth() {
		return sqlSession.selectList("member.chartCountMonth");
	}
<<<<<<< HEAD
}
<<<<<<< HEAD
=======
=======

	@Override
	public MemberDTO checkPw(MemberDTO dto){
		return sqlSession.selectOne("member.checkPw", dto);
//		String result="";	
//		MemberDTO dto2=sqlSession.selectOne("member.passwdCheck",dto);
//		try {
//			 if(BCrypt.checkpw(dto.getPasswd(),dto2.getPasswd())) {		
//					result="성공";
//				}else {
//					result="실패";
//				}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
	}
	
	
}

>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
