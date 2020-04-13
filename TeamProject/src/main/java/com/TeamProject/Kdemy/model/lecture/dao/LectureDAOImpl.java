package com.TeamProject.Kdemy.model.lecture.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;

@Repository
public class LectureDAOImpl implements LectureDAO {

	@Inject
	SqlSession sqlSession;

	//각 페이지 리스트 처리
	@Override
	public List<LectureDTO> lecture_list(String cell_type, int start, int end) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("cell_type", cell_type);
		map.put("start", start);
		map.put("end",end);
		return sqlSession.selectList("lecture.lecture_list",map);
	}

	//각 페이지 insert 처리	
	@Override
	public void teacher_type1_insert(LectureDTO dto) throws Exception{
		sqlSession.insert("lecture.teacher_type1_insert",dto);
	}
	
	@Override
	public void teacher_type2_insert(LectureDTO dto) {
		sqlSession.insert("lecture.teacher_type2_insert",dto);
	}
	
	@Override
	public void teacher_type3_insert(LectureDTO dto){
		sqlSession.insert("lecture.teacher_type3_insert",dto);
	}

	

	@Override
	public LectureDTO lecture_list_view(int lecture_idx) {
		return sqlSession.selectOne("lecture.lecture_list_view",lecture_idx);
	}
	@Override
	public int searchCount(String cell_type, String keyword) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("cell_type", cell_type);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("lecture.searchCount",map);
	}
	
	@Override
	public int searchCount(String keyword) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("lecture.searchCount_all",map);
	}
	
	@Override
	public List<LectureDTO> searchList(String cell_type, String keyword, int start, int end) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("cell_type", cell_type);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("lecture.searchList",map);
	}
	@Override
	public int countList(String cell_type) {
		return sqlSession.selectOne("lecture.countList",cell_type);
	}

	

	@Override
	public List<LectureDTO> searchList(String keyword, int start, int end) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("lecture.searchList_all",map);
	}

	@Override
	public int countList() {
		return sqlSession.selectOne("lecture.countList_all");
	}

	@Override
	public List<LectureDTO> lecture_list(int start, int end) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		return sqlSession.selectList("lecture.lecture_list_all",map);
	}

	@Override
	public List<LectureDTO> myLectureList(String userid) {
		return sqlSession.selectList("lecture.myLectureList",userid);
	}

	@Override
	public void lectureDelete(int lecture_idx) {
		sqlSession.delete("lecture.lectureDelete",lecture_idx);
	}

	@Override
	public LectureDTO selectFile(int lecture_idx) {
		return sqlSession.selectOne("lecture.selectFile",lecture_idx);
	}

//	강의 구매여부 확인 메소드
	@Override
	public int buyCheck(LectureBoxDTO lbDto) {
		return sqlSession.selectOne("lectureBox.buyCheck",lbDto);
	}

	@Override
	public void buy(String userid, String idxList) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("userid", userid);
		map.put("idxList", idxList);
		sqlSession.insert("lectureBox.buy",map);
	}

	@Override
	public int pointCheck(String userid) {
		return sqlSession.selectOne("lecture.pointCheck",userid);
	}
	@Override
	public List<LectureDTO> chartCountLecture(){
		return sqlSession.selectList("lecture.chartCountLecture");
	}

	@Override
	public LectureDTO lectureView_success(int lecture_idx) {
		return sqlSession.selectOne("lecture.lectureView_success",lecture_idx);
	}
}
