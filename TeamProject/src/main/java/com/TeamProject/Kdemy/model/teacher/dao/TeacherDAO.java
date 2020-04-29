package com.TeamProject.Kdemy.model.teacher.dao;

import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;

public interface TeacherDAO {

	public void teacherInsert(TeacherDTO dto) throws Exception ;

	public void member_teacherUpdate(TeacherDTO dto);

	public TeacherDTO requestMemberView(String userid);

	public int nicknameC(String nickname);

	public void memberUpdate(String userid);

	public void total(String lectureUserid);
}
