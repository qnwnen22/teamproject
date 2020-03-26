package com.TeamProject.Kdemy.model.teacher.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;

@Repository
public class TeacherDAOImpl implements TeacherDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void teacher_type1_insert(TeacherDTO dto) throws Exception{
		sqlSession.insert("teacher.teacher_type1_insert",dto);
	}

	@Override
	public List<TeacherDTO> typeAList(int start, int end) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		return sqlSession.selectList("teacher.typeAList",map);
	}

	@Override
	public int countTypeAList() {	
		return sqlSession.selectOne("teacher.countTypeAList");
	}

}
