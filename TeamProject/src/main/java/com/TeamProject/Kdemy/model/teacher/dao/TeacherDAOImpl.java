package com.TeamProject.Kdemy.model.teacher.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDAOImpl implements TeacherDAO {
	
	@Inject
	SqlSession sqlSession;

	
}
