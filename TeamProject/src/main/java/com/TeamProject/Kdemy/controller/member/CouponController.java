package com.TeamProject.Kdemy.controller.member;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.MemberService;
import com.TeamProject.Kdemy.util.MailHandler;
import com.TeamProject.Kdemy.util.TempKey;

@Controller
@RequestMapping("member/*")
public class CouponController {

	@Inject
	MemberService memberService;
	
	@Inject
	private JavaMailSender mailSender;

	@ResponseBody
	@RequestMapping(value = "/makeCouponA.do", method = RequestMethod.POST)
	public void makeCouponA(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
		String useremail = request.getParameter("useremail1");
		String key1 = new TempKey().getKey(4,false); 
	   	String key2 = new TempKey().getKey(4,false); 
	   	String key3 = new TempKey().getKey(4,false); 
	   	String key4 = "8G8g";
	
		MemberDTO dto = new MemberDTO();
		dto.setUseremail(useremail);
		dto.setKey1(key1); 
	   	dto.setKey2(key2); 
	   	dto.setKey3(key3);
	   	dto.setCoupon(key4);
		
		memberService.updateCoupon(dto);
			
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[kdemy에서 쿠폰을 받으세요!]");
		sendMail.setText(new StringBuffer().append("<h1>10000포인트 쿠폰 발급</h1>")
				.append("<b>쿠폰 번호 : " + key1+"-"+key2+"-"+key3+"-"+key4+ "</b><br>")
				.append("<a href='http://localhost/Kdemy/")
				.append("' target='_blenk'>KDEMY에서 로그인 하기</a>").toString());
		sendMail.setFrom("kdemy11@gmail.com", "kdemy");
		sendMail.setTo(dto.getUseremail());
		sendMail.send();
	}
	
	@ResponseBody
	@RequestMapping(value = "/makeCouponB.do", method = RequestMethod.POST)
	public void makeCouponB(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
		String useremail = request.getParameter("useremail2");
		String key1 = new TempKey().getKey(4,false); 
	   	String key2 = new TempKey().getKey(4,false); 
	   	String key3 = new TempKey().getKey(4,false); 
	   	String key4 = "BDyC";
	
		MemberDTO dto = new MemberDTO();
		dto.setUseremail(useremail);
		dto.setKey1(key1); 
	   	dto.setKey2(key2); 
	   	dto.setKey3(key3);
	   	dto.setCoupon(key4);
		
		memberService.updateCoupon(dto);
			
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[kdemy에서 쿠폰을 받으세요!]");
		sendMail.setText(new StringBuffer().append("<h1>30000포인트 쿠폰 발급</h1>")
				.append("<b>쿠폰 번호 : " + key1+"-"+key2+"-"+key3+"-"+key4+ "</b><br>")
				.append("<a href='http://localhost/Kdemy/")
				.append("' target='_blenk'>KDEMY에서 로그인 하기</a>").toString());
		sendMail.setFrom("kdemy11@gmail.com", "kdemy");
		sendMail.setTo(dto.getUseremail());
		sendMail.send();
	}
	
	@ResponseBody
	@RequestMapping(value = "/makeCouponC.do", method = RequestMethod.POST)
	public void makeCouponC(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
		String useremail = request.getParameter("useremail3");
		String key1 = new TempKey().getKey(4,false); 
	   	String key2 = new TempKey().getKey(4,false); 
	   	String key3 = new TempKey().getKey(4,false); 
	   	String key4 = "aOnu";
	
		MemberDTO dto = new MemberDTO();
		dto.setUseremail(useremail);
		dto.setKey1(key1); 
	   	dto.setKey2(key2); 
	   	dto.setKey3(key3);
	   	dto.setCoupon(key4);
		
		memberService.updateCoupon(dto);
			
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[kdemy에서 쿠폰을 받으세요!]");
		sendMail.setText(new StringBuffer().append("<h1>50000포인트 쿠폰 발급</h1>")
				.append("<b>쿠폰 번호 : " + key1+"-"+key2+"-"+key3+"-"+key4+ "</b><br>")
				.append("<a href='http://localhost/Kdemy/")
				.append("' target='_blenk'>KDEMY에서 로그인 하기</a>").toString());
		sendMail.setFrom("kdemy11@gmail.com", "kdemy");
		sendMail.setTo(dto.getUseremail());
		sendMail.send();
	}
}
