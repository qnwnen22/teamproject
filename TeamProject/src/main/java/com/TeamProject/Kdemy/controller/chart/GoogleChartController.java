package com.TeamProject.Kdemy.controller.chart;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;
import com.TeamProject.Kdemy.service.chart.GoogleChartService;
import com.TeamProject.Kdemy.service.lecture.LectureService;
import com.TeamProject.Kdemy.service.member.MemberService;

@RestController //ajax =>json으로 리턴(스프링4.0부터 지원)
//만약 일반 Controller로 쓰게 되면 메소드에 @ResponseBody를 써야 json으로 리턴
@RequestMapping("chart/*")
public class GoogleChartController {
	@Inject
	GoogleChartService googleChartService;
	
	@Inject
	MemberService memberService;
	
	@Inject
	LectureService lectureService;
	
	@RequestMapping("statistics.do")
	public ModelAndView view(ModelAndView mav) {
		Map<String, Object>map=googleChartService.countItems();
		mav.addObject("map",map);
		mav.setViewName("admin/statistics");
		return mav;
	}
	
	@RequestMapping("memberchart.do")
	public ModelAndView memberchart(ModelAndView mav) {
		Map<String, Object>map=googleChartService.countItems();
		mav.addObject("map",map);
		mav.setViewName("chart/memberchart");
		return mav;
	}
	
	@RequestMapping("lecturechart.do")
	public ModelAndView lecturechart(ModelAndView mav) {
		Map<String, Object>map=googleChartService.countItems();
		List<LectureDTO> list = googleChartService.lectureUpRanking();
		mav.addObject("map",map);
		mav.addObject("list",list);
		mav.setViewName("chart/lecturechart");
		return mav;
	}
	@RequestMapping("saleschart.do")
	public ModelAndView saleschart(ModelAndView mav) {
		Map<String, Object>map=googleChartService.countItems();
		List<LectureDTO> list = googleChartService.lectureRanking();
		mav.addObject("map",map);
		mav.addObject("list",list);
		mav.setViewName("chart/saleschart");
		return mav;
	}
	
	@RequestMapping("member_list.do")
	public JSONObject member_list() {
		return googleChartService.getChartData();
	}
	
	@RequestMapping("member_list2.do")
	public JSONObject member_list2() {
		return googleChartService.getChartData2();
	}
	
	@RequestMapping("lecture_list.do")
	public JSONObject lecture_list() {
		return googleChartService.getChartDatalecture();
	}
	
	@RequestMapping("money_list.do")
	public JSONObject money_list() {
		return googleChartService.getChartDatamoney();
		
	}
}