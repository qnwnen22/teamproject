package com.TeamProject.Kdemy.controller.admin;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//github.com/qnwnen22/teamproject.git

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.service.admin.AdminService;
import com.TeamProject.Kdemy.service.member.BCrypt;
@Controller 
@RequestMapping("admin/*") //공통 url mapping
public class AdminController {
	private static final Logger logger 
	= LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	@RequestMapping("list.do")
	public ModelAndView adminList(ModelAndView mav) {
		List<AdminDTO> list=adminService.list();
		mav.setViewName("admin/admin_list");//뷰의 이름
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("insertAdmin.do")
	public String insertAdmin(AdminDTO dto) {
		String admin_passwd = BCrypt.hashpw(dto.getBadmin_passwd(), BCrypt.gensalt());
		dto.setAdmin_passwd(admin_passwd);
		adminService.insertAdmin(dto);
		return "redirect:/admin/list.do";
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