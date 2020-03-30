package com.TeamProject.Kdemy.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.board.dto.BoardDTO;
import com.TeamProject.Kdemy.service.board.BoardService;
import com.TeamProject.Kdemy.service.board.Board_Pager;

@Controller
@RequestMapping("board/*")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	@Resource(name="uploadPath")
	String uploadPath;

	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage) 
	 throws Exception{
		int count =boardService.countArticle();
		//페이지 처리
		Board_Pager pager=new Board_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<BoardDTO> list = boardService.listAll(start, end);
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count",  count);
		map.put("pager", pager);
		mav.setViewName("board/boardlist");//포워딩
		mav.addObject("map", map);
		return mav;
		
	}//end list
	
	
	
	@RequestMapping("searchlist.do")
	public ModelAndView searchlist(
			@RequestParam(defaultValue = "name") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage) 
	 throws Exception{
		int count =boardService.searchcountArticle(search_option,keyword);
		//페이지 처리
		Board_Pager pager=new Board_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<BoardDTO> list = boardService.searchlistAll(search_option, keyword, start, end);
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count",  count);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName("board/boardsearchlist");//포워딩
		mav.addObject("map", map);
		return mav;
		
	}//end searchlist
	
	@RequestMapping("write.do")
	public String write() {
		//글쓰기 폼 페이지로 이동
		return "board/boardwrite";
	}// end write()
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute BoardDTO dto, HttpSession session) throws Exception{
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		boardService.create(dto);
		return "redirect:/board/list.do";
	}//end insert
	
	
}
