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

	//각 페이지 리스트 처리
	@Override
	public List<TeacherDTO> typeAList(int start, int end) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		return sqlSession.selectList("teacher.typeAList",map);
	}
	@Override
	public List<TeacherDTO> offline_list(int start, int end) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		return sqlSession.selectList("teacher.offline_list",map);
	}
	@Override
	public List<TeacherDTO> online_list(int start, int end) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		return sqlSession.selectList("teacher.online_list",map);
	}

	//각 페이지 페이징 처리
	@Override
	public int countTypeAList() {	
		return sqlSession.selectOne("teacher.countTypeAList");
	}
	@Override
	public int countTypeBList() {
		return sqlSession.selectOne("teacher.countTypeBList");
	}
	@Override
	public int countTypeCList(String keyword) {
		return sqlSession.selectOne("teacher.countTypeCList",keyword);
	}
	//각 페이지 insert 처리	
	@Override
	public void teacher_type1_insert(TeacherDTO dto) throws Exception{
		sqlSession.insert("teacher.teacher_type1_insert",dto);
	}
	
	@Override
	public void teacher_type2_insert(TeacherDTO dto) {
		sqlSession.insert("teacher.teacher_type2_insert",dto);
	}
	
	@Override
	public void teacher_type3_insert(TeacherDTO dto){
		sqlSession.insert("teacher.teacher_type3_insert",dto);
	}

	

	@Override
	public TeacherDTO lecture_list_view(int lecture_idx) {
		return sqlSession.selectOne("teacher.lecture_list_view",lecture_idx);
	}

}
