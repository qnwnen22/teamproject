package com.TeamProject.Kdemy;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.TeamProject.Kdemy.model.admin.dto.MainDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.admin.AdminService;
import com.TeamProject.Kdemy.service.member.MemberService;
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
	
	@Inject
	MemberService memberService;

	 @RequestMapping("cookie.do")
		public String testCookie( MemberDTO dto, @CookieValue(value = "loginCookie") Cookie cookieValue, Model model,HttpSession session) throws Exception {	  
		 String userid =  cookieValue.getValue();
		 dto.setUserid(userid);
		 System.out.println(cookieValue.getValue());
		  if(cookieValue != null) {	
				MemberDTO dto2=memberService.kdemyLogin(dto);
				session.setAttribute("userid", dto2.getUserid());
				session.setAttribute("nickname", dto2.getNickname());
				session.setAttribute("username", dto2.getUsername());
				session.setAttribute("useremail", dto2.getUseremail());
				session.setAttribute("passwd", dto2.getPasswd());
				session.setAttribute("teacher", dto2.getTeacher());
				model.addAttribute("dto", dto2);	

	  }
		  return "redirect:/";
	}

	@RequestMapping(value = "main/change.do", method= {RequestMethod.POST},
			consumes=MediaType.MULTIPART_FORM_DATA_VALUE,produces="text/plain;charset=utf-8")
	public String mainChange(MainDTO dto, Model model, @RequestParam(defaultValue ="-") String background_img0,@RequestParam(defaultValue ="-") String background_img1){
		HashMap<String, MultipartFile> map1 = new HashMap<>();
		map1.put("icon_img0",dto.getFile0());
		map1.put("icon_img1",dto.getFile1());
		map1.put("icon_img2",dto.getFile2());
		map1.put("icon_img3",dto.getFile3());
		map1.put("icon_img4",dto.getFile4());
		map1.put("icon_img5",dto.getFile5());
		map1.put("icon_img6",dto.getFile6());
		map1.put("icon_img7",dto.getFile7());
		map1.put("icon_img8",dto.getFile8());
		map1.put("icon_img9",dto.getFile9());
		map1.put("icon_img10",dto.getFile10());
		String icon_img0 = dto.getFile0().getOriginalFilename();
		String icon_img1 = dto.getFile1().getOriginalFilename();
		String icon_img2 = dto.getFile2().getOriginalFilename();
		String icon_img3 = dto.getFile3().getOriginalFilename();
		String icon_img4 = dto.getFile4().getOriginalFilename();
		String icon_img5 = dto.getFile5().getOriginalFilename();
		String icon_img6 = dto.getFile6().getOriginalFilename();
		String icon_img7 = dto.getFile7().getOriginalFilename();
		String icon_img8 = dto.getFile8().getOriginalFilename();
		String icon_img9 = dto.getFile9().getOriginalFilename();
		String icon_img10 = dto.getFile10().getOriginalFilename();
		HashMap<String, String> map = new HashMap<>();
		map.put("icon_img0",icon_img0);
		map.put("icon_img1",icon_img1);
		map.put("icon_img2",icon_img2);
		map.put("icon_img3",icon_img3);
		map.put("icon_img4",icon_img4);
		map.put("icon_img5",icon_img5);
		map.put("icon_img6",icon_img6);
		map.put("icon_img7",icon_img7);
		map.put("icon_img8",icon_img8);
		map.put("icon_img9",icon_img9);
		map.put("icon_img10",icon_img10);
		
		try {
			Iterator<String> keys = map.keySet().iterator();
			while (keys.hasNext()) {
			    String key = keys.next();
			    if(map.get(key).equals("")) {
					/* String column = key.substring(0, 9); */
			    	String icon_img = adminService.resoucelist1(key);
			    	System.out.println(key);
			    	map.put(key, icon_img);
			    	System.out.println(icon_img);
				}else {
					String icon_img = UploadFileUtils.uploadFile(mainResoucePath,map.get(key), map1.get(key).getBytes());
					map.put(key, icon_img);
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setBackground_img0(background_img0);
		dto.setBackground_img1(background_img1);
		dto.setIcon_img0(map.get("icon_img0"));
		dto.setIcon_img1(map.get("icon_img1"));
		dto.setIcon_img2(map.get("icon_img2"));
		dto.setIcon_img3(map.get("icon_img3"));
		dto.setIcon_img4(map.get("icon_img4"));
		dto.setIcon_img5(map.get("icon_img5"));
		dto.setIcon_img6(map.get("icon_img6"));
		dto.setIcon_img7(map.get("icon_img7"));
		dto.setIcon_img8(map.get("icon_img8"));
		dto.setIcon_img9(map.get("icon_img9"));
		dto.setIcon_img10(map.get("icon_img10"));
		adminService.mainChange(dto);
		return "redirect:/";
	}
}