package com.TeamProject.Kdemy.service.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.TeamProject.Kdemy.model.review.dto.ReviewDTO;

public interface ReviewService {
	public void deleteFile(String fullName); //첨부파일 삭제v
	public List<String> getAttach(int bno); //첨부파일 정보v
	public void create(ReviewDTO dto) throws Exception; //글쓰기v 
	public void update(ReviewDTO dto) throws Exception; //글수정v
	public void delete(int bno) throws Exception; //글삭제v
	public List<ReviewDTO> listAll( int start, int end) throws Exception;//목록v
	public List<ReviewDTO> searchlistAll(String search_option,String keyword, int start, int end) throws Exception;//목록v
	public void increateViewcnt(int bno, HttpSession session) throws Exception;//조회수 증가 처리v
	public int countArticle() throws Exception;//레코드 갯수 계산v
	public int searchcountArticle(String search_option, String keyword) throws Exception;//레코드 갯수 계산v
	public ReviewDTO read(int bno) throws Exception;//레코드 조회v
	public ReviewDTO detailReview(int bno);
	
}
