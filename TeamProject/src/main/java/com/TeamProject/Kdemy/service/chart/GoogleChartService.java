package com.TeamProject.Kdemy.service.chart;

import java.util.Map;

import org.json.simple.JSONObject;

public interface GoogleChartService {
	public JSONObject getChartData();
	public JSONObject getChartData2();
	public JSONObject getChartDatalecture();
	public Map<String, Object> countItems();
}