package com.TeamProject.Kdemy.service.chart;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.lecture.LectureService;
import com.TeamProject.Kdemy.service.member.MemberService;

@Service
public class GoogleChartServiceImpl implements GoogleChartService {
	
	@Inject
	MemberService memberService;
	@Inject
	LectureService lectureService;

	@Override
	public JSONObject getChartData() {
		List<MemberDTO> items=memberService.chartCount();
		//리턴할 최종 json객체
		JSONObject data=new JSONObject();
		//컬럼을 정의할 json 객체
		JSONObject col1=new JSONObject();
		JSONObject col2=new JSONObject();
		JSONArray title=new JSONArray();
		//json의 cols 객체구성(헤더,제목구성)
		col1.put("label", "구분");
		col1.put("type", "string");
		col2.put("label", "가입자수");
		col2.put("type", "number");
		//json 배열에 json 객체 추가
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		//json의 rows 객체구성(바디,내용구성)
		JSONArray body=new JSONArray();
		for(MemberDTO dto : items) {
			JSONObject teacher=new JSONObject();//JSONObject는 HashMap과 같음
			if(dto.getTeacher().equals("y")) {
				dto.setTeacher("강사");
			}else if(dto.getTeacher().equals("n")) {
				dto.setTeacher("일반회원");
			}else{
				dto.setTeacher("강사요청");
			}
			teacher.put("v", dto.getTeacher());
			JSONObject tcount=new JSONObject();
			tcount.put("v", dto.getTcount());
			JSONArray row=new JSONArray();
			row.add(teacher);
			row.add(tcount);
			JSONObject cell=new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		return data;
	}
	
	@Override
	public JSONObject getChartData2() {
		List<MemberDTO> items=memberService.chartCountMonth();
		//리턴할 최종 json객체
		JSONObject data=new JSONObject();
		//컬럼을 정의할 json 객체
		JSONObject col1=new JSONObject();
		JSONObject col2=new JSONObject();
		JSONArray title=new JSONArray();
		//json의 cols 객체구성(헤더,제목구성)
		col1.put("label", "월");
		col1.put("type", "number");
		col2.put("label", "가입자");
		col2.put("type", "number");
		//json 배열에 json 객체 추가
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		//json의 rows 객체구성(바디,내용구성)
		JSONArray body=new JSONArray();
		for(MemberDTO dto : items) {
			JSONObject month=new JSONObject();//JSONObject는 HashMap과 같음
			month.put("v", dto.getJoin_Month());
			JSONObject tcount=new JSONObject();
			tcount.put("v", dto.getTcount());
			JSONArray row=new JSONArray();
			row.add(month);
			row.add(tcount);
			JSONObject cell=new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		return data;
	}
	
	@Override
	public JSONObject getChartDatalecture() {
		List<LectureDTO> items=lectureService.chartCountLecture();
		//리턴할 최종 json객체
		JSONObject data=new JSONObject();
		//컬럼을 정의할 json 객체
		JSONObject col1=new JSONObject();
		JSONObject col2=new JSONObject();
		JSONArray title=new JSONArray();
		//json의 cols 객체구성(헤더,제목구성)
		col1.put("label", "분류");
		col1.put("type", "string");
		col2.put("label", "개수");
		col2.put("type", "number");
		//json 배열에 json 객체 추가
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		//json의 rows 객체구성(바디,내용구성)
		JSONArray body=new JSONArray();
		for(LectureDTO dto : items) {
			JSONObject category=new JSONObject();//JSONObject는 HashMap과 같음
			category.put("v", dto.getMain_category());
			JSONObject tcount=new JSONObject();
			tcount.put("v", dto.getTcount());
			JSONArray row=new JSONArray();
			row.add(category);
			row.add(tcount);
			JSONObject cell=new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		return data;
	}
}