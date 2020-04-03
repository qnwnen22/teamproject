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
	
//	@Override
//	public MemberDTO getMember(MemberDTO dto) {
//		return sqlSession.selectOne("member.getMember",dto);
//	}
	
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
			if(dto2!=null){
				if(BCrypt.checkpw(dto.getPasswd(),dto2.getPasswd())) {		
					result="로그인성공";
					System.out.println("비밀번호체크"+result);
				}else {
					result="로그인실패";
				}
			}else {
				result="로그인실패";
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



//	@Override
//	public List<MemberDTO> list() {
//		return sqlSession.selectList("member.memberList");
//	}
	
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
}
