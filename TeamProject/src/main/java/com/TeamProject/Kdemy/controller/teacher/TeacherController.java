package com.TeamProject.Kdemy.controller.teacher;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	

	@Resource(name="uploadPath")
	String uploadPath;
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
	@RequestMapping("videoPage.do")
	public String vedioPage() {
		return "teacher/video";
	}
	
	//동영상 리스트 페이지 이동
	@RequestMapping("videoList.do")
	public ModelAndView typeAList(@RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue="") String admin) throws Exception {
		//레코드 갯수 계산
		int count=teacherService.countTypeAList();
				//페이지 관련 설정
		TeacherPager pager=new TeacherPager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<TeacherDTO>list=teacherService.typeAList(start,end);
		ModelAndView mav=new ModelAndView();
		
		System.out.println(list);
		System.out.println(count);
		
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); //페이지 네비게이션을 위한 변수 
	    //이동 경로 
		if(admin.equals("admin")) {
			mav.setViewName("admin/video_lecture_list");
		}else {
			mav.setViewName("teacher/video_list");
		}
		mav.addObject("map", map); //ModelAndView에 map을 저장
		return mav;
	}
	
	//실시간 강의 리스트 출력 메소드
	@RequestMapping("online_list.do")
	public ModelAndView online_list(@RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue="") String admin
			) throws Exception {
		
		int count=teacherService.countTypeBList();
		TeacherPager pager=new TeacherPager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<TeacherDTO> list=teacherService.online_list(start, end);
		ModelAndView mav=new ModelAndView();
		
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); //페이지 네비게이션을 위한 변수 
		
		mav.addObject("map",map);
		if(admin.equals("admin")) {
			mav.setViewName("admin/online_lecture_list");
		}else {
			mav.setViewName("teacher/online_list");
		}
		return mav;
	}
	
	//현장 강의 리스트 출력 메소드
	@RequestMapping("offline_list.do")
	public ModelAndView offline_list(
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue="") String admin
			) throws Exception {
		
		int count=teacherService.countTypeCList(keyword);
		TeacherPager pager=new TeacherPager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<TeacherDTO> list=teacherService.offline_list(start,end);
		ModelAndView mav=new ModelAndView();

		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); //페이지 네비게이션을 위한 변수 
		
		mav.addObject("map",map);
		if(admin.equals("admin")) {
			mav.setViewName("admin/offline_lecture_list");
		}else {
			mav.setViewName("teacher/offline_list");
		}
		return mav;
		
	}
	
	@RequestMapping(value="teacher_type1_insert.do",method= {RequestMethod.POST},
			consumes=MediaType.MULTIPART_FORM_DATA_VALUE,produces="text/plain;charset=utf-8")
	public String teacher_type1_insert(TeacherDTO dto) 
			throws Exception {
			//첨부 파일의 이름
		    MultipartFile file1=dto.getFile1();
			String main_img=file1.getOriginalFilename();
			try {
				main_img = UploadFileUtils.uploadFile(uploadPath,main_img, file1.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
			//첨부 파일의 이름
			MultipartFile file2=dto.getFile2();
			String videofile=file2.getOriginalFilename();
			try {
				videofile = UploadFileUtils.uploadFile(uploadPath,videofile, file2.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setMain_img(main_img);
			dto.setVideofile(videofile);
		teacherService.teacher_type1_insert(dto);
		return "redirect:/teacher/videoList.do";
	}
	
	
	@RequestMapping(value="teacher_type3_insert.do",method= {RequestMethod.POST},
			consumes=MediaType.MULTIPART_FORM_DATA_VALUE)
	public String teacher_type3_insert(TeacherDTO dto) throws Exception {
		System.out.println(dto.getFile1());
		MultipartFile file1=dto.getFile1();
		String main_img=file1.getOriginalFilename();
		try {
			main_img=UploadFileUtils.uploadFile(uploadPath, main_img, file1.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setMain_img(main_img);

		System.out.println(dto.getMain_category());
		System.out.println(dto.getSub_category());
		System.out.println(dto.getUserid());
		System.out.println(dto.getSubject());
		System.out.println(dto.getPrice());
		System.out.println(dto.getContent());
		System.out.println(dto.getLecture_date());
		System.out.println(dto.getLecture_start());
		System.out.println(dto.getLecture_time());
		System.out.println(dto.getLecture_address());
		System.out.println(dto.getLecture_address2());
		
		teacherService.teacher_type3_insert(dto);
		
		return "redirect:/teacher/offline_list.do";
	}
	@RequestMapping("teacher_type2_insert.do")
	public String teacher_type2_insert(TeacherDTO dto) throws Exception {
		MultipartFile file1=dto.getFile1();
		String main_img=file1.getOriginalFilename();
		try {
			main_img=UploadFileUtils.uploadFile(uploadPath, main_img, file1.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setMain_img(main_img);
		
		MultipartFile file2=dto.getFile2();
		String videofile=file2.getOriginalFilename();
		try {
			videofile=UploadFileUtils.uploadFile(uploadPath, videofile, file2.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setVideofile(videofile);
		
		teacherService.teacher_type2_insert(dto);
		
		return "redirect:/teacher/online_list.do";
	}
	
	@RequestMapping("lecture_list_view.do")
	public ModelAndView lecture_list_view(int lecture_idx, TeacherDTO dto) {
		dto.setLecture_idx(lecture_idx);
		System.out.println(lecture_idx);
		TeacherDTO dto2=teacherService.lecture_list_view(lecture_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",dto2);
		mav.setViewName("teacher/lecture_list_view");
		return mav;
	}
	
	@RequestMapping("lecture_list.do")
	public ModelAndView lecture_list(@RequestParam int cell_type) {
		ModelAndView mav=new ModelAndView();
		if(cell_type==1) {
			mav.setViewName("teacher/video_list");
		}else if(cell_type==2) {
			mav.setViewName("teacher/online_list.do");
		}else if(cell_type==3) {
			mav.setViewName("teacher/offline_list.do");
		}
		return mav;
	}
	
}


