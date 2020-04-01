package com.TeamProject.Kdemy.controller.footermenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("footermenu/*")
public class FooterMenuController {
	@RequestMapping("withus.do")
	public void withus() {
		
	}
}