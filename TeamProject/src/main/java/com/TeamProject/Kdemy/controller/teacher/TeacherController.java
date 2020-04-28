package com.TeamProject.Kdemy.controller.teacher;


import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.teacher.dto.TeacherDTO;
import com.TeamProject.Kdemy.service.teacher.TeacherService;
import com.TeamProject.Kdemy.util.UploadFileUtils;

@Controller
@RequestMapping("teacher/*")
public class TeacherController {
	
	private static final Logger logerr=LoggerFactory.getLogger(TeacherController.class);
	
	@Inject
	TeacherService teacherService;

	@Resource(name="teacheruploadPath")
	String teacheruploadPath;
	
	@RequestMapping("teacherJoinPage.do")
	public String teacherJoinPage() {
		return "teacher/teacherJoin";
	}
	
	@RequestMapping(value="teacherInsert.do",method= {RequestMethod.POST},
			consumes=MediaType.MULTIPART_FORM_DATA_VALUE,produces="text/plain;charset=utf-8")
	public String teacherInsert(TeacherDTO dto, HttpSession session) throws Exception {

		System.err.println(dto.getSpec1_y());
		System.err.println(dto.getSpec1_m());
		System.err.println(dto.getSpec1_d());
		
		//개같은 예외처리
		if(dto.getSpec2()==null || dto.getSpec2().equals("")) {
			dto.setSpec2("-");
		}if(dto.getSpec3()==null || dto.getSpec3().equals("")) {
			dto.setSpec3("-");
		}if(dto.getSpec4()==null || dto.getSpec4().equals("")) {
			dto.setSpec4("-");
		}if(dto.getSpec5()==null || dto.getSpec5().equals("")) {
			dto.setSpec5("-");
		}	
		if(dto.getSpec2_getDate()==null) {
			dto.setSpec2_getDate("-");
		}if(dto.getSpec3_getDate()==null) {
			dto.setSpec3_getDate("-");
		}if(dto.getSpec4_getDate()==null) {
			dto.setSpec4_getDate("-");
		}if(dto.getSpec5_getDate()==null) {
			dto.setSpec5_getDate("-");
		}
		if(dto.getSpec2_y()==null) {
			dto.setSpec2_y("-");
			dto.setSpec2_m("-");
			dto.setSpec2_d("-");
		}if(dto.getSpec3_y()==null) {
			dto.setSpec3_y("-");
			dto.setSpec3_m("-");
			dto.setSpec3_d("-");
		}if(dto.getSpec4_y()==null) {
			dto.setSpec4_y("-");
			dto.setSpec4_m("-");
			dto.setSpec4_d("-");
		}if(dto.getSpec5_y()==null) {
			dto.setSpec5_y("-");
			dto.setSpec5_m("-");
			dto.setSpec5_d("-");
		}
		dto.setSpec1_getDate(dto.getSpec1_y()+"."+dto.getSpec1_m()+"."+dto.getSpec1_d());
		dto.setSpec2_getDate(dto.getSpec2_y()+"."+dto.getSpec2_m()+"."+dto.getSpec2_d());
		dto.setSpec3_getDate(dto.getSpec3_y()+"."+dto.getSpec3_m()+"."+dto.getSpec3_d());
		dto.setSpec4_getDate(dto.getSpec4_y()+"."+dto.getSpec4_m()+"."+dto.getSpec4_d());
		dto.setSpec5_getDate(dto.getSpec5_y()+"."+dto.getSpec5_m()+"."+dto.getSpec5_d());
		//메인 이미지
		MultipartFile thumbnailFile=dto.getThumbnailFile();
		String teacher_thumbnail=thumbnailFile.getOriginalFilename();
		try {
			teacher_thumbnail=UploadFileUtils.uploadFile(
					teacheruploadPath, teacher_thumbnail, thumbnailFile.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setTeacher_thumbnail(teacher_thumbnail);
		//자격증1
		MultipartFile spec1File=dto.getSpec1File();
		String spec1_img=spec1File.getOriginalFilename();
		try {
			spec1_img=UploadFileUtils.uploadFile(
					teacheruploadPath, spec1_img, spec1File.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setSpec1_img(spec1_img);
		
		if(dto.getSpec2File()==null) {
			dto.setSpec2_img("-");
		}else {
			MultipartFile spec2File=dto.getSpec2File();
			String spec2_img=spec2File.getOriginalFilename();
			if(spec2_img=="") {
				spec2_img="-";
			 
			}else {
				try {
					spec2_img=UploadFileUtils.uploadFile(
							teacheruploadPath, spec2_img, spec2File.getBytes());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			dto.setSpec2_img(spec2_img);
		}
	
		//자격증3
		if(dto.getSpec3File()==null) {
			dto.setSpec3_img("-");
		}else {
			MultipartFile spec3File=dto.getSpec3File();
			String spec3_img=spec3File.getOriginalFilename();
			if(spec3_img=="") {
				spec3_img="-";
			
			}else {
				try {
					spec3_img=UploadFileUtils.uploadFile(
							teacheruploadPath, spec3_img, spec3File.getBytes());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			dto.setSpec3_img(spec3_img);
		}
		
		//자격증4
		if(dto.getSpec4File()==null) {
			dto.setSpec4_img("-");
		}else {
			MultipartFile spec4File=dto.getSpec4File();
			String spec4_img=spec4File.getOriginalFilename();
			if(spec4_img=="") {
				spec4_img="-";
			
			}else {
				try {
					spec4_img=UploadFileUtils.uploadFile(
							teacheruploadPath, spec4_img, spec4File.getBytes());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			dto.setSpec4_img(spec4_img);
		}
		
		//자격증5
		if(dto.getSpec5File()==null) {
			dto.setSpec5_img("-");
		}else {
			MultipartFile spec5File=dto.getSpec5File();
			String spec5_img=spec5File.getOriginalFilename();
			if(spec5_img=="") {
				spec5_img="-";
			
			}else {
				try {
					spec5_img=UploadFileUtils.uploadFile(
							teacheruploadPath, spec5_img, spec5File.getBytes());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			dto.setSpec5_img(spec5_img);
		}
		teacherService.teacherInsert(dto);
		String userid=dto.getUserid();
		teacherService.memberUpdate(userid);
		
		session.setAttribute("teacher", "w");
		
		return "redirect:/";
	}
	@RequestMapping(value="/requestMemberView.do",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ModelAndView view(String userid,ModelAndView mav) {
		TeacherDTO dto=teacherService.requestMemberView(userid);
		mav.addObject("dto",dto);
		mav.setViewName("admin/requestmember_view");
		return mav;
	}
	
	@RequestMapping(value="/nicknameC.do", method = RequestMethod.GET
			,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String nicknameC(@RequestParam String nickname) {
		int result=teacherService.nicknameC(nickname);
		String data="";
		if(result>=1) {
			data="1";
		}else {
			data="0";
		}
		return data;
	}
	
}