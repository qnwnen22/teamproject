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
	public int countList() {
		return lectureDao.countList();
	}

	//강사 페이지
	@Override
	public List<LectureDTO> myLectureList(String userid) {
		return lectureDao.myLectureList(userid);
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
	
//	강의 구매여부 확인 메소드
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
	public void reviewStar(LectureReviewDTO dto) {
		lectureDao.reviewStar(dto);
	}

	@Override
	public void reviewStarUpdate(LectureReviewDTO dto) {
		lectureDao.reviewStarUpdate(dto);
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

	
}
