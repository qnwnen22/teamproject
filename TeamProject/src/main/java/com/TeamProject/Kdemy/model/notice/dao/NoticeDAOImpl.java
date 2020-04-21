package com.TeamProject.Kdemy.model.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.notice.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
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
		sqlSession.insert("notice.addAttach", fullName);
	}

	@Override
	public void updateAttach(String fullName, int bno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void create(NoticeDTO dto) throws Exception {
		sqlSession.insert("notice.insert", dto);
		
	}

	@Override
	public void update(NoticeDTO dto) throws Exception {
		sqlSession.update("notice.update", dto);
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("notice.delete", bno);
		
	}

	@Override
	public List<NoticeDTO> listAll(int start, int end) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("notice.listAll", map);
	}
	@Override
	public List<NoticeDTO> listAll2() throws Exception {
		Map<String, Object> map=new HashMap<>();
		return sqlSession.selectList("notice.listAll2", map);
	}
	@Override
	public List<NoticeDTO> searchlistAll(String search_option, String keyword, int start, int end) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("notice.searchlistAll", map);
	}

	@Override
	public void increateViewcnt(int bno) throws Exception {
		sqlSession.update("notice.increateViewcnt", bno);
		
	}

	@Override
	public int countArticle() throws Exception {
		Map<String, String> map=new HashMap<>();
		return sqlSession.selectOne("notice.countArticle");
	}
	
	@Override
	public int searchcountArticle(String search_option, String keyword) throws Exception {
		Map<String, String> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("notice.searchcountArticle",map);
	}

	@Override
	public NoticeDTO read(int bno) throws Exception {
		return sqlSession.selectOne("notice.read", bno);
	}

	@Override
	public NoticeDTO detailNotice(int bno) {
		return sqlSession.selectOne("notice.detail_notice",bno);
				
	}

}
