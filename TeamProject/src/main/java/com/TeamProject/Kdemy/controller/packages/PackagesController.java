package com.TeamProject.Kdemy.controller.packages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("packages/*")
public class PackagesController {
	private static final Logger logerr=LoggerFactory.getLogger(PackagesController.class);
	
	@RequestMapping("list.do")
	public String packagesList(Model model) {
		return "packages/packages_list";
	}
	@RequestMapping("adminlist.do")
	public String adminpackagesList(Model model) {
		return "admin/packages_list";
	}
}