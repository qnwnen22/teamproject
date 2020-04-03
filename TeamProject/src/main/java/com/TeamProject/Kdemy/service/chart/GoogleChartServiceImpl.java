package com.TeamProject.Kdemy.service.chart;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.member.dto.MemberDTO;
import com.TeamProject.Kdemy.service.member.MemberService;

@Service
public class GoogleChartServiceImpl implements GoogleChartService {
	
	@Inject
	MemberService memberService;

	@Override
	public JSONObject getChartData() {
		List<MemberDTO> items=memberService.listTeacher();
		//리턴할 최종 json객체
		JSONObject data=new JSONObject();
		//컬럼을 정의할 json 객체
		JSONObject col1=new JSONObject();
		JSONObject col2=new JSONObject();
		JSONArray title=new JSONArray();
		//json의 cols 객체구성(헤더,제목구성)
		col1.put("label", "상품명");
		col1.put("type", "string");
		col2.put("label", "금액");
		col2.put("type", "number");
		//json 배열에 json 객체 추가
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		//json의 rows 객체구성(바디,내용구성)
		JSONArray body=new JSONArray();
		for(MemberDTO dto : items) {
			JSONObject id=new JSONObject();//JSONObject는 HashMap과 같음
			id.put("v", dto.getUsername());
			JSONObject name=new JSONObject();
			name.put("v", 1);
			JSONArray row=new JSONArray();
			row.add(id);
			row.add(name);
			JSONObject cell=new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		return data;
	}

	@Override
	public String memberchart() {
		return null;
	}
	
	@Override
	public String view() {
		return null;
	}
}