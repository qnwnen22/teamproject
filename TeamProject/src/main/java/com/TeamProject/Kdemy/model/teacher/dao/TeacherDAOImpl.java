package com.TeamProject.Kdemy.model.teacher.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<TeacherDTO> lecture_list(String cell_type, int start, int end) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("cell_type", cell_type);
		map.put("cell_type", cell_type);
		map.put("start", start);
		map.put("end",end);
		return sqlSession.selectList("teacher.lecture_list",map);
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
	@Override
	public int searchCount(String cell_type, String keyword) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("cell_type", cell_type);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("teacher.searchCount",map);
	}
	@Override
	public List<TeacherDTO> searchList(String cell_type, String keyword, int start, int end) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("cell_type", cell_type);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("teacher.searchList",map);
	}
	@Override
	public int countList(String cell_type) {
		return sqlSession.selectOne("teacher.countList",cell_type);
	}
	
}
