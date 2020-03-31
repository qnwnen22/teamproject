package com.TeamProject.Kdemy.controller.admin;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

//github.com/qnwnen22/teamproject.git

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.service.admin.AdminService;
@RestController 
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
		String admin_id=dto.getAdmin_id();
		String admin_passwd=dto.getAdmin_passwd();
		String admin_name=dto.getAdmin_name();
		String admin_hp=dto.getAdmin_hp();
		String admin_email=dto.getAdmin_email();
		int admin_level=dto.getAdmin_level();
		dto.setAdmin_id(admin_id);
		dto.setAdmin_passwd(admin_passwd);
		dto.setAdmin_name(admin_name);
		dto.setAdmin_hp(admin_hp);
		dto.setAdmin_email(admin_email);
		dto.setAdmin_level(admin_level);
		adminService.insertAdmin(dto);
		return "redirect:/admin/list.do";
	}
	
//	@ResponseBody
//	@RequestMapping("view.do")
//	public String view(@RequestParam String admin_id, Model model) {
//		model.addAttribute("dto", adminService.viewAdmin(admin_id));
//		return "admin/view";
//	}
	@RequestMapping(value="/view.do",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public Model view(String admin_id, Model model) {
		if(admin_id!=null) {
			AdminDTO dto=adminService.viewAdmin(admin_id);
			model.addAttribute("dto",dto);
			return model;
			}
		return model;
		}
	@RequestMapping("updateAdmin.do")
	public String update(AdminDTO dto) {
		String admin_id=dto.getAdmin_id();
		String admin_passwd=dto.getAdmin_passwd();
		String admin_name=dto.getAdmin_name();
		String admin_hp=dto.getAdmin_hp();
		String admin_email=dto.getAdmin_email();
		int admin_level=dto.getAdmin_level();
		dto.setAdmin_id(admin_id);
		dto.setAdmin_passwd(admin_passwd);
		dto.setAdmin_name(admin_name);
		dto.setAdmin_hp(admin_hp);
		dto.setAdmin_email(admin_email);
		dto.setAdmin_level(admin_level);
		adminService.updateAdmin(dto);
		return "redirect:/admin/list.do";
	}
	@RequestMapping("deleteAdmin.do")
	public String delete(@RequestParam String admin_id) {
			adminService.deleteAdmin(admin_id);
			return "redirect:/admin/list.do";
	}
}