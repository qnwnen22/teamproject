package com.TeamProject.Kdemy.service.teacher;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.teacher.dao.TeacherDAO;
import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;

@Service
public class TeacherServiceImpl implements TeacherService {
	
	@Inject
	TeacherDAO teacherDao;

	@Override
	public void teacher_type1_insert(TeacherDTO dto) throws Exception {
		teacherDao.teacher_type1_insert(dto);
	}

	@Override
	public List<TeacherDTO> typeAList(int start, int end) {
		return teacherDao.typeAList(start,end);
	}

	@Override
	public int countTypeAList() {
		return teacherDao.countTypeAList();
	}

}
