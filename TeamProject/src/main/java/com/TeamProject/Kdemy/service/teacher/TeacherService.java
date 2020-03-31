package com.TeamProject.Kdemy.service.teacher;

import java.util.List;

import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;

public interface TeacherService {
	
	//페이징 처리를 위해 판매 타입별 레코드 갯수 출력
	public int countList(String cell_type);
	//판매 타입별 리스트 출력
	public List<TeacherDTO> lecture_list(String cell_type, int start, int end);
	
	public void teacher_type1_insert(TeacherDTO dto) throws Exception;
	
	public void teacher_type3_insert(TeacherDTO dto);

	public void teacher_type2_insert(TeacherDTO dto);

	public TeacherDTO lecture_list_view(int lecture_idx);

	public int searchCount(String cell_type, String keyword);

	public List<TeacherDTO> searchList(String cell_type, String keyword, int start, int end);


}
