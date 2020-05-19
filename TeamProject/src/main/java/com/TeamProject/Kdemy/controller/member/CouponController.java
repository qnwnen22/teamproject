package com.TeamProject.Kdemy.controller.member;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.member.dto.CouponDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.MemberService;
import com.TeamProject.Kdemy.util.TempKey;

@Controller
@RequestMapping("member/*")
public class CouponController {

	@Inject
	MemberService memberService;
	
	@Inject
	private JavaMailSender mailSender;
	
	@RequestMapping(value="insertCoupon.do",method=RequestMethod.POST)
	public String insertCoupon(CouponDTO dto) throws Exception {
		memberService.insertCoupon(dto);
		return "member/coupon";	
	}
	
	@ResponseBody
	@RequestMapping("/makeCoupon.do")
	public ModelAndView makeCoupon(String[] useremail, CouponDTO dto, HttpServletRequest request, Model model) throws MessagingException, UnsupportedEncodingException {
		String coupon = request.getParameter("coupon");
		String key1 = new TempKey().getKey(4,false); 
	   	String key2 = new TempKey().getKey(4,false); 
	   	String key3 = new TempKey().getKey(4,false); 
	   	String key4 = coupon;
		MimeMessagePreparator[] preparators = new MimeMessagePreparator[useremail.length];
		int i =0;
		for(String str: useremail) {
			MemberDTO dto2 = new MemberDTO();
			dto2.setKey1(key1); 
			dto2.setKey2(key2); 
			dto2.setKey3(key3);
			dto2.setCoupon(key4);
			dto2.setUseremail(str);
			memberService.updateCoupon(dto2);
			System.out.println(dto2.getUseremail());
			preparators[i++] = new MimeMessagePreparator() {
				@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("kdemy11@gmail.com", "kdemy");
					helper.setTo(str);
					helper.setSubject("[kdemy에서 쿠폰을 받으세요!]"); 
					helper.setText(new StringBuffer().append("<div class='img'")
							.append("style='position: absolute;background-image:url(https://modo-phinf.pstatic.net/20200501_271/1588259787861eRWAq_JPEG/mosa3zVWYm.jpeg); width:700px; height:400px; background-size: cover; text-align: center;'>")
							.append("<div class='content'")
							.append("style='position: absolute; top:500px; left:300px; font-size:2rem; color: black; z-index: 100; text-align: center;'>")
							.append("<br><br><br><h6>kdemy에서 쿠폰이 도착했습니다</h6>")
							.append("<h6>"+key1+"--"+key2+"--"+key3+"--"+key4+"</h6></div><a href='http://localhost/Kdemy/' target='_blenk'>KDEMY에서 로그인 하기</a></div>")
							.append("").toString(),true);
					}
				};
			}
		mailSender.send(preparators);
		ModelAndView mav=new ModelAndView();
		mav.addObject("message","쿠폰이 전송되었습니다.");
		mav.setViewName("member/coupon"); 
		return mav;
	}
	
	@ResponseBody
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
	
	@RequestMapping("selectCoupon.do")
	public ModelAndView selectCoupon(ModelAndView mav, CouponDTO dto) {
		dto.setCoupon(dto.getCoupon());
		dto.setCoupon_name(dto.getCoupon_name());
		dto.setCoupon_text(dto.getCoupon_text());
		dto.setPoint(dto.getPoint());
		mav.addObject("select", dto);
		mav.setViewName("member/coupon");
		return mav;
	}
	@RequestMapping("deleteCoupon.do")
	public String deleteCoupon(@RequestParam String coupon) {
		memberService.deleteCoupon(coupon);
		return ("member/coupon");
	}
	
}