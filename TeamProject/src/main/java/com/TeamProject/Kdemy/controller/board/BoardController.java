package com.TeamProject.Kdemy.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.board.dto.BoardDTO;
import com.TeamProject.Kdemy.service.board.BoardService;

@Controller
@RequestMapping("board/*")
public class BoardController {
	
	@Inject
	BoardService boardService;

	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue = "name") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage) 
	 throws Exception{
		int count =boardService.countArticle(search_option, keyword);
		//페이지 처리
		
		List<BoardDTO> list = boardService.listAll(search_option, keyword, start, end);
		
				
	}
}
