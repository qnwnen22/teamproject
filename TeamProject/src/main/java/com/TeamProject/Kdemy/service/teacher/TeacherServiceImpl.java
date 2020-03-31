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
	public void teacher_type2_insert(TeacherDTO dto) {
		teacherDao.teacher_type2_insert(dto);
	}

	@Override
	public void teacher_type3_insert(TeacherDTO dto){
		teacherDao.teacher_type3_insert(dto);
	}

	//강의 view
	@Override
	public TeacherDTO lecture_list_view(int lecture_idx) {
		return teacherDao.lecture_list_view(lecture_idx);
	}
	@Override
	public int searchCount(String cell_type, String keyword) {
		return teacherDao.searchCount(cell_type, keyword);
	}
	@Override
	public List<TeacherDTO> searchList(String cell_type, String keyword, int start, int end) {
		return teacherDao.searchList(cell_type, keyword, start, end);
	}
	@Override
	public int countList(String cell_type) {
		return teacherDao.countList(cell_type);
	}
	@Override
	public List<TeacherDTO> lecture_list(String cell_type, int start, int end) {
		return teacherDao.lecture_list(cell_type, start, end);
	}
	
}
