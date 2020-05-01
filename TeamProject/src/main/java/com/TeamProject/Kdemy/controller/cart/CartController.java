
package com.TeamProject.Kdemy.controller.cart;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.cart.dto.CartDTO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureReviewDTO;
import com.TeamProject.Kdemy.service.cart.CartService;
import com.TeamProject.Kdemy.service.lecture.LectureService;
import com.TeamProject.Kdemy.util.MediaUtils;
import com.TeamProject.Kdemy.util.UploadFileUtils;

@Controller
@RequestMapping("cart/*")
public class CartController {

	@Inject
	CartService cartService;
	@Inject
	LectureService lectureService;
	
	@Resource(name="uploadPath")
	String uploadPath;	
	
	@RequestMapping("cartPage.do")
	public ModelAndView cartPage(HttpSession session, CartDTO dto) {
	
		ModelAndView mav = new ModelAndView();
		String userid=(String)session.getAttribute("userid");
		int point=cartService.pointCheck(userid);
		
		dto.setUserid(userid);
		List<CartDTO> list=new ArrayList<>();
		list=cartService.cartList(dto);
		mav.addObject("point",point);
		mav.addObject("count",list.size());
		mav.addObject("list",list);
		System.out.println("list:"+list);
		mav.setViewName("cart/cart");
		return mav;
	}
	   
	
//	결제를 위한 장바구니 추가
	@RequestMapping ("insertCart.do")
	public String insertCart(CartDTO dto, HttpSession session) {		
		String userid=(String)session.getAttribute("userid");
		String nickname=(String)session.getAttribute("nickname");
		
		dto.setUserid(userid);
		int check=cartService.cartCheck(dto);
		if(!(check>0)) {
			cartService.insertCart(dto);
		}
		return "redirect:/cart/cartPage.do";
	}
  
  
	@RequestMapping("insertCart2.do")
	public String insertCart2(CartDTO dto, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dto.setUserid(userid);
		int check=cartService.cartCheck(dto);
		if(!(check>0)) {
			cartService.insertCart(dto);
		}
		int lecture_idx=dto.getLecture_idx();

		
		return "redirect:/lecture/lecture_list_view.do?lecture_idx="+lecture_idx;
	}

	@RequestMapping("buyList.do")
	public String buyList(HttpSession session, String[] lecture_idx, 
			String[] cell_type, int count, int price){
		String userid=(String)session.getAttribute("userid");
		String nickname=(String)session.getAttribute("nickname");
		String main_img=(String)session.getAttribute("main_img");
//		멤버 테이블에서 포인트 차감

		cartService.buyLecture(userid,price);
//		장바구니 테이블에서 레코드 삭제 & LectureBox 테이블에 레코드 추가
		for(int i=0; i<count; i++) {
			cartService.buyCart(userid,lecture_idx[i]); 
			cartService.insertLectureBox(userid, nickname, cell_type[i], lecture_idx[i], main_img);
		}
		return "redirect:/member/orderDetail1.do";
	}
	


   @RequestMapping("deleteAll.do")
   public String deleteAll(HttpSession session) {
      //세션변수 조회(로그인 여부 검사)
      String userid = (String)session.getAttribute("userid");
         cartService.deleteAll(userid);
      //장바구니 목록으로 이동
      return "redirect:/cart/cartPage.do";
   }
   
   @RequestMapping("delete.do")
   public String delete(@RequestParam String cart_idx, 
         HttpSession session) {
         cartService.delete(cart_idx);
         return "redirect:/cart/cartPage.do";
   }
   
   @RequestMapping("pointCharge.do")
   public String pointCharge(HttpSession session) {
      String userid=(String)session.getAttribute("userid");
      cartService.pointCharge(userid);
      return "redirect:/cart/cartPage.do"; 
   }
   
   @ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
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
	
}