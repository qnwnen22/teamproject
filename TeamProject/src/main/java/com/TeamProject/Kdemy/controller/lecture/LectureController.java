package com.TeamProject.Kdemy.controller.lecture;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;
import com.TeamProject.Kdemy.service.lecture.LectureService;
import com.TeamProject.Kdemy.util.UploadFileUtils;


@Controller
@RequestMapping("lecture/*")
public class LectureController {

	private static final Logger log=LoggerFactory.getLogger(LectureController.class);
	
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
	//동영상 구매 유도 페이지
//	@RequestMapping("buyLecturePage")
//	public String 
	
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

	@RequestMapping("all_list_search.do")
	public ModelAndView all_list(
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage
			) throws Exception {
		int count = lectureService.searchCount(keyword);
		LecturePager pager=new LecturePager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<LectureDTO> list=lectureService.searchList(keyword, start, end);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("keyword", keyword);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("lecture/all_list_search");
		
		return mav;
	}
	@RequestMapping("all_list.do")
	public ModelAndView all_list(
			@RequestParam(defaultValue="1")int curPage,	
			@RequestParam(defaultValue="") String admin) throws Exception {
		int count=lectureService.countList();
		LecturePager pager=new LecturePager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<LectureDTO> list=lectureService.lecture_list(start, end);
		ModelAndView mav=new ModelAndView();
		
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); //페이지 네비게이션을 위한 변수 
		
		mav.addObject("map",map);
		if(admin.equals("admin")) {
			mav.setViewName("admin/all_list");
		}else {
			mav.setViewName("lecture/all_list");
		}
		return mav;
	}
	
	
	
	@RequestMapping("video_list_search.do")
	public ModelAndView video_list_search(
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage
			) throws Exception {
		String cell_type="1";
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
		public ModelAndView online_list(
				@RequestParam(defaultValue="1")int curPage,	
				@RequestParam(defaultValue="") String admin) throws Exception {
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
				@RequestParam(defaultValue="1") int curPage	) throws Exception {
			String cell_type="2";
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
		public String teacher_type1_insert(LectureDTO dto) throws Exception {			
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
				videofile=UploadFileUtils.uploadFile(
						uploadPath, videofile, file2.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setVideofile(videofile);

			lectureService.teacher_type1_insert(dto);
			return "redirect:/lecture/video_List.do";
		}
		
		
		@RequestMapping(value="teacher_type3_insert.do",method= {RequestMethod.POST},
				consumes=MediaType.MULTIPART_FORM_DATA_VALUE)
		public String teacher_type3_insert(LectureDTO dto) throws Exception {
			MultipartFile file1=dto.getFile1();
			String main_img=file1.getOriginalFilename();
			try {
				main_img=UploadFileUtils.uploadFile(uploadPath, main_img, file1.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setMain_img(main_img);
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
		public ModelAndView lecture_list_view(
				int lecture_idx, LectureDTO dto,
				HttpSession session,LectureBoxDTO lbDto) {
			String userid=(String)session.getAttribute("userid");
			System.err.println("로그인 안하면? : "+session.getAttribute("userid"));
			
			int check=-1;
			
			if(userid!=null) {
				lbDto.setUserid(userid);
				lbDto.setLecture_idx(lecture_idx);
				check = lectureService.buyCheck(lbDto);
			}
				
			dto=lectureService.lecture_list_view(lecture_idx);

			ModelAndView mav=new ModelAndView();
			mav.addObject("check",check);
			mav.addObject("dto",dto);
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

		// 강의 관리 페이지 이동
		@RequestMapping("myLecturePage.do")
		public ModelAndView myLecturePage(String userid, HttpSession session) {
//			LectureDTO dto=new LectureDTO();
//			dto.setUserid(userid);
			ModelAndView mav=new ModelAndView();
//			로그인된 userid의 세션이 파라미터의 userid와 값이 다르면 예외처리
			if(!((String)session.getAttribute("userid")).equals(userid)) {
				mav.setViewName("home");
				return mav;
			}
			
			List<LectureDTO> list=lectureService.myLectureList(userid);
			
			mav.addObject("list",list);
			mav.setViewName("lecture/myLecturePage");
			return mav;
		}
		
		//강의 지우기
		@RequestMapping("lectureDelete.do")
		public String lectureDelete(int lecture_idx, HttpSession session) {
			
			//파일 지우기 처리
			LectureDTO dto=lectureService.selectFile(lecture_idx);

			File file1=new File(uploadPath+dto.getMain_img());
			String front=dto.getMain_img().substring(0, 12);//0~11까지
			String end=dto.getMain_img().substring(14);//14부터 끝까지
			new File(uploadPath+(front+end).replace(
					'/',File.separatorChar)).delete();
			if(file1.exists()) {
				file1.delete();
			}else {
				log.info("파일이 없습니다");
			}

			File file2=new File(uploadPath+dto.getVideofile());
			
			if(file2.exists()) {
				file2.delete();
			}else {
				log.info("이미지 파일이 존재하지 않습니다.");
			}
			
			lectureService.lectureDelete(lecture_idx);
			String userid=(String)session.getAttribute("userid");
			return "redirect:/lecture/myLecturePage.do?userid="+userid;
		}
		


		
	// 장바구니 상품 일괄구매
//	@RequestMapping("buyList.do")
//	public String buyList(HttpSession session, String[] idxList, 
//			String[] cell_type, int count, int price) {
//		System.out.println("session아이디 :"+session.getAttribute("userid"));
//		System.out.println("count : "+count);
//		System.out.println("price는 : "+price);
//		String userid=(String)session.getAttribute("userid");
//		
//		
//		for(int i=0; i<count; i++) {
//			System.out.println("cell_type : "+cell_type[i]);
//			System.out.println("idxList : "+idxList[i]);
//		}
//		
////		멤버 테이블에서 포인트 차감
//		cartService.buyLecture(price);
////		장바구니 테이블에서 삭제
//		
////		렉쳐박스 테이블에 추가
//		
//		
//		
//		
////		멤버에 있는 userid에 대한 point값을 price만큼 -처리
////		int point=lectureService.pointCheck(userid);
//		return "home";
//	}
		
}
