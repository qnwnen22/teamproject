package com.TeamProject.Kdemy.controller.teacher;


import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TeamProject.Kdemy.service.teacher.TeacherService;

@Controller
@RequestMapping("teacher/*")
public class TeacherController {
	
	private static final Logger logerr=LoggerFactory.getLogger(TeacherController.class);
	
	@Inject
	TeacherService teacherService;

	@Resource(name="uploadPath")
	String uploadPath;
	
	//강사 페이지로 이동
	@RequestMapping("teacherPage.do")
	public String teacherPage() {
		return "teacher/teacherPage";
	}
	
	@RequestMapping("teacherJoinPage.do")
	public String teacherJoinPage() {
		return "teacher/teacherJoin";
	}
	
	@RequestMapping("teacherInsert.do")
	public String teacherInsert() {
		return "home";
	}

	
}


