package com.TeamProject.Kdemy.controller.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.service.admin.AdminService;

@Controller
@RequestMapping("admin/*") //공통 url mapping
public class AdminController {
	@Inject
	AdminService adminService;
	
	@RequestMapping("list.do")
	public String adminList(Model model) {
		List<AdminDTO> list=adminService.list();
		model.addAttribute("list", list);
		return "admin/admin_list";
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
	
	@ResponseBody
	@RequestMapping(value="/view.do")
	public int view(AdminDTO dto, Model model) {
		System.out.println(dto.getAdmin_id());
		if(dto.getAdmin_id()!=null) {
			model.addAttribute("dto", adminService.viewAdmin(dto.getAdmin_id()));
			return 1;
		}
		return 0;
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