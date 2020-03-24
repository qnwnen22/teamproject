package com.TeamProject.Kdemy.controller.teacher;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("teacher/*")
public class TeacherController {
	//실시간 강의를 등록하는 페이지
	@RequestMapping("onlinePage.do")
	public String onlinePage() {
		return "teacher/online";
	}
	//현장 강의를 등록하는 페이지
	@RequestMapping("offlinePage.do")
	public String offlinePage() {
		return "teacher/offline";
	}
	
	//동영상 강의를 올리는 페이지
	@RequestMapping("onlinePage.do")
	public String vedioPage() {
		return "teacher/vedio";
	}
}
