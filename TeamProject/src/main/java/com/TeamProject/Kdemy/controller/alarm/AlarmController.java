package com.TeamProject.Kdemy.controller.alarm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProject.Kdemy.model.alarm.dto.AlarmDTO;
import com.TeamProject.Kdemy.service.alarm.AlarmService;

@Controller
@RequestMapping("alarm/*")
public class AlarmController {
	@Inject
	AlarmService alarmService;
	
	@RequestMapping("checking.do")
	@ResponseBody
	public void alarmCheck(int alarm_id) {
		alarmService.alarmCheck(alarm_id);
	}
	
	@ResponseBody
	@RequestMapping("adminAlarmList.do")
	public ModelAndView adminAlarmList(ModelAndView mav,HttpSession session,
			@RequestParam(defaultValue="1") int curPage,String admin_id) throws Exception{
		List<AlarmDTO> list=new ArrayList<>();
		int count =alarmService.countalarmList(admin_id);
		
		AlarmPager pager=new AlarmPager(count,curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		list=alarmService.alarmList(admin_id,start,end);
		Map<String, Object> map=new HashMap<>();
		map.put("alarmlist", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager);
		mav.addObject("map",map);
		mav.setViewName("alarm/adminAlarmList");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("userAlarmList.do")
	public ModelAndView userAlarmList(ModelAndView mav,HttpSession session,
			@RequestParam(defaultValue="1") int curPage,String userid) throws Exception{
		List<AlarmDTO> list=new ArrayList<>();
		int count =alarmService.countalarmList(userid);
		
		AlarmPager pager=new AlarmPager(count,curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		list=alarmService.alarmList(userid,start,end);
		Map<String, Object> map=new HashMap<>();
		map.put("alarmlist", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager);
		mav.addObject("map",map);
		mav.setViewName("alarm/userAlarmList");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("tadminAlarmList.do")
	public ModelAndView tadminAlarmList(ModelAndView mav,HttpSession session,
			@RequestParam(defaultValue="1") int curPage,String admin_id) throws Exception{
		List<AlarmDTO> list=new ArrayList<>();
		int count =alarmService.countalarmList(admin_id);
		
		AlarmPager pager=new AlarmPager(count,curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		list=alarmService.alarmList(admin_id,start,end);
		Map<String, Object> map=new HashMap<>();
		map.put("alarmlist", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager);
		mav.addObject("map",map);
		mav.setViewName("alarm/tadminAlarmList");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("tuserAlarmList.do")
	public ModelAndView tuserAlarmList(ModelAndView mav,HttpSession session,
			@RequestParam(defaultValue="1") int curPage,String userid) throws Exception{
		List<AlarmDTO> list=new ArrayList<>();
		int count =alarmService.countalarmList(userid);
		
		AlarmPager pager=new AlarmPager(count,curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		list=alarmService.alarmList(userid,start,end);
		Map<String, Object> map=new HashMap<>();
		map.put("alarmlist", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager);
		mav.addObject("map",map);
		mav.setViewName("alarm/tuserAlarmList");
		return mav;
	}

}
