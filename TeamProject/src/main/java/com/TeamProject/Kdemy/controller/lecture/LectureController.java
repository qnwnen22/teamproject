package com.TeamProject.Kdemy.controller.lecture;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;
import com.TeamProject.Kdemy.service.lecture.LectureService;
import com.TeamProject.Kdemy.service.teacher.TeacherService;
import com.TeamProject.Kdemy.util.MediaUtils;
import com.TeamProject.Kdemy.util.UploadFileUtils;


@Controller
@RequestMapping("lecture/*")
public class LectureController {

	private static final Logger log=LoggerFactory.getLogger(LectureController.class);
	
	@Inject
	LectureService lectureService;
	
	@Inject
	TeacherService teacherService;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping("addLecturePage.do")
	public String addLecturePage() {
		return "lecture/addLecture";
	}


	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
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
	@RequestMapping("video_list.do")
	public ModelAndView typeAList(@RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue="") String admin, LectureDTO dto) throws Exception {
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
			@RequestParam(defaultValue="1") int curPage, LectureDTO dto
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
			@RequestParam(defaultValue="") String admin, LectureDTO dto) throws Exception {
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
		return "redirect:/lecture/video_list.do";
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
		
		int upCount=lectureService.upCount(lbDto);
		int lectureCount=lectureService.lectureCount(lbDto);
		
		int check=-1;
		String up ="x";
		if(userid!=null) {
			lbDto.setUserid(userid);
			lbDto.setLecture_idx(lecture_idx);
			check = lectureService.buyCheck(lbDto);
			up = lectureService.upCheck(lbDto);
			if(up==null) up="x";
			
			String lectureUserid=lectureService.lectureUserid(lecture_idx);
			if(userid.equals(lectureUserid)) {
				check = 2;
			}
		}
		
			
		dto=lectureService.lecture_list_view(lecture_idx);
		
		ModelAndView mav=new ModelAndView();
		int todayTime=0;
		int openTime=0;
		int playTime=0;
		int endTime=0;
		if(dto.getLecture_start()!=null) {
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			SimpleDateFormat fm = new SimpleDateFormat("HHmm");
			String strDate = fm.format(cal.getTime());
			String start = dto.getLecture_start();
			String front=start.substring(0,2);
			String end=start.substring(3,5);
			start = front+end;
			todayTime=Integer.parseInt(strDate);
			openTime=Integer.parseInt(start);
			playTime=Integer.parseInt(dto.getLecture_time())*100;
			endTime = playTime+openTime;
			mav.addObject("todayTime",todayTime);
			mav.addObject("openTime",openTime);
			mav.addObject("endTime",endTime);
		}
		
		mav.addObject("upCount", upCount);
		mav.addObject("lectureCount",lectureCount);
		mav.addObject("up", up);
		mav.addObject("check",check);
		mav.addObject("main_img",dto.getMain_img());
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
	public ModelAndView myLecturePage(HttpSession session, @RequestParam(defaultValue="lecture_idx") String orderType) {
		ModelAndView mav=new ModelAndView();
		System.err.println((String)session.getAttribute("userid"));
		System.err.println(orderType);
		
		String userid=(String)session.getAttribute("userid");

		List<LectureDTO> list=lectureService.myLectureList(userid, orderType);
		int total=teacherService.myRevenue(userid);
		mav.addObject("total",total);
		mav.addObject("list",list);
		mav.setViewName("lecture/myLecturePage");
		
		return mav;
	}
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
		if(session.getAttribute("admin_id")!=null) {
			return "redirect:/lecture/online_list.do?admin=admin";	
		}else {
		String userid=(String)session.getAttribute("userid");
		return "redirect:/lecture/myLecturePage.do?userid="+userid;
		}
	}
	
	@RequestMapping("lectureUpdatePage.do")
	public ModelAndView lectureUpdatePage(HttpSession session, int lecture_idx) {
		ModelAndView mav=new ModelAndView();
		LectureDTO ldto=new LectureDTO();
		ldto=lectureService.lectureView_success(lecture_idx);
		Map<String, Object> map=new HashMap<>();
		map.put("ldto", ldto);
		mav.addObject("map", map);
		mav.setViewName("lecture/lectureView_success");
		
		LectureDTO dto = new LectureDTO();
		dto.setUserid((String)session.getAttribute("userid"));
		dto.setLecture_idx(lecture_idx);
		dto=lectureService.lectureList(dto);
		
		mav.setViewName("/lecture/lectureUpdate");
		mav.addObject("dto",dto);
		return mav;
	}
	
	@RequestMapping("lectureView_offline.do")
	public ModelAndView lectureView_offline(HttpSession session, int lecture_idx) {
		ModelAndView mav=new ModelAndView();
		LectureBoxDTO dto=new LectureBoxDTO();
		String userid=(String)session.getAttribute("userid");
		dto.setUserid(userid);
		dto.setLecture_idx(lecture_idx);
		
		int check=lectureService.lectureViewCheck(dto);
		
		String lectureUserid=lectureService.lectureUserid(lecture_idx);
		if(userid.equals(lectureUserid)) {
			check = 2;
		}
		
		if(check==1) {
			LectureDTO dto2=new LectureDTO();
			dto2=lectureService.lectureView_success(lecture_idx);
			mav.addObject("dto", dto2);
			mav.setViewName("lecture/lectureView_offline");
			return mav;
		}else if(check==2) {
			LectureDTO dto2=new LectureDTO();
			dto2=lectureService.lectureView_success(lecture_idx);
			mav.addObject("dto", dto2);
			mav.setViewName("lecture/lectureView_offline");
		}else {
			mav.setViewName("redirect:/");	
		}
		return mav;
	}
	
	
	@RequestMapping("lectureView_success.do")
	public ModelAndView lectureView_success(HttpSession session, int lecture_idx) {
		ModelAndView mav=new ModelAndView();
		LectureBoxDTO dto=new LectureBoxDTO();
		String userid=(String)session.getAttribute("userid");
		dto.setUserid(userid);
		dto.setLecture_idx(lecture_idx);
		
		int check=lectureService.lectureViewCheck(dto);
		
		String lectureUserid=lectureService.lectureUserid(lecture_idx);
		if(userid.equals(lectureUserid)) {
			check = 2;
		}
		
		if(check==1) {
			LectureDTO ldto=new LectureDTO();
			ldto=lectureService.lectureView_success(lecture_idx);
			String makeUserid=lectureService.buyAlarm(lecture_idx);
			String makeUsernick=lectureService.findNickname(makeUserid);
			mav.addObject("makeUserid", makeUserid);
			mav.addObject("makeUsernick", makeUsernick);
			mav.addObject("ldto", ldto);
			mav.setViewName("lecture/lectureView_success");
		}else if(check==2) {
			LectureDTO ldto=new LectureDTO();
			ldto=lectureService.lectureView_success(lecture_idx);
			String makeUserid=lectureService.buyAlarm(lecture_idx);
			String makeUsernick=lectureService.findNickname(makeUserid);
			mav.addObject("makeUserid", makeUserid);
			mav.addObject("makeUsernick", makeUsernick);
			mav.addObject("ldto", ldto);
			mav.setViewName("lecture/lectureView_success");
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
			
	@RequestMapping(value="lectureUpdate.do",method= {RequestMethod.POST},
	consumes=MediaType.MULTIPART_FORM_DATA_VALUE,produces="text/plain;charset=utf-8")
	public String lectureUpdate(LectureDTO dto) throws Exception {
		if(dto.getLecture_date()==null) dto.setLecture_date("");
		if(dto.getLecture_start()==null) dto.setLecture_start("");
		if(dto.getLecture_time()==null) dto.setLecture_time("");
		if(dto.getLecture_address()==null) dto.setLecture_address("");
		if(dto.getLecture_address2()==null) dto.setLecture_address2("");
		MultipartFile file1=dto.getFile1();
				
		String main_img=file1.getOriginalFilename();
		if(main_img=="") {
			lectureService.update(dto);
		}else {
			try {
				main_img=UploadFileUtils.uploadFile(uploadPath, main_img, file1.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setMain_img(main_img);
			lectureService.updateAddImg(dto);
		}
		return "redirect:/";
	}
	@RequestMapping("lectureUp.do")
	public String lectureUp(HttpSession session, int lecture_idx) {
		String userid = (String)session.getAttribute("userid");
		lectureService.upUpdate(userid, lecture_idx);
		return "redirect:/lecture/lecture_list_view.do?lecture_idx="+lecture_idx;
	}
	
	@RequestMapping("lectureDown.do")
	public String lectureDown(HttpSession session, int lecture_idx) {
		String userid = (String)session.getAttribute("userid");
		lectureService.downUpdate(userid, lecture_idx);
		return "redirect:/lecture/lecture_list_view.do?lecture_idx="+lecture_idx;
	}
	
	@RequestMapping("lectureUp1.do")
	public String lectureUp1(HttpSession session, int lecture_idx) {
		String userid = (String)session.getAttribute("userid");
		
		System.err.println("userid="+userid);
		System.err.println("lecture_idx="+lecture_idx);
		
		lectureService.upUpdate(userid, lecture_idx);
		return "redirect:/member/orderDetail1.do";
	}
	
	@RequestMapping("lectureDown1.do")
	public String lectureDown1(HttpSession session, int lecture_idx) {
		String userid = (String)session.getAttribute("userid");

		System.err.println("userid="+userid);
		System.err.println("lecture_idx="+lecture_idx);
		
		lectureService.downUpdate(userid, lecture_idx);
		return "redirect:/member/orderDetail1.do";
	}

	
	@RequestMapping("lectureUp2.do")
	public String lectureUp2(HttpSession session, int lecture_idx) {
		String userid = (String)session.getAttribute("userid");
		
		System.err.println("userid="+userid);
		System.err.println("lecture_idx="+lecture_idx);
		
		lectureService.upUpdate(userid, lecture_idx);
		return "redirect:/member/orderDetail1.do";
	}
	
	@RequestMapping("lectureDown2.do")
	public String lectureDown2(HttpSession session, int lecture_idx) {
		String userid = (String)session.getAttribute("userid");

		System.err.println("userid="+userid);
		System.err.println("lecture_idx="+lecture_idx);
		
		lectureService.downUpdate(userid, lecture_idx);
		return "redirect:/member/orderDetail1.do";
	}
	
	@RequestMapping("lectureView_video.do")
	public ModelAndView lectureView_video(LectureDTO dto) {
		int lecture_idx = dto.getLecture_idx();
		dto=lectureService.lecture_list_view(lecture_idx);
		
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("dto",dto);
		mav.setViewName("lecture/video_view");
		return mav;
	}
	

}

	