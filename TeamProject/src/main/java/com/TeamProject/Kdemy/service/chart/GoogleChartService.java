package com.TeamProject.Kdemy.service.chart;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.TeamProject.Kdemy.model.lecture.dto.LectureDTO;

public interface GoogleChartService {
	public JSONObject getChartData();
	public JSONObject getChartData2();
	public JSONObject getChartDatalecture();
	public Map<String, Object> countItems();
	public JSONObject getChartDatamoney();
	public List<LectureDTO> lectureRanking();
	public List<LectureDTO> lectureUpRanking();
}