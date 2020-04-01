package com.TeamProject.Kdemy.controller.teacher;


import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;
import com.TeamProject.Kdemy.service.teacher.TeacherService;
import com.TeamProject.Kdemy.util.UploadFileUtils;

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
	
	@RequestMapping(value="teacherInsert.do",method= {RequestMethod.POST},
			consumes=MediaType.MULTIPART_FORM_DATA_VALUE,produces="text/plain;charset=utf-8")
	public String teacherInsert(TeacherDTO dto, HttpSession session) throws Exception {
		MultipartFile file1=dto.getFile1();
		String teacher_profileImagePath=file1.getOriginalFilename();
		try {
			teacher_profileImagePath=UploadFileUtils.uploadFile(
					uploadPath, teacher_profileImagePath, file1.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		MultipartFile file2=dto.getFile2();
		String spec1_img=file2.getOriginalFilename();
		try {
			spec1_img=UploadFileUtils.uploadFile(
					uploadPath, spec1_img, file2.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("dto : "+dto);
		dto.setTeacher_profileImagePath(teacher_profileImagePath);
		dto.setSpec1_img(spec1_img);
		
		teacherService.member_teacherUpdate(dto);
		session.setAttribute("teacher", "w");
		
		teacherService.teacherInsert(dto);
		return "home";
	}

	
}


