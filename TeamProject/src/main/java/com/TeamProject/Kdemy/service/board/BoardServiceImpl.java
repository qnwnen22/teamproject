package com.TeamProject.Kdemy.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.TeamProject.Kdemy.model.board.dao.BoardDAO;
import com.TeamProject.Kdemy.model.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO boardDao;

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public void create(BoardDTO dto) throws Exception {
		boardDao.create(dto);
		String[] files=dto.getFiles();
		if(files==null) return;
		for(String name : files) {
			boardDao.addAttach(name);
		}
	}

	@Override
	public void update(BoardDTO dto) throws Exception {
		boardDao.update(dto);
		
		
	}

	@Override
	public void delete(int bno) throws Exception {
		boardDao.delete(bno);
	}

	@Override
	public List<BoardDTO> listAll(int start, int end) throws Exception {
		return boardDao.listAll(start, end);
	}
	
	@Override
	public List<BoardDTO> searchlistAll(String search_option, String keyword, int start, int end) throws Exception {
		return boardDao.searchlistAll(search_option,keyword, start, end);
	}

	@Override
	public void increateViewcnt(int bno, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno)!=null) {
			update_time=(long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		//조회수 증가 처리
		if(current_time-update_time>5*1000) {
			boardDao.increateViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
		
	}

	@Override
	public int countArticle() throws Exception {
		return boardDao.countArticle();
	}
	
	@Override
	public int searchcountArticle(String search_option, String keyword) throws Exception {
		return boardDao.searchcountArticle(search_option, keyword);
	}

	@Override
	public BoardDTO read(int bno) throws Exception {
		return boardDao.read(bno);
	}

	@Override
	public BoardDTO detailBoard(int bno) {
		return boardDao.detailBoard(bno);
	}

}
