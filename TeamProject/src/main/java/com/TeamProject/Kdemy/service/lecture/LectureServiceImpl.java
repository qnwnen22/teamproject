package com.TeamProject.Kdemy.service.lecture;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.lecture.dao.LectureDAO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureReviewDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

import oracle.net.aso.l;

@Service
public class LectureServiceImpl implements LectureService {

	 @Inject
	   LectureDAO lectureDao;

	   @Override
	   public void teacher_type1_insert(LectureDTO dto) throws Exception {
	      lectureDao.teacher_type1_insert(dto);
	   }
	   
	   @Override
	   public void teacher_type2_insert(LectureDTO dto) {
	      lectureDao.teacher_type2_insert(dto);
	   }

	   @Override
	   public void teacher_type3_insert(LectureDTO dto){
	      lectureDao.teacher_type3_insert(dto);
	   }

	   //강의 view
	   @Override
	   public LectureDTO lecture_list_view(int lecture_idx) {
	      return lectureDao.lecture_list_view(lecture_idx);
	      
	   }
	   @Override
	   public int searchCount(String cell_type, String keyword) {
	      return lectureDao.searchCount(cell_type, keyword);
	   }

	   @Override
	   public int searchCount(String keyword) {
	      return lectureDao.searchCount(keyword);
	   }

	   
	   @Override
	   public List<LectureDTO> searchList(String cell_type, String keyword, int start, int end) {
	      return lectureDao.searchList(cell_type, keyword, start, end);
	   }
	   
	   @Override
	   public List<LectureDTO> searchList(String keyword, int start, int end) {
	      return lectureDao.searchList(keyword, start, end);
	   }

	   @Override
	   public int countList(String cell_type) {
	      return lectureDao.countList(cell_type);
	   }
	   
	   @Override
	   public List<LectureDTO> lecture_list(String cell_type, int start, int end) {
	      return lectureDao.lecture_list(cell_type, start, end);
	   }
	   
	   @Override
	   public List<LectureDTO> lecture_list(int start, int end) {
	      return lectureDao.lecture_list(start, end);
	   }
	   

		@Override
		public List<LectureDTO> lecture_listV() {
			return lectureDao.lecture_listV();
		}
		
		@Override
		public List<LectureDTO> lecture_listOn() {
			return lectureDao.lecture_listOn();
		}
		
		@Override
		public List<LectureDTO> lecture_listOff() {
			return lectureDao.lecture_listOff();
		}
	   
	   
	   @Override
	   public int countList() {
	      return lectureDao.countList();
	   }

	   //강사 페이지
	   @Override
	   public List<LectureDTO> myLectureList(String userid, String orderType) {
	      return lectureDao.myLectureList(userid, orderType);
	   }

	   @Override
	   public void lectureDelete(int lecture_idx) {
	      lectureDao.lectureDelete(lecture_idx);
	   }

	   @Override
	   public LectureDTO selectFile(int lecture_idx) {
	      return lectureDao.selectFile(lecture_idx);
	   }
	   
	   @Override
	   public List<LectureDTO> chartCountLecture(){
	      return lectureDao.chartCountLecture();
	   }
	   
	//   강의 구매여부 확인 메소드
	   @Override
	   public int buyCheck(LectureBoxDTO lbDto) {
	      return lectureDao.buyCheck(lbDto);
	   }

	   @Override
	   public void buy(String userid, String idxList) {
	      lectureDao.buy(userid,idxList);
	   }

	   @Override
	   public int pointCheck(String userid) {
	      return lectureDao.pointCheck(userid);
	   }

	   @Override
	   public LectureDTO lectureView_success(int lecture_idx) {
	      return lectureDao.lectureView_success(lecture_idx);
	   }

	   @Override
	   public void onlineVideoCaht(String userid, int lecture_idx) throws Exception {
	      lectureDao.onlineVideoCaht(userid,lecture_idx); 
	      
	   }

	   @Override
	   public List<LectureBoxDTO> lectureBoxList(int lecture_idx) {
	      return lectureDao.lectureBoxList(lecture_idx);
	   }

	   @Override
	   public void onlineVideoCahtOff(String userid, int lecture_idx) {
	      lectureDao.onlineVideoCahtOff(userid,lecture_idx); 
	   }

	   @Override
	   public String getMain_img(int lecture_idx) {
	      return lectureDao.getMain_img(lecture_idx);
	   }

	   @Override
	   public int lectureViewCheck(LectureBoxDTO dto) {
	      return lectureDao.lectureViewCheck(dto);
	   }

	   @Override
	   public LectureDTO lectureList(LectureDTO dto) {
	      return lectureDao.lectureList(dto);
	   }

	   @Override
	   public void update_main_img(LectureDTO dto) {
	       lectureDao.update_main_img(dto);
	         
	      }

	   @Override
	   public void update(LectureDTO dto) {
	      lectureDao.update(dto);
	   }

	   @Override
	   public void updateAddImg(LectureDTO dto) {
	      lectureDao.updateAddImg(dto);
	   }

	   @Override
	   public String upCheck(LectureBoxDTO lbDto) {
	      return lectureDao.upCheck(lbDto);
	   }

	   @Override
	   public void upUpdate(String userid, int lecture_idx) {
	      lectureDao.upUpdate(userid, lecture_idx);
	      lectureDao.upCount(lecture_idx);
	   }

	   @Override
	   public void downUpdate(String userid, int lecture_idx) {
	      lectureDao.downUpdate(userid, lecture_idx);
	      lectureDao.downCount(lecture_idx);
	   }

	   @Override
	   public int upCount(LectureBoxDTO lbDto) {
	      return lectureDao.upCount(lbDto);
	   }

	   @Override
	   public int lectureCount(LectureBoxDTO lbDto) {
	      return lectureDao.lectureCount(lbDto);
	   }

	   @Override
	   public List<LectureDTO> chartCountMoney() {
	      return lectureDao.lectureCountMoney();
	   }

	   @Override
	   public int totalMoney() {
	      return lectureDao.totalMoney();
	   }

	@Override
	public void reviewStar(LectureReviewDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<LectureBoxDTO> lecturebuyList(int lecture_idx) {
		return lectureDao.lecturebuyList(lecture_idx);
	}

	@Override
	public String buyAlarm(int lecture_idx) {
		return lectureDao.buyAlarm(lecture_idx);
	}

	@Override
	public String findNickname(String makeUserid) {
		return lectureDao.findNickname(makeUserid);
	}

	@Override
	public String lectureUserid(int lecture_idx) {
		return lectureDao.lectureUserid(lecture_idx);	
	}
}
