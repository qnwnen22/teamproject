package com.TeamProject.Kdemy.controller.review;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.review.dto.ReplyDTO;
import com.TeamProject.Kdemy.model.review.dto.ReviewDTO;
import com.TeamProject.Kdemy.service.review.ReplyService;
import com.TeamProject.Kdemy.service.review.ReviewService;
import com.TeamProject.Kdemy.service.review.Review_Pager;

@RestController
@RequestMapping("review/*")
public class ReviewController {
	
	@Inject
	ReviewService reviewService;
	
	@Inject
	ReplyService replyService;
	
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
	
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute ReviewDTO dto, HttpSession session) throws Exception{
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto");
		reviewService.create(dto);
		return "redirect:/review/list.do";
	}//end insert
	
	@RequestMapping("view.do")
	public ModelAndView view(@ModelAttribute ReviewDTO dto, int bno, HttpSession session) throws Exception {
		reviewService.increateViewcnt(bno, session);
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("review/reviewview");
		mav.addObject("dto", reviewService.read(bno));
		return mav;
	}
	
	@RequestMapping("edit/{bno}")
	public ModelAndView update(@PathVariable("bno") int bno, ModelAndView mav) {
		mav.setViewName("review/reviewedit");
		mav.addObject("dto",reviewService.detailReview(bno));
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(ReviewDTO dto) throws Exception {
		if(dto != null) {
			reviewService.update(dto);
		}
		//수정 후 상세 화면으로 되돌아감
		return "redirect:/review/view.do?bno="+dto.getBno();
	}
	
	@RequestMapping("delete/{bno}")
	public String delete(@PathVariable("bno") int bno,  
			@ModelAttribute ReviewDTO dto, HttpSession session) throws Exception{
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		reviewService.delete(bno);
		return "redirect:/review/list.do";//목록으로 이동
	}
	
	@RequestMapping("replyinsert.do")
	public void replyinsert(ReplyDTO dto, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dto.setReplyer(userid);
		replyService.create(dto);
	}
	
	@RequestMapping("replylist.do")
	public ModelAndView replylist(int bno, ModelAndView mav) {
		List<ReplyDTO> list=replyService.list(bno);
		mav.setViewName("review/reply_list");
		mav.addObject("replylist", list);
		return mav;
	}
	
	@RequestMapping("delete/{rno}")
	public String delete(@PathVariable("rno") int rno,  
			@ModelAttribute ReplyDTO dto, HttpSession session) throws Exception{
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		replyService.delete(rno);
		return "redirect:/review/list.do";//목록으로 이동
	}
	
	
	

}
