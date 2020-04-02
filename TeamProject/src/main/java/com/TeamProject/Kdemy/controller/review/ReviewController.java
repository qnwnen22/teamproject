package com.TeamProject.Kdemy.controller.review;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.review.dto.ReviewDTO;
import com.TeamProject.Kdemy.service.review.ReviewService;
import com.TeamProject.Kdemy.service.review.Review_Pager;

@Controller
@RequestMapping("review/*")
public class ReviewController {
	
	@Inject
	ReviewService reviewService;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage) 
	 throws Exception{
		int count =reviewService.countArticle();
		//페이지 처리
		Review_Pager pager=new Review_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<ReviewDTO> list = reviewService.listAll(start, end);
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("reviewlist", list);
		map.put("count",  count);
		map.put("pager", pager);
		mav.setViewName("review/reviewlist");//포워딩
		mav.addObject("map", map);
		return mav;
		
	}//end list
	

	@RequestMapping("searchlist.do")
	public ModelAndView searchlist(
			@RequestParam(defaultValue = "name") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage) 
	 throws Exception{
		int count =reviewService.searchcountArticle(search_option,keyword);
		//페이지 처리
		Review_Pager pager=new Review_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<ReviewDTO> list = reviewService.searchlistAll(search_option, keyword, start, end);
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("reviewlist", list);
		map.put("count",  count);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName("review/reviewsearchlist");//포워딩
		mav.addObject("map", map);
		return mav;
		
	}//end searchlist
	
	@RequestMapping("write.do")
	public String write() {
		//글쓰기 폼 페이지로 이동
		return "review/reviewwrite";
	}// end write()
	

}
