package com.TeamProject.Kdemy.model.lecture.dao;

import java.util.List;

import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;

public interface LectureDAO {

	 //페이징 처리를 위해 판매 타입별 레코드 갯수 출력
	   public int countList(String cell_type);
	   //판매 타입별 리스트 출력
	   public List<LectureDTO> lecture_list(String cell_type, int start, int end);
	   
	   public void teacher_type1_insert(LectureDTO dto) throws Exception;
	   
	   public void teacher_type3_insert(LectureDTO dto);

	   public void teacher_type2_insert(LectureDTO dto);

	   public LectureDTO lecture_list_view(int lecture_idx);

	   public int searchCount(String cell_type, String keyword);
	   public List<LectureDTO> searchList(String cell_type, String keyword, int start, int end);
	   
	   public int countList();
	   public List<LectureDTO> lecture_list(int start, int end);

	   public int searchCount(String keyword);
	   public List<LectureDTO> searchList(String keyword, int start, int end);
	   public List<LectureDTO> myLectureList(String userid, String orderType);
	   public void lectureDelete(int lecture_idx);
	   public LectureDTO selectFile(int lecture_idx);
	   
	//   강의 구매여부 확인 메소드
	   public int buyCheck(LectureBoxDTO lbDto);
	   public void buy(String userid, String idxList);
	   public int pointCheck(String userid);
	   
	   public List<LectureDTO> chartCountLecture();
	   public LectureDTO lectureView_success(int lecture_idx);
	   public void onlineVideoCaht(String userid, int lecture_idx) throws Exception;
	   public List<LectureBoxDTO> lectureBoxList(int lecture_idx);
	   public void onlineVideoCahtOff(String userid, int lecture_idx);
	   public String getMain_img(int lecture_idx);
	   public int lectureViewCheck(LectureBoxDTO dto);
	   public LectureDTO lectureList(LectureDTO dto);
	   public void update_main_img(LectureDTO dto);
	   
	   public void update(LectureDTO dto);
	   public void updateAddImg(LectureDTO dto);
	   public String upCheck(LectureBoxDTO lbDto);
	   public void upUpdate(String userid, int lecture_idx);
	   public void downUpdate(String userid, int lecture_idx);
	   public int upCount(LectureBoxDTO lbDto);
	   public int lectureCount(LectureBoxDTO lbDto);
	   public List<LectureDTO> lectureCountMoney();
	   public int totalMoney();
	   public void upCount(int lecture_idx);
	   public void downCount(int lecture_idx);
	   public void cellCount(String lecture_idx);
	   public List<LectureDTO> lecture_listV();
	   public List<LectureDTO> lecture_listOn();
	   public List<LectureDTO> lecture_listOff();
	public List<LectureBoxDTO> lecturebuyList(int lecture_idx);
	   public void revenue(String lecture_idx);
	public String selectId(String lecture_idx);
	public String buyAlarm(int lecture_idx);
	public String findNickname(String makeUserid);
	public String lectureUserid(int lecture_idx);
	public List<LectureDTO> lectureRanking();
	public List<LectureDTO> lectureUpRanking();
}
