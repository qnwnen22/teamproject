package com.TeamProject.Kdemy.service.review;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.review.dao.ReplyDAO;
import com.TeamProject.Kdemy.model.review.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO replyDao;

	@Override
	public List<ReplyDTO> list(int bno,int start2, int end2) {
		return replyDao.list(bno, start2, end2);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(ReplyDTO dto) {
		replyDao.create(dto);
	}

	@Override
	public void update(ReplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int rno) throws Exception {
		replyDao.delete(rno);
		
	}

	@Override
	public int countReply() throws Exception {
		return replyDao.countReply();
	}


}
