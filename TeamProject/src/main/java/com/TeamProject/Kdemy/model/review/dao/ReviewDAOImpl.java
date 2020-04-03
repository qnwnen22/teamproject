package com.TeamProject.Kdemy.model.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.review.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	SqlSession sqlSession;
	
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
	public void addAttach(String fullName) {
		sqlSession.insert("review.addAttach", fullName);
	}

	@Override
	public void updateAttach(String fullName, int bno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void create(ReviewDTO dto) throws Exception {
		sqlSession.insert("review.insert", dto);
		
	}

	@Override
	public void update(ReviewDTO dto) throws Exception {
		sqlSession.update("review.update", dto);
		
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("review.delete", bno);
	}

	@Override
	public List<ReviewDTO> listAll(int start, int end) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("review.listAll", map);
	}

	@Override
	public List<ReviewDTO> searchlistAll(String search_option, String keyword, int start, int end) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("review.searchlistAll", map);
	}

	@Override
	public void increateViewcnt(int bno) throws Exception {
		sqlSession.update("review.increateViewcnt",bno);
		
	}

	@Override
	public int countArticle() throws Exception {
		Map<String, String> map=new HashMap<>();
		return sqlSession.selectOne("review.countArticle");
	}

	@Override
	public int searchcountArticle(String search_option, String keyword) throws Exception {
		Map<String, String> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("review.searchcountArticle",map);// TODO Auto-generated method stub
	}

	@Override
	public ReviewDTO read(int bno) throws Exception {
		return sqlSession.selectOne("review.read", bno);
	}

	@Override
	public ReviewDTO detailReview(int bno) {
		return sqlSession.selectOne("review.detail_review", bno);
	}

}
