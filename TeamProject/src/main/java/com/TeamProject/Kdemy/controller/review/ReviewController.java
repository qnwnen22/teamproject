package com.TeamProject.Kdemy.controller.review;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
//github.com/qnwnen22/teamproject.git
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
//github.com/qnwnen22/teamproject.git
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.review.dto.ReplyDTO;
import com.TeamProject.Kdemy.model.review.dto.ReviewDTO;
import com.TeamProject.Kdemy.service.review.ReplyService;
import com.TeamProject.Kdemy.service.review.ReviewService;
import com.TeamProject.Kdemy.service.review.Review_Pager;
import com.TeamProject.Kdemy.service.review.Review_Pager2;
import com.TeamProject.Kdemy.util.MediaUtils;
import com.TeamProject.Kdemy.util.UploadFileUtils;

@Controller
@RequestMapping("review/*")
public class ReviewController {
	
	@Inject
	ReviewService reviewService;
	
	@Inject
	ReplyService replyService;
	
	@Resource(name="reviewuploadPath")
	String reviewuploadPath;
	
	
	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage) 
	 throws Exception{
		int count =reviewService.countArticle();
		//페이지 처리
		Review_Pager pager=new Review_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<ReviewDTO> list = reviewService.listAll(start, end);
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("reviewlist", list);
		map.put("count",  count);
		map.put("pager", pager);
		mav.setViewName("review/reviewlist");//포워딩
		mav.addObject("map", map);
		return mav;
	}//end list
	
	@RequestMapping("replylist.do")
	public ModelAndView replylist(@RequestParam(defaultValue="1") int curPage, int bno, ModelAndView mav) throws Exception {
		int countReply =replyService.countReply();
		System.out.println(countReply);
		Review_Pager2 pager2=new Review_Pager2(countReply, curPage);
		int start2=pager2.getPageBegin();
		int end2=pager2.getPageEnd();
		List<ReplyDTO> list=replyService.list(bno,start2, end2);
		HashMap<String, Object> map=new HashMap<>();
		map.put("replylist", list);
		map.put("count2",  countReply);
		map.put("pager2", pager2);
		map.put("bno", bno);
		mav.setViewName("review/reply_list");
		mav.addObject("map", map);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("view.do")
	public ModelAndView view(@RequestParam(defaultValue="1") int curPage, @ModelAttribute ReviewDTO dto, int bno, HttpSession session) throws Exception {
		int count =reviewService.countArticle();
		//페이지 처리
		Review_Pager pager=new Review_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		reviewService.increateViewcnt(bno, session);
		
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		
		List<ReviewDTO> list = reviewService.listAll(start, end);
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("reviewlist", list);
		map.put("count",  count);
		map.put("pager", pager);
		mav.setViewName("review/reviewview");
		mav.addObject("map", map);
		mav.addObject("dto", reviewService.read(bno));
		return mav;
	}
	

	
	

	

	@RequestMapping("searchlist.do")
	public ModelAndView searchlist(
			@RequestParam(defaultValue = "name") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage) 
	 throws Exception{
		int count =reviewService.searchcountArticle(search_option,keyword);
		//페이지 처리
		Review_Pager pager=new Review_Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<ReviewDTO> list = reviewService.searchlistAll(search_option, keyword, start, end);
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("reviewlist", list);
		map.put("count",  count);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName("review/reviewsearchlist");//포워딩
		mav.addObject("map", map);
		return mav;
		
	}//end searchlist
	
	@RequestMapping("write.do")
	public String write() {
		//글쓰기 폼 페이지로 이동
		return "review/reviewwrite";
	}// end write()
	
	@RequestMapping("write2.do")
	public String write2() {
		//글쓰기 폼 페이지로 이동
		return "review/test";
	}// end write()
	
	
	@RequestMapping(value="insert.do", method= {RequestMethod.POST},
	         consumes=MediaType.MULTIPART_FORM_DATA_VALUE, produces="text/plain;charset=utf-8")
	public String insert(ReviewDTO dto, HttpSession session) throws Exception{
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		reviewService.create(dto);
		return ("redirect:/review/list.do");
	}//end insert
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjax(MultipartFile file, String str, HttpSession session,
			HttpServletRequest request, Model model) throws Exception {
            //logger.info("originalName: " + file.getOriginalFilename());
			ResponseEntity<String> img_path = new ResponseEntity<>(
					UploadFileUtils.uploadFile(reviewuploadPath, file.getOriginalFilename(), file.getBytes()),
					HttpStatus.CREATED);
			String fullName = (String) img_path.getBody();
			//logger.info(thumbnail);
			ReviewDTO dto = new ReviewDTO();
			dto.setFullName(fullName);
		    String userid = (String) session.getAttribute("userid");
			dto.setWriter(userid);
			//logger.info("file name : " + thumbnail);
			reviewService.update_fullName(dto);
			return fullName;
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fullName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;


		try {

			String formatName = fullName.substring(fullName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(reviewuploadPath + fullName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {

				fullName = fullName.substring(fullName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; fullName=\"" + new String(fullName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping("edit/{bno}")
	public ModelAndView update(@PathVariable("bno") int bno, ModelAndView mav) {
		mav.setViewName("review/reviewedit");
		mav.addObject("dto",reviewService.detailReview(bno));
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(ReviewDTO dto) throws Exception {
		String fullName="-";
		if(!dto.getFile1().isEmpty()) {
		MultipartFile file1=dto.getFile1();
		fullName=file1.getOriginalFilename();
		try {
			String path="C:/Users/mr02-06/git/teamproject/TeamProject/src/main/webapp/WEB-INF/views/include/images/review";
			new File(path).mkdir();
			fullName=UploadFileUtils.uploadFile(reviewuploadPath, fullName, file1.getBytes());
			System.out.println(fullName);
			dto.getFile1().transferTo(new File(path+fullName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setFullName(fullName);
		}else {
			ReviewDTO dto2=reviewService.detailReview(dto.getBno());
			dto.setFullName(dto2.getFullName());
		}
		
			reviewService.update(dto);
		//수정 후 상세 화면으로 되돌아감
		return "redirect:/review/view.do?bno="+dto.getBno();
	}
	
	@RequestMapping("delete/{bno}")
	public String delete(@PathVariable("bno") int bno,  
			@ModelAttribute ReviewDTO dto, HttpSession session) throws Exception{
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		reviewService.delete(bno);
		return "redirect:/review/list.do";//목록으로 이동
	}
	
	
	
	
	@RequestMapping("replyinsert.do")
	@ResponseBody
	public void replyinsert(ReplyDTO dto, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dto.setReplyer(userid);
		replyService.create(dto);
	}
	

	
	@RequestMapping("replydelete/{rno}+{bno}")
	public String delete(@PathVariable("rno") int rno,@PathVariable("bno") int bno,   
			@ModelAttribute ReplyDTO dto, HttpSession session) throws Exception{
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		replyService.delete(rno);
		return "redirect:/review/view.do?bno="+bno;
		//목록으로 이동
	}
	
	


	

}
