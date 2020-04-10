package com.TeamProject.Kdemy.service.review;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.review.dao.ReviewDAO;
import com.TeamProject.Kdemy.model.review.dto.LikeDTO;
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
		reviewDao.create(dto);
	}

	@Override
	public void update(ReviewDTO dto) throws Exception {
		reviewDao.update(dto);
	}

	@Override
	public void delete(int bno) throws Exception {
		reviewDao.delete(bno);
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
		long update_time=0;
		if(session.getAttribute("update_time_"+bno)!=null) {
			update_time=(long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		//조회수 증가 처리
		if(current_time-update_time>5*1000) {
			reviewDao.increateViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
		
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
		return reviewDao.read(bno);
	}

	@Override
	public ReviewDTO detailReview(int bno) {
		return reviewDao.detailReview(bno);
	}



}
