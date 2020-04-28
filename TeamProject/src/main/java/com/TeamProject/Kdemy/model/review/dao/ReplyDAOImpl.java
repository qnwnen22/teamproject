package com.TeamProject.Kdemy.model.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.review.dto.ReplyDTO;
@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ReplyDTO> list(int bno,int start2, int end2) {
		Map<String, Object> map=new HashMap<>();
		map.put("bno", bno);
		map.put("start2", start2);
		map.put("end2", end2);
		return sqlSession.selectList("review.listReply",map);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(ReplyDTO dto) {
		sqlSession.insert("review.insertReply",dto);
		
	}

	@Override
	public void update(ReplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int rno) throws Exception {
		sqlSession.delete("review.replydelete", rno);
	}

	@Override
	public int countReply() throws Exception {
		Map<String, String> map=new HashMap<>();
		return sqlSession.selectOne("review.countReply");
	}


}
