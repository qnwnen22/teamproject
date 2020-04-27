package com.TeamProject.Kdemy.controller.member;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
import com.TeamProject.Kdemy.model.member.dto.CouponDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.BCrypt;
import com.TeamProject.Kdemy.service.member.MemberService;
import com.TeamProject.Kdemy.util.MailHandler;
import com.TeamProject.Kdemy.util.TempKey;
import com.TeamProject.Kdemy.util.UploadFileUtils;

@Controller
@RequestMapping("member/*")
public class CouponController {

	@Inject
	MemberService memberService;
	
	@Inject
	private JavaMailSender mailSender;
	
	@RequestMapping(value="insertCoupon.do",method=RequestMethod.POST)
	public String insertCoupon(CouponDTO dto) throws Exception {
			
		String coupon_name=dto.getCoupon();
		String coupon=dto.getCoupon();
		int point = dto.getPoint();
		String coupon_text = dto.getCoupon_text();
	
    	dto.setCoupon_name(coupon_name);
		dto.setCoupon(coupon);
		dto.setPoint(point);
		dto.setCoupon_text(coupon_text);
		memberService.insertCoupon(dto);

		return "member/coupon";	
	}
	

	@RequestMapping("/makeCoupon.do")
	public ModelAndView makeCoupon(CouponDTO dto, HttpServletRequest request, Model model) throws MessagingException, UnsupportedEncodingException {
		String useremail = request.getParameter("useremail");
		String coupon = request.getParameter("coupon");
		String key1 = new TempKey().getKey(4,false); 
	   	String key2 = new TempKey().getKey(4,false); 
	   	String key3 = new TempKey().getKey(4,false); 
	   	String key4 = coupon;
	
		MemberDTO dto2 = new MemberDTO();
		dto2.setUseremail(useremail);
		dto2.setKey1(key1); 
	   	dto2.setKey2(key2); 
	   	dto2.setKey3(key3);
	   	dto2.setCoupon(key4);
		ModelAndView mav=new ModelAndView();			
		memberService.updateCoupon(dto2);

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[kdemy에서 쿠폰을 받으세요!]");
		sendMail.setText(new StringBuffer().append("<table style='border:1px solid black; border-radius:10px;'><tbody>")
				.append("<tr style='text-align: center;'><img src='https://modo-phinf.pstatic.net/20200423_57/1587601762341AwFLH_JPEG/mosajn1t3W.jpeg'></tr>")
				.append("<tr class='coupon' style='text-align: center;font-size:1.5rem; color:#422e4a;'>쿠폰 번호 </tr>")
				.append("<tr style='text-align: center;'><span style='padding:5px; font-size:1.5rem;'>"+key1)
				.append("</span>-<span style='padding:5px; font-size:1.5rem;'>"+key2+"</span>-<span style='padding:5px; font-size:1.5rem;'>"+key3)
				.append("</span>-<span style='padding:5px; font-size:1.5rem;'>"+key4+"</span><br>")
				.append("<a href='http://localhost/Kdemy/")
				.append("' target='_blenk'>KDEMY에서 로그인 하기</a></tr></tbody></table>").toString());
		sendMail.setFrom("kdemy11@gmail.com", "kdemy");
		sendMail.setTo(dto2.getUseremail());
		sendMail.send();
		
		mav.addObject("message","이메일이 전송되었습니다.");
		mav.setViewName("member/coupon"); 
		return mav;
	}

	@RequestMapping("couponDetail.do")
	public ModelAndView couponDetail(HttpSession session, CouponDTO dto) {
		ModelAndView mav = new ModelAndView();
		List<CouponDTO> couponList=new ArrayList<>();
		couponList= memberService.couponDetail(dto);
		mav.addObject("couponList",couponList);
		mav.setViewName("member/couponList");
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/checkCoupon.do")
	public int couponCheck(CouponDTO dto) throws Exception {
		String exp1="^[A-Za-z0-9]{4,10}$";
		if(dto.getCoupon().matches(exp1)) {
			int result = memberService.couponCheck(dto);
			return result;			
		}else {
			return 2;
		}
	}
}
	
