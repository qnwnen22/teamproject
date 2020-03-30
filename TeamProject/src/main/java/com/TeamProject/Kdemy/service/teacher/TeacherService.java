package com.TeamProject.Kdemy.service.teacher;

import java.util.List;

import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;

public interface TeacherService {
	
	public void teacher_type1_insert(TeacherDTO dto) throws Exception;

	public List<TeacherDTO> typeAList(int start, int end);

	public List<TeacherDTO> offline_list(int start, int end);
	
	public List<TeacherDTO> online_list(int start, int end);
	
	public int countTypeAList();
	public int countTypeBList();
	public int countTypeCList(String keyword);
	
	public void teacher_type3_insert(TeacherDTO dto);

	public void teacher_type2_insert(TeacherDTO dto);

	public TeacherDTO lecture_list_view(int lecture_idx);

	

}
