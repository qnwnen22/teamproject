package com.TeamProject.Kdemy.controller.member;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//github.com/qnwnen22/teamproject.git
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.BCrypt;
import com.TeamProject.Kdemy.service.member.MemberService;
import com.TeamProject.Kdemy.service.member.member_Pager;

@Controller
@RequestMapping("member/*")
public class MemberController {
	@Inject
	MemberService memberService;

	@RequestMapping("write.do")
	public String join() {
		return "member/join";
	}

	@RequestMapping("insertMember.do")
	public String insertMember(MemberDTO dto) {

		String birthday=dto.getBirthday1()+"년"+dto.getBirthday2()+"월"+dto.getBirthday3()+"일";
		String phone=dto.getPhone1()+"-"+dto.getPhone2()+"-"+dto.getPhone3();
		String passwd=BCrypt.hashpw(dto.getBpasswd(), BCrypt.gensalt());
		dto.setPasswd(passwd);
		dto.setBirthday(birthday);
		dto.setPhone(phone);
		System.out.println(dto);
		memberService.insertMember(dto);
		return "home";
	}

	@RequestMapping("teacherPage.do")
	public String teacherPage() {
		return "teacher/teacherPage";
	}

	@RequestMapping("loginPage.do")
	public String loginPage() {
		return "member/login";
	}

	@RequestMapping("logOut.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "member/login";
	}


	@RequestMapping("login.do")
	public ModelAndView kdemyLogin(MemberDTO dto, HttpSession session) {
		String result=memberService.passwdCheck(dto);
		ModelAndView mav=new ModelAndView();
		if(result.equals("로그인성공")) {
			MemberDTO dto2=memberService.kdemyLogin(dto);
			session.setAttribute("userid", dto2.getUserid());
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

	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue ="") String keyword,
			@RequestParam(defaultValue ="") String location,
			@RequestParam(defaultValue="1") int curPage) 
					throws Exception {
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
}
