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
		System.out.println("memberchart.do 실행");
		return new ModelAndView("chart/memberchart");
	}
	@RequestMapping("member_list.do")
	public JSONObject member_list() {
		System.out.println("memeber_list.do 실행");
		return googleChartService.getChartData();
	}
	
}