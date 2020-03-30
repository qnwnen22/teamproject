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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		
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
		// TODO Auto-generated method stub
		
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
		// TODO Auto-generated method stub
		return null;
	}

}
