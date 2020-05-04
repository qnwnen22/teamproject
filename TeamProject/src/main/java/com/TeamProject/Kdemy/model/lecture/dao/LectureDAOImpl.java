package com.TeamProject.Kdemy.model.lecture.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		public List<LectureDTO> lecture_listV() {
			return sqlSession.selectList("lecture.lecture_list_home_video");
		}
		
		@Override
		public List<LectureDTO> lecture_listOn() {
			return sqlSession.selectList("lecture.lecture_list_home_online");
		}
		
		@Override
		public List<LectureDTO> lecture_listOff() {
			return sqlSession.selectList("lecture.lecture_list_home_offline");
		}

	   @Override
	   public List<LectureDTO> myLectureList(String userid, String orderType) {
	      Map<String,Object> map=new HashMap<String, Object>();
		  map.put("userid", userid);
		  map.put("orderType", orderType);
	      return sqlSession.selectList("lecture.myLectureList",map);
	   }

	   @Override
	   public void lectureDelete(int lecture_idx) {
	      sqlSession.delete("lecture.lectureDelete",lecture_idx);
	   }

	   @Override
	   public LectureDTO selectFile(int lecture_idx) {
	      return sqlSession.selectOne("lecture.selectFile",lecture_idx);
	   }

	//   강의 구매여부 확인 메소드
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

	   @Override
	   public void onlineVideoCaht(String userid, int lecture_idx) throws Exception {
	      Map <String,Object> map=new HashMap<>();
	      map.put("userid", userid);
	      map.put("lecture_idx",lecture_idx);
	      sqlSession.update("lectureBox.onlineVideoCaht",map);      
	   }

	   @Override
	   public List<LectureBoxDTO> lectureBoxList(int lecture_idx) {
	      return sqlSession.selectList("lectureBox.lectureBoxList",lecture_idx);
	   }

	   @Override
	   public void onlineVideoCahtOff(String userid, int lecture_idx) {
	      Map <String,Object> map=new HashMap<>();
	      map.put("userid", userid);
	      map.put("lecture_idx",lecture_idx);
	      sqlSession.update("lectureBox.onlineVideoCahtOff",map);         
	   }
	   @Override
	   public String getMain_img(int lecture_idx) {
	      return sqlSession.selectOne("lecture.getMain_img",lecture_idx);
	   }

	   @Override
	   public int lectureViewCheck(LectureBoxDTO dto) {
	      return sqlSession.selectOne("lectureBox.lectureViewCheck",dto);
	   }

	   @Override
	   public LectureDTO lectureList(LectureDTO dto) {
	      return sqlSession.selectOne("lecture.lectureList",dto);
	   }

	   @Override
	   public void update_main_img(LectureDTO dto) {
	      sqlSession.update("lecture.update_main_img",dto);
	   
	   }

	   @Override
	   public void update(LectureDTO dto) {
	      sqlSession.update("lecture.update",dto);
	   }

	   @Override
	   public void updateAddImg(LectureDTO dto) {
	      sqlSession.update("lecture.updateAddImg",dto);
	   }

	   @Override
	   public String upCheck(LectureBoxDTO lbDto) {
	      return sqlSession.selectOne("lectureBox.upCheck",lbDto);
	   }

	   @Override
	   public void upUpdate(String userid, int lecture_idx) {
	      HashMap<String, Object> map=new HashMap<>();
	      map.put("userid", userid);
	      map.put("lecture_idx", lecture_idx);
	      sqlSession.update("lectureBox.upUpdate",map);
	   }

	   @Override
	   public void downUpdate(String userid, int lecture_idx) {
	      HashMap<String, Object> map=new HashMap<>();
	      map.put("userid", userid);
	      map.put("lecture_idx", lecture_idx);
	      sqlSession.update("lectureBox.downUpdate",map);
	   }

	   @Override
	   public int upCount(LectureBoxDTO lbDto) {
	      return sqlSession.selectOne("lectureBox.upCount",lbDto);
	   }

	   @Override
	   public int lectureCount(LectureBoxDTO lbDto) {
	      return sqlSession.selectOne("lectureBox.lectureCount",lbDto);
	   }

	   @Override
	   public List<LectureDTO> lectureCountMoney() {
	      return sqlSession.selectList("lecture.lectureCountMoney");
	   }

	   @Override
	   public int totalMoney() {
	      return sqlSession.selectOne("lectureBox.totalMoney");
	   }

	   @Override
	   public void upCount(int lecture_idx) {
			sqlSession.update("lecture.upCount",lecture_idx);
		}
	   @Override
	   public void downCount(int lecture_idx) {
			sqlSession.update("lecture.downCount",lecture_idx);
		}

		@Override
		public void cellCount(String lecture_idx) {
			sqlSession.update("lecture.cellCount",lecture_idx);
		}

		@Override
		public List<LectureBoxDTO> lecturebuyList(int lecture_idx) {
			return sqlSession.selectList("lectureBox.lecturebuyList",lecture_idx);			
		}
		public void revenue(String lecture_idx) {
			sqlSession.update("lecture.revenue",lecture_idx);
		}

		@Override
		public String selectId(String lecture_idx) {
			return sqlSession.selectOne("lecture.selectId",lecture_idx);
		}

		@Override
		public String buyAlarm(int lecture_idx) {
			return sqlSession.selectOne("lecture.buyAlarm",lecture_idx);
		}

		@Override
		public String findNickname(String makeUserid) {
			return sqlSession.selectOne("lecture.findNickname",makeUserid);
		}

		@Override
		public String lectureUserid(int lecture_idx) {
			return sqlSession.selectOne("lecture.lectureUserid",lecture_idx);
		}

		@Override
		public List<LectureDTO> lectureRanking() {
			return sqlSession.selectList("lecture.lectureRanking");
		}

		@Override
		public List<LectureDTO> lectureUpRanking() {
			return sqlSession.selectList("lecture.lectureUpRanking");
		}



}
