package com.TeamProject.Kdemy.model.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.TeamProject.Kdemy.model.review.dto.ReplyDTO;
@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ReplyDTO> list(int bno) {
		return sqlSession.selectList("review.listReply",bno);
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
		// TODO Auto-generated method stub
		
	}

}
