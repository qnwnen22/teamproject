package com.TeamProject.Kdemy.controller.admin;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//github.com/qnwnen22/teamproject.git

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.admin.AdminService;
import com.TeamProject.Kdemy.service.member.BCrypt;
import com.TeamProject.Kdemy.service.member.MemberService;
@Controller 
@RequestMapping("admin/*") //공통 url mapping
public class AdminController {
	private static final Logger logger 
	= LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	@Inject
	MemberService memberService;
	
	@RequestMapping("list.do")
	public ModelAndView adminList(ModelAndView mav) {
		List<AdminDTO> list=adminService.list();
		mav.setViewName("admin/admin_list");//뷰의 이름
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("managementMenu.do")
	public void managementMenu() {
	}
	@RequestMapping("lectureMenu.do")
	public void lectureMenu() {
	}
	
	@RequestMapping("insertAdmin.do")
	public String insertAdmin(AdminDTO dto) {
		dto.setAdmin_id(dto.getUserid());
		dto.setAdmin_name(dto.getUsername());
		dto.setAdmin_hp(dto.getPhone());
		dto.setAdmin_email(dto.getUseremail());
		String admin_passwd = BCrypt.hashpw(dto.getBpasswd(), BCrypt.gensalt());
		dto.setAdmin_passwd(admin_passwd);
		adminService.insertAdmin(dto);
		return "redirect:/admin/list.do";
	}
	
	@ResponseBody
	@RequestMapping("checkId.do")
	public int idCheck(MemberDTO dto) throws Exception {
		int result=0;
		String exp1="^[A-Za-z0-9]{4,10}$";
		if(dto.getUserid().matches(exp1)) {
			result = memberService.idCheck(dto);
			if(result == 0) {
				String admin_id= dto.getUserid();
				result = adminService.idCheck(admin_id);
				System.out.println(result);
				return result;
			}else {
				System.out.println("여기로감");
				return 1;
			}
		}else {
			System.out.println("일로감");
			return 2;
		}
	}
	
	@RequestMapping(value="/admin_view.do",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ModelAndView view(String admin_id,ModelAndView mav) {
			AdminDTO dto=adminService.viewAdmin(admin_id);
			mav.addObject("dto",dto);
			mav.setViewName("admin/admin_view");
			return mav;
		}
	@RequestMapping("updateAdmin.do")
	public String update(AdminDTO dto) {
		adminService.updateAdmin(dto);
		return "redirect:/admin/list.do";	
	}
	@RequestMapping("deleteAdmin.do")
	public String delete(@RequestParam String admin_id) {
			adminService.deleteAdmin(admin_id);
			return "redirect:/admin/list.do";
	}
}