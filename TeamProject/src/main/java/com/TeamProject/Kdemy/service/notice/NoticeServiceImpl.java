package com.TeamProject.Kdemy.service.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.TeamProject.Kdemy.model.notice.dao.NoticeDAO;
import com.TeamProject.Kdemy.model.notice.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	NoticeDAO noticeDao;

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
	public void create(NoticeDTO dto) throws Exception {
		noticeDao.create(dto);
		String[] files=dto.getFiles();
		if(files==null) return;
		for(String name : files) {
			noticeDao.addAttach(name);
		}
	}

	@Override
	public void update(NoticeDTO dto) throws Exception {
		noticeDao.update(dto);
		
		
	}

	@Override
	public void delete(int bno) throws Exception {
		noticeDao.delete(bno);
	}

	@Override
	public List<NoticeDTO> listAll(int start, int end) throws Exception {
		return noticeDao.listAll(start, end);
	}
	@Override
	public List<NoticeDTO> listAll2() throws Exception {
		return noticeDao.listAll2();
	}
	
	@Override
	public List<NoticeDTO> searchlistAll(String search_option, String keyword, int start, int end) throws Exception {
		return noticeDao.searchlistAll(search_option,keyword, start, end);
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
			noticeDao.increateViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
		
	}

	@Override
	public int countArticle() throws Exception {
		return noticeDao.countArticle();
	}
	
	@Override
	public int searchcountArticle(String search_option, String keyword) throws Exception {
		return noticeDao.searchcountArticle(search_option, keyword);
	}

	@Override
	public NoticeDTO read(int bno) throws Exception {
		return noticeDao.read(bno);
	}

	@Override
	public NoticeDTO detailNotice(int bno) {
		return noticeDao.detailNotice(bno);
	}

}
