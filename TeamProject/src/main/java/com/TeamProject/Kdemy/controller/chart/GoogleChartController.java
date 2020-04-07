package com.TeamProject.Kdemy.controller.chart;
import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.service.chart.GoogleChartService;

@RestController //ajax =>json으로 리턴(스프링4.0부터 지원)
//만약 일반 Controller로 쓰게 되면 메소드에 @ResponseBody를 써야 json으로 리턴
@RequestMapping("chart/*")
public class GoogleChartController {
	@Inject
	GoogleChartService googleChartService;
	
	@RequestMapping("statistics.do")
	public ModelAndView view() {
		return new ModelAndView("admin/statistics");
	}
	
	@RequestMapping("memberchart.do")
	public ModelAndView memberchart() {
		return new ModelAndView("chart/memberchart");
	}
	
	@RequestMapping("lecturechart.do")
	public ModelAndView lecturechart() {
		System.out.println("lecturechart 실행...............");
		return new ModelAndView("chart/lecturechart");
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
		System.out.println("lecture_list 실행...............");
		return googleChartService.getChartDatalecture();
	}
}