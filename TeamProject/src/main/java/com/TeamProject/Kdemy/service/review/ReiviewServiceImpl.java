package com.TeamProject.Kdemy.service.review;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.review.dao.ReviewDAO;
import com.TeamProject.Kdemy.model.review.dto.ReviewDTO;

@Service
public class ReiviewServiceImpl implements ReviewService {
	
	@Inject
	ReviewDAO reviewDao;

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void create(ReviewDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ReviewDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReviewDTO> listAll(int start, int end) throws Exception {
		return reviewDao.listAll(start, end);
	}

	@Override
	public List<ReviewDTO> searchlistAll(String search_option, String keyword, int start, int end) throws Exception {
		return reviewDao.searchlistAll(search_option, keyword, start, end);
	}

	@Override
	public void increateViewcnt(int bno, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int countArticle() throws Exception {
		return reviewDao.countArticle();
	}

	@Override
	public int searchcountArticle(String search_option, String keyword) throws Exception {
		return reviewDao.searchcountArticle(search_option, keyword);
	}

	@Override
	public ReviewDTO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReviewDTO detailReview(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

}
