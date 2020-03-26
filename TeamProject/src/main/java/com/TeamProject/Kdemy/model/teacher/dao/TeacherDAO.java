package com.TeamProject.Kdemy.model.teacher.dao;

import java.util.List;

import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;

public interface TeacherDAO {
	public void teacher_type1_insert(TeacherDTO dto) throws Exception;

	public List<TeacherDTO> typeAList(int start, int end);

	public int countTypeAList();
}
