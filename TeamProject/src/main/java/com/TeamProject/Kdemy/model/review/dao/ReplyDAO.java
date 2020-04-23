package com.TeamProject.Kdemy.model.review.dao;

import java.util.List;

import com.TeamProject.Kdemy.model.review.dto.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(int bno,int start2, int end2);
	public int count(int bno);
	public void create(ReplyDTO dto);
	public void update(ReplyDTO dto) throws Exception; //글수정
	public void delete(int rno) throws Exception; //글삭제
	public int countReply() throws Exception;//레코드 갯수 계산
}
