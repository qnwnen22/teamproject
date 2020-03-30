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

	//영상 강의 페이지 페이징 처리
	@Override
	public List<TeacherDTO> typeAList(int start, int end) {
		return teacherDao.typeAList(start,end);
	}
	@Override
	public int countTypeAList() {
		return teacherDao.countTypeAList();
	}
	////////////////////////////////////////////////////////////////
	
	//실시간 페이지 페이징 처리
	@Override
	public List<TeacherDTO> online_list(int start, int end) {
		return teacherDao.online_list(start ,end);
	}

	@Override
	public int countTypeBList() {
		return teacherDao.countTypeBList();
	}
	////////////////////////////////////////////////////////////////

	//현장 강의 페이지 페이징 처리
	@Override
	public List<TeacherDTO> offline_list(int start, int end) {
		return teacherDao.offline_list(start, end);
	}
	@Override
	public int countTypeCList(String keyword) {
		return teacherDao.countTypeCList(keyword);
	}
	////////////////////////////////////////////////////////////////
	
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

	
}
