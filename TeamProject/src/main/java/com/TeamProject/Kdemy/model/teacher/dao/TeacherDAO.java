package com.TeamProject.Kdemy.model.teacher.dao;

import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;

public interface TeacherDAO {

	public void teacherInsert(TeacherDTO dto) throws Exception ;

	public void member_teacherUpdate(TeacherDTO dto);

	
}
