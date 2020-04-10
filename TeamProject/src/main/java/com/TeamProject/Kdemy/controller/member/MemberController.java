package com.TeamProject.Kdemy.controller.member;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.interceptor.SessionNames;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.BCrypt;
import com.TeamProject.Kdemy.service.member.MemberService;
import com.TeamProject.Kdemy.service.member.member_Pager;
import com.TeamProject.Kdemy.util.MailHandler;
import com.TeamProject.Kdemy.util.MediaUtils;
import com.TeamProject.Kdemy.util.TempKey;
import com.TeamProject.Kdemy.util.UploadFileUtils;



@Controller
@RequestMapping("member/*")
public class MemberController {
	
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Resource(name="memberUploadPath")
	String uploadPath;
	
	

	@RequestMapping("check.do")
	public ModelAndView check(MemberDTO dto, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		dto.setUserid(userid);
		String result=memberService.passwdCheck(dto);
		ModelAndView mav=new ModelAndView();
		
		if(result.equals("로그인성공")) {
			MemberDTO dto2=memberService.detailMember(userid);
			session.setAttribute("dto", dto2);
			mav.setViewName("member/myPage1");
		}else {
			mav.setViewName("member/myPage");
		}
		return mav;
	}

	@RequestMapping("myPageUpdate.do")
	public String myPageUpdate() {
		return "member/mypageUpdate";
	}
 
	@RequestMapping("couponMaker.do")
	public String couponMaker() {
		return "member/coupon";
	}
	@RequestMapping("updatePointPage.do")
	public String updatePointPage() {
		return "member/couponCheck";
	}
	
	@RequestMapping("join.do")
	public String join() {
		return "member/join";
	}

	@RequestMapping("searchId.do")
	public String searchIdpass1() {
		return "member/searchId";
	}
	
