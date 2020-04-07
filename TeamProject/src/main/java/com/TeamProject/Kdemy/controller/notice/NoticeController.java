package com.TeamProject.Kdemy.controller.notice;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.notice.dto.NoticeDTO;
import com.TeamProject.Kdemy.model.review.dto.ReviewDTO;
import com.TeamProject.Kdemy.service.notice.NoticeService;
import com.TeamProject.Kdemy.service.notice.Notice_Pager;

@Controller
@RequestMapping("notice/*")
public class NoticeController {
	
	@Inject
	NoticeService noticeService;
	
	@Resource(name="uploadPath")
	String uploadPath;

	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage) 
	 throws Exception{
		int count =noticeService.countArticle();
		//페이지 처리
		Notice_Pager pager=new Notice_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<NoticeDTO> list = noticeService.listAll(start, end);
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count",  count);
		map.put("pager", pager);
		mav.setViewName("notice/noticelist");//포워딩
		mav.addObject("map", map);
		return mav;
		
	}//end list
	
	
	
	@RequestMapping("searchlist.do")
	public ModelAndView searchlist(
			@RequestParam(defaultValue = "name") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage) 
	 throws Exception{
		int count =noticeService.searchcountArticle(search_option,keyword);
		//페이지 처리
		Notice_Pager pager=new Notice_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<NoticeDTO> list = noticeService.searchlistAll(search_option, keyword, start, end);
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count",  count);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName("notice/noticesearchlist");//포워딩
		mav.addObject("map", map);
		return mav;
		
	}//end searchlist
	
	@RequestMapping("write.do")
	public String write() {
		//글쓰기 폼 페이지로 이동
		return "notice/noticewrite";
	}// end write()
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute NoticeDTO dto, HttpSession session) throws Exception{
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto");
		noticeService.create(dto);
		return "redirect:/notice/list.do";
	}//end insert
	
	@RequestMapping("view.do")
	public ModelAndView view(@ModelAttribute ReviewDTO dto, int bno, HttpSession session) throws Exception {
		noticeService.increateViewcnt(bno, session);
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeview");
		mav.addObject("dto", noticeService.read(bno));
		return mav;
	}
	
	@RequestMapping("edit/{bno}")
	public ModelAndView update(@PathVariable("bno") int bno, ModelAndView mav) {
		mav.setViewName("notice/noticeedit");
		mav.addObject("dto",noticeService.detailNotice(bno));
		return mav;
	}
	
	
	@RequestMapping("update.do")
	public String update(NoticeDTO dto) throws Exception {
		if(dto != null) {
			noticeService.update(dto);
		}
		//수정 후 상세 화면으로 되돌아감
		return "redirect:/notice/view.do?bno="+dto.getBno();
	}
	
	@RequestMapping("delete/{bno}")
	public String delete(@PathVariable("bno") int bno,  
			@ModelAttribute ReviewDTO dto, HttpSession session) throws Exception{
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		noticeService.delete(bno);
		return "redirect:/notice/list.do";//목록으로 이동
	}
	
	
}
