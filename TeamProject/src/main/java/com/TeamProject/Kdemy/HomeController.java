package com.TeamProject.Kdemy;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.admin.dto.MainDTO;
import com.TeamProject.Kdemy.service.admin.AdminService;
import com.TeamProject.Kdemy.util.UploadFileUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	AdminService adminService;

	@Resource(name="mainResoucePath")
	String mainResoucePath;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		List<MainDTO> list=adminService.resoucelist();
		model.addAttribute("list", list);
		return "home";
	}
	@RequestMapping(value = "main/change.do", method= {RequestMethod.POST},
			consumes=MediaType.MULTIPART_FORM_DATA_VALUE,produces="text/plain;charset=utf-8")
	public String mainChange(MainDTO dto, Model model){
		String background_img0 = "-";
		String background_img1 = "-";
		String icon_img1 = "-";
		String icon_img2 = "-";
		String icon_img3 = "-";
		String icon_img4 = "-";
		String icon_img5 = "-";
		String icon_img6 = "-";
		String icon_img7 = "-";
		String icon_img8 = "-";
		String icon_img9 = "-";
		String icon_img10 = "-";
		System.out.println(dto);
		MultipartFile file0 = dto.getFile0();
		String icon_img0 = file0.getOriginalFilename();
		try {
			icon_img0 = UploadFileUtils.uploadFile(mainResoucePath,icon_img0, file0.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setBackground_img0(background_img0);
		dto.setBackground_img1(background_img1);
		dto.setIcon_img0(icon_img0);
		dto.setIcon_img1(icon_img1);
		dto.setIcon_img2(icon_img2);
		dto.setIcon_img3(icon_img3);
		dto.setIcon_img4(icon_img4);
		dto.setIcon_img5(icon_img5);
		dto.setIcon_img6(icon_img6);
		dto.setIcon_img7(icon_img7);
		dto.setIcon_img8(icon_img8);
		dto.setIcon_img9(icon_img9);
		dto.setIcon_img10(icon_img10);
		adminService.mainChange(dto);
		List<MainDTO> list=adminService.resoucelist();
		model.addAttribute("list", list);
		return "redirect:/";
	}
}