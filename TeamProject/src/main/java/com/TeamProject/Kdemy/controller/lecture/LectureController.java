package com.TeamProject.Kdemy.controller.lecture;

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

import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;
import com.TeamProject.Kdemy.service.lecture.LectureService;
import com.TeamProject.Kdemy.util.UploadFileUtils;


@Controller
@RequestMapping("lecture/*")
public class LectureController {

	private static final Logger logger=LoggerFactory.getLogger(LectureController.class);
	
	@Inject
	LectureService lectureService;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	//실시간 강의를 등록하는 페이지
	@RequestMapping("onlinePage.do")
	public String onlinePage() {
		return "lecture/online";
	}
	//현장 강의를 등록하는 페이지
	@RequestMapping("offlinePage.do")
	public String offlinePage() {
		return "lecture/offline";
	}
	//동영상 강의를 올리는 페이지
	@RequestMapping("videoPage.do")
	public String vedioPage() {
		return "lecture/video";
	}
	//동영상 리스트 페이지 이동
	@RequestMapping("video_List.do")
	public ModelAndView typeAList(@RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue="") String admin) throws Exception {
		String cell_type="1";
		int count=lectureService.countList(cell_type);
		LecturePager pager=new LecturePager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();

		List<LectureDTO> list=lectureService.lecture_list(cell_type, start, end);
		ModelAndView mav=new ModelAndView();
		
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); //페이지 네비게이션을 위한 변수 
	    //이동 경로 
		if(admin.equals("admin")) {
			mav.setViewName("admin/video_lecture_list");
		}else {
			mav.setViewName("lecture/video_list");
		}
		mav.addObject("map", map); //ModelAndView에 map을 저장
		return mav;
	}
	@RequestMapping("video_list_search.do")
	public ModelAndView video_list_search(
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage
			) throws Exception {
		String cell_type="1";
		System.out.println("키워드 : "+keyword);
		int count=lectureService.searchCount(cell_type, keyword);
		LecturePager pager=new LecturePager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<LectureDTO> list=lectureService.searchList(cell_type, keyword, start, end);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("keyword", keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("lecture/video_list_search");
		return mav;
	}
	//실시간 강의 리스트 출력 메소드
		@RequestMapping("online_list.do")
		public ModelAndView online_list(@RequestParam(defaultValue="1")int curPage,	@RequestParam(defaultValue="") String admin) throws Exception {
			String cell_type="2";
			int count=lectureService.countList(cell_type);
			LecturePager pager=new LecturePager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			List<LectureDTO> list=lectureService.lecture_list(cell_type, start, end);
			ModelAndView mav=new ModelAndView();
			
			HashMap<String, Object> map=new HashMap<>();
			map.put("list", list); //map에 자료 저장
			map.put("count", count);
			map.put("pager", pager); //페이지 네비게이션을 위한 변수 
			
			mav.addObject("map",map);
			if(admin.equals("admin")) {
				mav.setViewName("admin/online_lecture_list");
			}else {
				mav.setViewName("lecture/online_list");
			}
			return mav;
		}
		@RequestMapping("online_list_search.do")
		public ModelAndView online_list_search(
				@RequestParam(defaultValue="") String keyword,
				@RequestParam(defaultValue="1") int curPage
				) throws Exception {
			String cell_type="2";
			System.out.println("키워드 : "+keyword);
			int count=lectureService.searchCount(cell_type, keyword);
			LecturePager pager=new LecturePager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<LectureDTO> list=lectureService.searchList(cell_type, keyword, start, end);
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
			map.put("keyword", keyword);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("map",map);
			mav.setViewName("lecture/online_list_search");
			return mav;
		}
		
		//현장 강의 리스트 출력 메소드
		@RequestMapping("offline_list.do")
		public ModelAndView offline_list(@RequestParam(defaultValue="1")int curPage,
				@RequestParam(defaultValue="") String admin) throws Exception {
			
			String cell_type="3";

			int count=lectureService.countList(cell_type);
			LecturePager pager=new LecturePager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			List<LectureDTO> list=lectureService.lecture_list(cell_type, start, end);
			ModelAndView mav=new ModelAndView();
			
			HashMap<String, Object> map=new HashMap<>();
			map.put("list", list); //map에 자료 저장
			map.put("count", count);
			map.put("pager", pager); //페이지 네비게이션을 위한 변수 
			
			mav.addObject("map",map);
			if(admin.equals("admin")) {
				mav.setViewName("admin/offline_lecture_list");
			}else {
				mav.setViewName("lecture/offline_list");
			}
			return mav;
		}
		@RequestMapping("offline_list_search.do")
		public ModelAndView offline_list_search(
				@RequestParam(defaultValue="") String keyword,
				@RequestParam(defaultValue="1") int curPage
				) throws Exception {
			String cell_type="3";
			
			System.out.println("키워드 : "+keyword);
			int count=lectureService.searchCount(cell_type, keyword);
			LecturePager pager=new LecturePager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<LectureDTO> list=lectureService.searchList(cell_type, keyword, start, end);
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
			map.put("keyword", keyword);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("map",map);
			mav.setViewName("lecture/offline_list_search");
			return mav;
		}
		
		@RequestMapping(value="teacher_type1_insert.do",method= {RequestMethod.POST},
				consumes=MediaType.MULTIPART_FORM_DATA_VALUE,produces="text/plain;charset=utf-8")
		public String teacher_type1_insert(LectureDTO dto) 
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
			lectureService.teacher_type1_insert(dto);
			return "redirect:/lecture/video_List.do";
		}
		
		
		@RequestMapping(value="teacher_type3_insert.do",method= {RequestMethod.POST},
				consumes=MediaType.MULTIPART_FORM_DATA_VALUE)
		public String teacher_type3_insert(LectureDTO dto) throws Exception {
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
			
			lectureService.teacher_type3_insert(dto);
			
			return "redirect:/lecture/offline_list.do";
		}
		@RequestMapping("teacher_type2_insert.do")
		public String teacher_type2_insert(LectureDTO dto) throws Exception {
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
			
			lectureService.teacher_type2_insert(dto);
			
			return "redirect:/lecture/online_list.do";
		}
		
		@RequestMapping("lecture_list_view.do")
		public ModelAndView lecture_list_view(int lecture_idx, LectureDTO dto) {
			dto.setLecture_idx(lecture_idx);
			System.out.println(lecture_idx);
			LectureDTO dto2=lectureService.lecture_list_view(lecture_idx);
			ModelAndView mav=new ModelAndView();
			mav.addObject("dto",dto2);
			mav.setViewName("lecture/lecture_list_view");
			return mav;
		}
		
		@RequestMapping("lecture_list.do")
		public ModelAndView lecture_list(@RequestParam int cell_type) {
			ModelAndView mav=new ModelAndView();
			if(cell_type==1) {
				mav.setViewName("lecture/video_list");
			}else if(cell_type==2) {
				mav.setViewName("lecture/online_list.do");
			}else if(cell_type==3) {
				mav.setViewName("lecture/offline_list.do");
			}
			return mav;
		}
	
}
