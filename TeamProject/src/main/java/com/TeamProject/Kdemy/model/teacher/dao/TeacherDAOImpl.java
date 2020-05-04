package com.TeamProject.Kdemy.model.teacher.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;

@Repository
public class TeacherDAOImpl implements TeacherDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void teacherInsert(TeacherDTO dto) throws Exception {
		sqlSession.insert("teacher.teacherInsert",dto);
	}

	@Override
	public void member_teacherUpdate(TeacherDTO dto) {
		sqlSession.update("teacher.member_teacherUpdate",dto);
	}

	@Override
	public TeacherDTO requestMemberView(String userid) {
		return sqlSession.selectOne("teacher.requestMemberView", userid);
	}

	@Override
	public int nicknameC(String nickname) {
		return sqlSession.selectOne("teacher.nicknameC",nickname);
	}

	@Override
	public void memberUpdate(String userid) {
		sqlSession.update("teacher.memberUpdate",userid);
	}

	@Override
	public void total(String lectureUserid) {
		sqlSession.update("teacher.total",lectureUserid);
	}

	@Override
	public int myRevenue(String userid) {
		return sqlSession.selectOne("teacher.myRevenue",userid);
	}
}
