package com.TeamProject.Kdemy.model.member.dao;

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
	public MemberDTO kdemyLogin(MemberDTO dto) {
	  return sqlSession.selectOne("member.kdemyLogin",dto);
	}

	@Override
	public int useridC(String userid) {
		return sqlSession.selectOne("member.useridC",userid);
	}

	
}
