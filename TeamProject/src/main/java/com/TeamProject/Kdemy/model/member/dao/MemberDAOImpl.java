package com.TeamProject.Kdemy.model.member.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember",dto);
	}

	@Override
	public void signUp(MemberDTO dto) {
		sqlSession.insert("member.signUp",dto);
	}

	@Override
	public int useridCheck(MemberDTO dto) {
		return sqlSession.selectOne("member.useridCheck",dto);
	}

	@Override
	public MemberDTO signIn(MemberDTO dto, HttpSession session) {
		return sqlSession.selectOne("member.signIn",dto);
	}

	@Override
	public int idCheck(String userid) {
		return sqlSession.selectOne("member.idCheck",userid);
	}

	@Override
	public int useridC(String userid) {
		return sqlSession.selectOne("member.useridC",userid);
	}

	
}
