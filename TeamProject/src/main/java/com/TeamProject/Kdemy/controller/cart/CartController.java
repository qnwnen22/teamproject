package com.TeamProject.Kdemy.controller.cart;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.cart.dto.CartDTO;
import com.TeamProject.Kdemy.service.cart.CartService;
import com.TeamProject.Kdemy.service.lecture.LectureService;

@Controller
@RequestMapping("cart/*")
public class CartController {

	@Inject
	CartService cartService;
	@Inject
	LectureService lectureService;
	
	
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
		mav.setViewName("cart/cart");
		return mav;
	}
//	결제를 위한 장바구니 추가
	@RequestMapping("insertCart.do")
	public String insertCart(CartDTO dto, HttpSession session) {
		
		String userid=(String)session.getAttribute("userid");
		dto.setUserid(userid);
		int check=cartService.cartCheck(dto);
		if(!(check>0)) {
			cartService.insertCart(dto);
		}
		return "redirect:/cart/cartPage.do";
	}
	
	
	@RequestMapping("test.do")
	public String test(String userid, int count, String[] idxList) {
		List<String> list=new ArrayList<>();
		
		for(int i=0; i<count; i++) {
			list.add(idxList[i]);
			System.out.println("userid : "+userid);
			System.out.println("lecture_idx : "+idxList[i]);
			
		}
		return "home";
	}
	@RequestMapping("buyList.do")
	public String buyList(HttpSession session, String[] lecture_idx, 
			String[] cell_type, int count, int price) {
		String userid=(String)session.getAttribute("userid");
//		멤버 테이블에서 포인트 차감
		cartService.buyLecture(userid,price);
//		장바구니 테이블에서 레코드 삭제 & LectureBox 테이블에 레코드 추가
		for(int i=0; i<count; i++) {
			cartService.deleteCart(userid,lecture_idx[i]);
			cartService.insertLectureBox(userid,cell_type[i],lecture_idx[i]);
		}
		return "redirect:/cart/cartPage.do";
	}
	
}
