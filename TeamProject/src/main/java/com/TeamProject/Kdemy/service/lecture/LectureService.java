package com.TeamProject.Kdemy.service.lecture;

import java.util.List;

import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;


public interface LectureService {

	//페이징 처리를 위해 판매 타입별 레코드 갯수 출력
	public int countList(String cell_type);
	//판매 타입별 리스트 출력
	public List<LectureDTO> lecture_list(String cell_type, int start, int end);
	
	public void teacher_type1_insert(LectureDTO dto) throws Exception;
	
	public void teacher_type3_insert(LectureDTO dto);

	public void teacher_type2_insert(LectureDTO dto);

	public LectureDTO lecture_list_view(int lecture_idx);

	public int searchCount(String cell_type, String keyword);
	public int searchCount(String keyword);

	public int countList();
	public List<LectureDTO> lecture_list(int start, int end);
	
	public List<LectureDTO> searchList(String cell_type, String keyword, int start, int end);
	public List<LectureDTO> searchList(String keyword, int start, int end);
	
	public List<LectureDTO> myLectureList(String userid);
	public void lectureDelete(int lecture_idx);
	public LectureDTO selectFile(int lecture_idx);
	
}
