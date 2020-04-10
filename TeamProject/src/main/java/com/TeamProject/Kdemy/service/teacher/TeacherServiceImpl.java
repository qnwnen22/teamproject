package com.TeamProject.Kdemy.service.teacher;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.packages.dto.PackagesDTO;
import com.TeamProject.Kdemy.model.teacher.dao.TeacherDAO;
import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Inject
	TeacherDAO teacherDao;
	
	@Override
	public void teacherInsert(TeacherDTO dto) throws Exception {
		teacherDao.teacherInsert(dto);
	}

	@Override
	public void member_teacherUpdate(TeacherDTO dto) {
		teacherDao.member_teacherUpdate(dto);
	}
	
	@Override
	public TeacherDTO requestMemberView(String userid) {
		return teacherDao.requestMemberView(userid);
	}

	@Override
	public int nicknameC(String nickname) {
		return teacherDao.nicknameC(nickname);
	}

	@Override
	public void memberUpdate(String userid) {
		teacherDao.memberUpdate(userid);
	}
}
