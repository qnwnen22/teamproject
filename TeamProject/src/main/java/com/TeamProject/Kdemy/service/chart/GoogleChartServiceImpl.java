package com.TeamProject.Kdemy.service.chart;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.TeamProject.Kdemy.model.lecture.dao.LectureDAO;
import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;
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
	@Inject
	LectureDAO lectureDao;
	
	@Override
	public Map<String, Object> countItems() {
		Map<String, Object> map = new HashMap<>();
		String keyword="";
		String location="";
		int countMember=memberService.countMember(keyword,location);
		int countLecture=lectureService.searchCount(keyword);
		int salesMoney=lectureService.totalMoney();
		System.out.println(salesMoney);
		map.put("totalMoney", salesMoney);
		map.put("countMember", countMember);
		map.put("countLecture", countLecture);
		return map;
	}
	
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
		col1.put("type", "string");
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
	@Override
	public JSONObject getChartDatamoney() {
		List<LectureDTO> items=lectureService.chartCountMoney();
		//리턴할 최종 json객체
		JSONObject data=new JSONObject();
		//컬럼을 정의할 json 객체
		JSONObject col1=new JSONObject();
		JSONObject col2=new JSONObject();
		JSONArray title=new JSONArray();
		//json의 cols 객체구성(헤더,제목구성)
		col1.put("label", "강의타입");
		col1.put("type", "string");
		col2.put("label", "수입");
		col2.put("type", "number");
		//json 배열에 json 객체 추가
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		//json의 rows 객체구성(바디,내용구성)
		JSONArray body=new JSONArray();
		for(LectureDTO dto : items) {
			JSONObject cell_type=new JSONObject();//JSONObject는 HashMap과 같음
			if(dto.getCell_type().equals("1")) {
				dto.setCell_type("동영상 강의");
			}else if(dto.getCell_type().equals("2")) {
				dto.setCell_type("실시간 강의");
			}else{
				dto.setCell_type("오프라인 강의");
			}
			cell_type.put("v", dto.getCell_type());
			JSONObject money=new JSONObject();
			money.put("v", dto.getRevenue());
			JSONArray row=new JSONArray();
			row.add(cell_type);
			row.add(money);
			JSONObject cell=new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		return data;
	}

	@Override
	public List<LectureDTO> lectureRanking() {
		return lectureDao.lectureRanking();
	}

	@Override
	public List<LectureDTO> lectureUpRanking() {
		return lectureDao.lectureUpRanking();
	}
}