	@RequestMapping("searchpass.do")
	public String searchIdpass2() {
		return "member/searchpass";
	}

	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("FILE NAME: " + fileName);

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
	
	
	@RequestMapping("memberList.do") 
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("member/member_list");
		mav.addObject("list", memberService.listMember());
		return mav;
	}//list()

	@RequestMapping("mypage/{userid}")
	public ModelAndView mypage(@PathVariable String userid, ModelAndView mav) {
		MemberDTO dto=memberService.detailMember(userid);
		mav.addObject("dto",dto);
		mav.setViewName("member/myPage");
		return mav;
	}

	@RequestMapping("detail/{userid}")
	public ModelAndView detail(@PathVariable String userid, ModelAndView mav) {
		MemberDTO dto=memberService.detailMember(userid);
		mav.addObject("dto",dto);
		mav.setViewName("member/myPage1");
		return mav;
	}

	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public String updateMember(HttpServletRequest request, HttpSession session) throws MessagingException, UnsupportedEncodingException {
		String username = request.getParameter("username");	
		String bpasswd = request.getParameter("bpasswd");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		MemberDTO dto = new MemberDTO();
	   	dto.setUsername(username);
	   	dto.setBpasswd(bpasswd);
	   	dto.setPhone(phone);
	   	String passwd=BCrypt.hashpw(dto.getBpasswd(), BCrypt.gensalt());
	   	dto.setPasswd(passwd);
	   	dto.setBirthday(birthday);
	   	dto.setAddress(address);
	   	dto.setAddress2(address2);
	   	String userid = (String) session.getAttribute("userid");
		dto.setUserid(userid);
		memberService.updateMember(dto);
		//세션 다시 저장해 주세요~~
        return "member/myPage";  
	}
   
	@ResponseBody
	@RequestMapping(value = "/uploadAjax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjax(MultipartFile file, String str, HttpSession session,
			HttpServletRequest request, Model model) throws Exception {
            //logger.info("originalName: " + file.getOriginalFilename());
			ResponseEntity<String> img_path = new ResponseEntity<>(
					UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
					HttpStatus.CREATED);
			String thumbnail = (String) img_path.getBody();
			//logger.info(thumbnail);
			MemberDTO dto = new MemberDTO();
			dto.setThumbnail(thumbnail);
		    String userid = (String) session.getAttribute("userid");
			dto.setUserid(userid);
			//logger.info("file name : " + thumbnail);
			memberService.update_thumbnail(dto);
			return thumbnail;
	}
	

	


	@RequestMapping(value="insertMember.do",method= {RequestMethod.POST},
			consumes=MediaType.MULTIPART_FORM_DATA_VALUE,produces="text/plain;charset=utf-8")
	public String insertMember(MemberDTO dto) throws Exception {
		MultipartFile file=dto.getFile();				
		String thumbnail=null;
		String birthday=dto.getBirthday1()+"-"+dto.getBirthday2()+"-"+dto.getBirthday3();
		String phone=dto.getPhone1()+"-"+dto.getPhone2()+"-"+dto.getPhone3();
		String passwd=BCrypt.hashpw(dto.getBpasswd(), BCrypt.gensalt());
    	try {
			thumbnail=UploadFileUtils.uploadFile(uploadPath, thumbnail, file.getBytes());
     	} catch (Exception e) {
			e.printStackTrace();
		}
    	dto.setThumbnail(thumbnail);
		dto.setPasswd(passwd);
		dto.setBirthday(birthday);
		dto.setPhone(phone);
		memberService.insertMember(dto);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>KDEMY 메일인증</h1>")
				.append("kdemy에 가입해주셔서 감사합니다.<br><a href='http://localhost/Kdemy/member/verify.do?useremail=" + dto.getUseremail())
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("kdemy11@gmail.com", "kdemy");
		sendMail.setTo(dto.getUseremail());
		sendMail.send();
				
		return "member/signConfirm";	
	}

	@RequestMapping(value = "/verify.do", method = RequestMethod.GET)
	public String signSuccess(@RequestParam String useremail) {
		MemberDTO dto = new MemberDTO();
		dto.setUseremail(useremail);
		memberService.verifyMember(dto);
		return "member/signSuccess";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId.do")
	public int idCheck(MemberDTO dto) throws Exception {
		String exp1="^[A-Za-z0-9]{4,10}$";
		if(dto.getUserid().matches(exp1)) {
			int result = memberService.idCheck(dto);
			return result;			
		}else {
			return 2;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchID.do", method = RequestMethod.POST)
	public String searchID(HttpServletRequest request) {
		String username = request.getParameter("username");
		String useremail = request.getParameter("useremail");
		System.out.println(username);
		System.out.println(useremail);
		MemberDTO dto = new MemberDTO();
		dto.setUsername(username);
		dto.setUseremail(useremail);
		MemberDTO search = memberService.searchID(dto);
		if (search != null) {
			return search.getUserid();
		} else {
			return "x";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchPW.do", method = RequestMethod.POST)
	public void searchPW(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
		String userid = request.getParameter("userid");
		String useremail = request.getParameter("useremail");
		MemberDTO dto = new MemberDTO();
		dto.setUserid(userid);
		dto.setUseremail(useremail);
		
		String key = new TempKey().getKey(10,false);  // 인증키 생성
		String passwd=BCrypt.hashpw(key, BCrypt.gensalt());
		dto.setPasswd(passwd);
		memberService.updatePW(dto);
			
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[비밀번호 찾기]");
		sendMail.setText(new StringBuffer().append("<h1>임시 비밀번호 발급</h1>")
//				.append("<b>임시 비밀번호 발급 : " + temp_passwd + "</b><br>")
				.append("<b>임시 비밀번호 발급 : " + key+ "</b><br>")
				.append("<a href='http://localhost/Kdemy/")
				.append("' target='_blenk'>KDEMY에서 로그인 하기</a>").toString());
		sendMail.setFrom("kdemy11@gmail.com", "kdemy");
		sendMail.setTo(dto.getUseremail());
		sendMail.send();

	}
	
	@RequestMapping("login.do")
	public ModelAndView kdemyLogin(MemberDTO dto, HttpSession session) {
		String result=memberService.passwdCheck(dto);
		ModelAndView mav=new ModelAndView();
		
		if(result.equals("로그인성공")) {
			MemberDTO dto2=memberService.kdemyLogin(dto);
			session.setAttribute(SessionNames.LOGIN, dto2);
			session.setAttribute("userid", dto2.getUserid());
			session.setAttribute("nickname", dto2.getNickname());
			session.setAttribute("username", dto2.getUsername());
			session.setAttribute("passwd", dto2.getPasswd());
			session.setAttribute("teacher", dto2.getTeacher());
			mav.setViewName("home");
		}else {
			mav.addObject("message","로그인실패");
			mav.setViewName("member/login");
		}
		return mav;
	}

	
	@ResponseBody
	@RequestMapping(value = "/updatePoint.do", method = RequestMethod.POST)
	public void updatePoint(HttpServletRequest request, HttpSession session) throws MessagingException, UnsupportedEncodingException {
		String coupon = request.getParameter("coupon");	
		MemberDTO dto = new MemberDTO();
	   	dto.setCoupon(coupon);
	   	String userid = (String) session.getAttribute("userid");
		dto.setUserid(userid);
		memberService.updatePoint(dto);

	}


	@RequestMapping("teacherPage.do")
	public String teacherPage() {
		return "teacher/teacherPage";
	}

	@RequestMapping("loginPage.do")
	public String loginPage() {
		return "member/login";
	}

//	@RequestMapping("logOut.do")
//	public String logOut(HttpSession session) {
//		session.invalidate();
//		return "member/login";
//	}
	@RequestMapping("logOut.do")
	public ModelAndView logOut(HttpSession session, ModelAndView mav) {
		//세션 초기화
		memberService.logout(session);
		//login.jsp로 이동
		mav.setViewName("member/login");
		mav.addObject("message", "logout");
		return mav;
	}


	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue ="") String keyword,
			@RequestParam(defaultValue ="") String location,
			@RequestParam(defaultValue="1") int curPage) 
					throws Exception {
		System.out.println("list.do실행");
		System.out.println(curPage);
		System.out.println(location);
		//레코드 갯수 계산
		int count=memberService.countMember(keyword,location);
		//페이지 관련 설정
		member_Pager pager=new member_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<MemberDTO> list=memberService.listAll(location,keyword, start, end); //게시물 목록
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); //페이지 네비게이션을 위한 변수
		map.put("keyword", keyword);
		mav.addObject("map", map); //ModelAndView에 map을 저장
		if(location.equals("normal")) {
			mav.setViewName("admin/normal_member_list");
		}else if(location.equals("teacher")){
			mav.setViewName("admin/teacher_member_list");
		}else if(location.equals("request")){
			List<MemberDTO> list2=memberService.listTeacher();
			map.put("list2", list2);
			mav.addObject("map", map);
			mav.setViewName("admin/teacher_request_list");
		}else {
			mav.setViewName("admin/member_list");
		}
		return mav; //board/list.jsp로 이동
	}//list()
	
	@RequestMapping("teacherIsert.do")
	public String teacherIsert() {
		return "member/teacherJoin";
	}
	@RequestMapping("approval.do")
	public String approval(String userid) {
		memberService.approval(userid);
		return "admin/teacher_request_list";
	}
	@RequestMapping("reject.do")
	public String reject(String userid) {
		System.out.println("reject.do 실행");
		memberService.reject(userid);
		return "admin/teacher_request_list";
	}
	

}
